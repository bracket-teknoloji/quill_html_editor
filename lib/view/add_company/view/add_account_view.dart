import "dart:convert";

import "package:crypto/crypto.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";

import "../../../core/base/model/base_network_mixin.dart";
import "../../../core/base/model/generic_response_model.dart";
import "../../../core/base/state/base_state.dart";
import "../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../core/init/cache/cache_manager.dart";
import "../model/account_model.dart";
import "../model/account_response_model.dart";

class AddAccountView extends StatefulWidget {
  const AddAccountView({super.key});

  @override
  State<AddAccountView> createState() => _AddAccountViewState();
}

class _AddAccountViewState extends BaseState<AddAccountView> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Firmalar"),
          centerTitle: false,
          actions: [IconButton(onPressed: loginMethod, icon: const Icon(Icons.save))],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: context.padding.normal,
            child: AutofillGroup(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomWidgetWithLabel(
                      text: "Firma E-Posta Adresi",
                      child: CustomTextField(controller: emailController, keyboardType: TextInputType.emailAddress, isMust: true),
                    ),
                    Padding(
                      padding: context.padding.verticalLow,
                      child: CustomWidgetWithLabel(
                        text: "Şifre",
                        child: CustomTextField(keyboardType: TextInputType.visiblePassword, controller: passwordController, isMust: true),
                      ),
                    ),
                    const Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [Icon(Icons.question_mark_rounded), Text("Bilgileri girerken büyük-küçük uyumuna dikkat ediniz.", softWrap: true)],
                    ),
                    Padding(
                      padding: context.padding.verticalLow,
                      child: ElevatedButton(
                          onPressed: () {
                            _getQR(context);
                          },
                          child: const Text("BİLGİLERİ QR KOD'DAN AL")),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Future<void> loginMethod() async {
    if (formKey.currentState!.validate()) {
      String encodedPassword = passwordDecoder(passwordController.text);
      dialogManager.showLoadingDialog("Yükleniyor...");
      AccountModel.instance
        ..uyeEmail = emailController.text
        ..uyeSifre = encodedPassword;
      final response = await networkManager.getUyeBilgileri(emailController.text, getFromCache: false, password: encodedPassword);
      dialogManager.hideAlertDialog;
      if (response.success == true) {
        CacheManager.setHesapBilgileri(AccountModel.instance);
        Get.back(result: true);
        Get.offAndToNamed("/addCompany");
        dialogManager.showSnackBar("Başarılı");
      } else {
        dialogManager.showAlertDialog(response.message ?? "");
      }
    }
  }

  Future<void> _getQR(BuildContext context) async {
    var barcode = await Get.toNamed("/qr");
    GenericResponseModel<NetworkManagerMixin> response;

    if (barcode != null) {
      AccountModel.instance.qrData = barcode;
      response = await networkManager.getUyeBilgileri(null, getFromCache: false, isQR: true);
      // response = await networkManager.dioPost<AccountResponseModel>(
      //   bodyModel: AccountResponseModel(),
      //   addTokenKey: false,
      //   data: data,
      //   path: ApiUrls.getUyeBilgileri,
      // );
      if (response.data != null) {
        if (response.success == true) {
          AccountModel.instance.uyeEmail = response.data.first.email;
          AccountModel.instance.uyeSifre = utf8.decode(base64.decode(response.data.first.parola));
          AccountModel.instance.qrData = null;
          for (AccountResponseModel item in response.data!) {
            if (!CacheManager.accountsBox.containsKey(item.email)) {
              Get.back(result: true);
              Get.offAndToNamed("/addCompany");
              CacheManager.setHesapBilgileri(AccountModel.instance);
              CacheManager.setAccounts(item..parola = utf8.decode(base64.decode(item.parola ?? "")));
              dialogManager.showSnackBar("Başarılı");
            } else {
              dialogManager.showSnackBar("${item.firmaKisaAdi} zaten kayıtlı");
            }
          }
        }
      }
    }
  }

  String passwordDecoder(String password) {
    String password = md5.convert(utf8.encode(passwordController.text)).toString();
    return password;
  }
}

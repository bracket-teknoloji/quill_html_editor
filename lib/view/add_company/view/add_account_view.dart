import "dart:convert";

import "package:crypto/crypto.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "../../../core/constants/ui_helper/ui_helper.dart";

import "../../../core/base/model/generic_response_model.dart";
import "../../../core/base/state/base_state.dart";
import "../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../core/components/textfield/custom_text_field.dart";
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
            padding: UIHelper.lowPadding,
            child: AutofillGroup(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomWidgetWithLabel(
                      text: "Firma E-Posta Adresi",
                      onlyLabelpaddingLeft: UIHelper.lowSize,
                      child: CustomTextField(controller: emailController, keyboardType: TextInputType.emailAddress, isMust: true),
                    ),
                    Padding(
                      padding: UIHelper.lowPaddingVertical,
                      child: CustomWidgetWithLabel(
                        text: "Şifre",
                        onlyLabelpaddingLeft: UIHelper.lowSize,
                        child: CustomTextField(keyboardType: TextInputType.visiblePassword, controller: passwordController, isMust: true, onSubmitted: (value) => loginMethod),
                      ),
                    ),
                    const Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [Icon(Icons.question_mark_rounded), Text("Bilgileri girerken büyük-küçük uyumuna dikkat ediniz.", softWrap: true)],
                    ),
                    ElevatedButton(onPressed: () => _getQR(context), child: const Text("BİLGİLERİ QR KOD'DAN AL")).paddingAll(UIHelper.lowSize)
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Future<void> loginMethod() async {
    if (formKey.currentState?.validate() ?? false) {
      String encodedPassword = passwordDecoder(passwordController.text);
      dialogManager.showLoadingDialog("Yükleniyor...");

      AccountModel.instance
        ..uyeEmail = emailController.text
        ..uyeSifre = encodedPassword;
      final response = await networkManager.getUyeBilgileri(emailController.text, password: encodedPassword, getFromCache: false);
      dialogManager.hideAlertDialog;
      if (response.success == true) {
        for (AccountResponseModel item in response.data) {
          if (!CacheManager.accountsBox.containsKey(item.email)) {
            CacheManager.setHesapBilgileri(AccountModel.instance);
            CacheManager.setAccounts(response.data!.first..parola = encodedPassword);
            Get.back(result: true);
            Get.offAndToNamed("/addCompany");
            dialogManager.showSuccessSnackBar("Başarılı");
          } else {
            dialogManager.showErrorSnackBar("${item.firmaKisaAdi ?? item.firma} zaten kayıtlı");
          }
        }
      } else {
        dialogManager.showAlertDialog(response.message ?? "");
      }
    }
  }

  Future<void> _getQR(BuildContext context) async {
    var barcode = await Get.toNamed("/qr");
    GenericResponseModel response;

    if (barcode != null) {
      AccountModel.instance.qrData = barcode;
      response = await networkManager.getUyeBilgileri(null, getFromCache: false);
      // response = await networkManager.dioPost<AccountResponseModel>(
      //   bodyModel: AccountResponseModel(),
      //   addTokenKey: false,
      //   data: data,
      //   path: ApiUrls.getUyeBilgileri,
      // );
      if (response.success == true) {
        String encodedPassword = passwordDecoder(utf8.decode(base64.decode(response.data.first.parola)));
        AccountModel.instance.uyeEmail = response.data.first.email;
        AccountModel.instance.uyeSifre = encodedPassword;
        AccountModel.instance.qrData = null;
        for (AccountResponseModel item in response.data!) {
          if (!CacheManager.accountsBox.containsKey(item.email)) {
            Get.back(result: true);
            Get.offAndToNamed("/addCompany");
            CacheManager.setHesapBilgileri(AccountModel.instance);
            CacheManager.setAccounts(item..parola = encodedPassword);
            dialogManager.showSuccessSnackBar("Başarılı");
          } else {
            dialogManager.showErrorSnackBar("${item.firmaKisaAdi} zaten kayıtlı");
          }
        }
      } else {
        dialogManager.showAlertDialog(response.message ?? "");
      }
    }
  }

  String passwordDecoder(String password) => md5.convert(utf8.encode(password)).toString();
}

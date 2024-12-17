import "dart:convert";

import "package:crypto/crypto.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../core/base/model/generic_response_model.dart";
import "../../../core/base/state/base_state.dart";
import "../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../core/components/textfield/custom_text_field.dart";
import "../../../core/components/wrap/appbar_title.dart";
import "../../../core/constants/ui_helper/ui_helper.dart";
import "../../../core/init/cache/cache_manager.dart";
import "../model/account_model.dart";
import "../model/account_response_model.dart";
import "../view_model/add_account_view_model.dart";

final class AddAccountView extends StatefulWidget {
  const AddAccountView({super.key});

  @override
  State<AddAccountView> createState() => _AddAccountViewState();
}

final class _AddAccountViewState extends BaseState<AddAccountView> {
  final AddAccountViewModel viewModel = AddAccountViewModel();
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
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: const AppBarTitle(title: "Firmalar"),
          centerTitle: false,
          actions: [
            IconButton(onPressed: () async => await _getQR(context), icon: const Icon(Icons.qr_code_scanner)),
            IconButton(onPressed: loginMethod, icon: const Icon(Icons.save_outlined)),
          ],
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
                      child: CustomTextField(controller: emailController, keyboardType: TextInputType.emailAddress, isMust: true),
                    ),
                    Padding(
                      padding: UIHelper.lowPaddingVertical,
                      child: CustomWidgetWithLabel(
                        text: "Şifre",
                        child: Observer(
                          builder: (_) => CustomTextField(
                            keyboardType: viewModel.obscurePassword ? TextInputType.text : TextInputType.visiblePassword,
                            controller: passwordController,
                            isMust: true,
                            onSubmitted: (value) => loginMethod(),
                            suffix: IconButton(
                              onPressed: viewModel.togglePassword,
                              icon: Observer(
                                builder: (_) => Icon(viewModel.obscurePassword ? Icons.visibility_off : Icons.visibility),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.info_outline_rounded, color: theme.colorScheme.primary),
                        Expanded(
                          child: const Text("Bilgileri girerken büyük-küçük uyumuna dikkat ediniz.", softWrap: true, style: TextStyle(fontSize: 13), maxLines: 2).paddingOnly(left: UIHelper.lowSize),
                        ),
                      ],
                    ).paddingAll(UIHelper.lowSize),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Future<void> loginMethod() async {
    if (formKey.currentState?.validate() ?? false) {
      final String encodedPassword = passwordDecoder(passwordController.text);
      dialogManager.showLoadingDialog("Yükleniyor...");

      AccountModel.instance
        ..uyeEmail = emailController.text
        ..uyeSifre = encodedPassword;
      final response = await networkManager.getUyeBilgileri(emailController.text, password: encodedPassword, getFromCache: false);
      dialogManager.hideAlertDialog;
      if (response.isSuccess) {
        for (final AccountResponseModel item in response.dataList) {
          if (!CacheManager.accountsBox.containsKey(item.email)) {
            CacheManager.setHesapBilgileri(AccountModel.instance);
            CacheManager.setAccounts(item..parola = encodedPassword);
            Get.back(result: true);
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
    final barcode = await Get.toNamed("/qr");
    GenericResponseModel<AccountResponseModel> response;

    if (barcode != null) {
      AccountModel.instance.qrData = barcode;
      response = await networkManager.getUyeBilgileri(null, getFromCache: false);
      // response = await networkManager.dioPost<AccountResponseModel>(
      //   bodyModel: AccountResponseModel(),
      //   addTokenKey: false,
      //   data: data,
      //   path: ApiUrls.getUyeBilgileri,
      // );
      if (response.isSuccess) {
        final String encodedPassword = passwordDecoder(utf8.decode(base64.decode(response.dataList.firstOrNull?.parola ?? "")));
        AccountModel.instance.uyeEmail = response.dataList.firstOrNull?.email;
        AccountModel.instance.uyeSifre = encodedPassword;
        AccountModel.instance.qrData = null;
        for (final AccountResponseModel item in response.dataList) {
          if (!CacheManager.accountsBox.containsKey(item.email)) {
            Get.back(result: true);
            // Get.back(result: true);
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

// ignore_for_file: use_build_context_synchronously

import "dart:convert";
import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/login_dialog_model.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:wave/config.dart";
import "package:wave/wave.dart";

import "../../../../core/base/state/base_state.dart";
import "../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../core/init/app_info/app_info.dart";
import "../../../../core/init/cache/cache_manager.dart";
import "../../../../core/init/network/login/api_urls.dart";
import "../../../add_company/model/account_model.dart";
import "../view_model/login_view_model.dart";

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  LoginViewModel viewModel = LoginViewModel();
  late LoginDialogModel selectedUser;
  late final TextEditingController emailController;
  late final TextEditingController companyController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    companyController = TextEditingController();
    passwordController = TextEditingController();
    selectedUser = CacheManager.getVerifiedUser;
    AccountModel.setFromAccountResponseModel(selectedUser.account);
    viewModel.checkDebug();
    if (selectedUser.account?.firma != null) {
      companyController.text = selectedUser.account!.firma!;
    }
    emailController.text = selectedUser.username ?? "";
    passwordController.text = selectedUser.password ?? "";
  }

  @override
  void dispose() {
    emailController.dispose();
    companyController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Stack(
        children: [
          WaveWidget(
              config: CustomConfig(durations: [8000, 10000], heightPercentages: [0.78, 0.8], colors: [const Color.fromRGBO(70, 59, 57, 26), Colors.black.withOpacity(0.3)]),
              size: const Size(double.infinity, double.infinity),
              waveAmplitude: 2,
              wavePhase: 0,
              duration: 200,
              backgroundColor: theme.scaffoldBackgroundColor),
          Scaffold(
            // appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent, automaticallyImplyLeading: false),
            floatingActionButton: !context.general.isKeyBoardOpen ? Text("V ${AppInfoModel.instance.version}").paddingOnly(bottom: 20) : null,
            floatingActionButtonLocation: context.isLandscape ? FloatingActionButtonLocation.endFloat : FloatingActionButtonLocation.centerDocked,
            primary: true,
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: context.padding.horizontalHigh,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: context.general.isKeyBoardOpen ? context.sized.dynamicHeight(0.06) : context.sized.dynamicHeight(0.12),
                          child: SvgPicture.asset("assets/splash/PickerLogoTuruncu.svg"),
                        ).paddingOnly(bottom: context.sized.dynamicHeight(0.02), top: context.sized.dynamicHeight(0.04)),
                        Padding(
                          padding: UIHelper.midPaddingVertical,
                          child: Observer(builder: (_) {
                            return Column(
                              children: [
                                Text("Picker", style: context.theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500)),
                                Text("Mobil Veri Toplama Çözümleri", style: context.theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w300)),
                                Text(networkManager.getBaseUrl).paddingSymmetric(vertical: UIHelper.midSize).yetkiVarMi(viewModel.isDebug)
                              ],
                            );
                          }),
                        ),
                        CustomWidgetWithLabel(
                          text: "Firma",
                          child: TextFormField(
                            readOnly: true,
                            onTap: () async {
                              var selectedFirma = await dialogManager.selectCompanyDialog();
                              if (selectedFirma != null) {
                                selectedFirma = selectedFirma as LoginDialogModel;
                                selectedUser = selectedFirma;
                                //*LoginDialogModel
                                if (selectedUser.account?.firma != null) {
                                  companyController.text = selectedUser.account!.firma!;
                                }
                                emailController.text = selectedUser.username ?? "";
                                passwordController.text = selectedUser.password ?? "";
                                if (selectedUser.account?.firma == "demo") {
                                  AccountModel.instance.uyeEmail = "demo@netfect.com";
                                  AccountModel.instance.uyeSifre = null;
                                  selectedUser.account?.email = "demo@netfect.com";
                                  selectedUser.account?.parola = null;
                                } else {
                                  AccountModel.instance.uyeEmail = selectedUser.account?.email;
                                  if (CacheManager.getHesapBilgileri?.qrData == null) {
                                    AccountModel.instance.uyeSifre = selectedUser.account?.parola;
                                  }
                                }
                              }
                              viewModel.checkDebug();
                            },
                            decoration: const InputDecoration(suffixIcon: Icon(Icons.more_horiz)),
                            controller: companyController,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        Padding(
                          padding: UIHelper.midPaddingOnlyTop,
                          child: CustomWidgetWithLabel(
                            text: "Netfect Kullanıcı Adı",
                            child: TextFormField(
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                        Padding(
                          padding: UIHelper.midPaddingVertical,
                          child: CustomWidgetWithLabel(
                            text: "Şifre",
                            child: Observer(builder: (_) {
                              return TextField(
                                controller: passwordController,
                                textInputAction: TextInputAction.done,
                                obscureText: viewModel.showPassword,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () => viewModel.changeShowPassword(),
                                    icon: viewModel.showPassword ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: elevatedButton,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton get elevatedButton {
    // await AppTrackingTransparency.requestTrackingAuthorization();
    // if ((await AppTrackingTransparency.trackingAuthorizationStatus != TrackingStatus.authorized) && Platform.isIOS) {
    //   await dialogManager.showAlertDialog(
    //       "Cihaz bilgilerinizin toplanması için izin vermeniz gerekmektedir. Ayarlar'dan lütfen cihazın \n\"Takip Etmeye İzin Ver\"\nayarını açınız.\n\nAyarlar sayfasına yönlendiriliyorsunuz.");
    //   await AppSettings.openAppSettings();
    // } else {
    // }
    return ElevatedButton(onPressed: () async => login(), child: const Text("Giriş"));
  }

  void login() async {
    dialogManager.showLoadingDialog("Yükleniyor...");

    AccountModel instance = AccountModel.instance;
    var a = instance
      ..kullaniciAdi = emailController.text
      ..uyeEmail = selectedUser.account?.email;
    if (a.uyeEmail == "demo@netfect.com") {
      a.uyeSifre = null;
    } else {
      if (a.qrData == null) {
        a.uyeSifre = selectedUser.account?.parola;
      }
    }
    var result = await networkManager.getUyeBilgileri(selectedUser.account?.email ?? "", password: selectedUser.account?.parola);
    if (result.success != true) {
      log(result.ex.toString());
      if (CacheManager.getIsLicenseVerified(selectedUser.account?.email ?? "") == false) {
        dialogManager.hideAlertDialog;
        dialogManager.showAlertDialog(("${result.message ?? ""}\n${result.ex?["Message"] ?? result.errorDetails ?? "Lisansınız bulunamadı. Lütfen lisansınızı kontrol ediniz."}"));
        return;
      }
    }
    dialogManager.hideAlertDialog;
    dialogManager.showLoadingDialog("Giriş Yapılıyor");

    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      final response = await networkManager.getToken(
        path: ApiUrls.token,
        queryParameters: {"deviceInfos": jsonEncode(a.toJson())},
        data: {"grant_type": "password", "username": emailController.text, "password": passwordController.text},
      );
      if (response?.error == null) {
        log(jsonEncode(a.toJson()), name: "sea");
        a = a
          ..isim = response?.userJson?.ad
          ..soyadi = response?.userJson?.soyad
          ..admin = response?.userJson?.admin;
        CacheManager.setHesapBilgileri(a);
        dialogManager.hideAlertDialog;
        Hive.box("preferences").put(companyController.text, [
          selectedUser.account?.firma,
          emailController.text,
          passwordController.text,
        ]);

        if (context.mounted && response?.accessToken != null) {
          CacheManager.setVerifiedUser(selectedUser
            ..username = emailController.text
            ..password = passwordController.text);
          CacheManager.setToken(response!.accessToken.toString());
          // final uyeBilgiResponse =
          //     await networkManager.dioPost<AccountResponseModel>(bodyModel: AccountResponseModel(), data: AccountModel.instance, addTokenKey: false, path: ApiUrls.getUyeBilgileri);
          // if (uyeBilgiResponse.success == true) {
          //   CacheManager.setAccounts(uyeBilgiResponse.data.first);
          // }
          Get.toNamed("/entryCompany");
        }
      } else {
        dialogManager.hideAlertDialog;
        dialogManager.showAlertDialog(response?.errorDescription ?? response?.error ?? "Hata");
      }
    } else {
      Navigator.of(context, rootNavigator: true).pop();
      dialogManager.hideSnackBar;
      dialogManager.showErrorSnackBar("Lütfen boş alan bırakmayınız.");
    }
  }

  // Future<GenericResponseModel> getUyeBilgileri() async {
  //   final result = await networkManager.dioPost<AccountResponseModel>(
  //       bodyModel: AccountResponseModel(), showError: false, data: AccountModel.instance.toJson(), addTokenKey: false, path: ApiUrls.getUyeBilgileri);
  //   if (result.success == true) {
  //     CacheManager.setIsLicenseVerified(verifiedUser.account?.email ?? "", true);
  //     CacheManager.setAccounts(result.data.first..parola = verifiedUser.account?.parola);
  //   } else {
  //     if (result.errorCode == 5) {
  //       CacheManager.setIsLicenseVerified(verifiedUser.account?.email ?? "", false);
  //     }
  //     dialogManager.hideAlertDialog;
  //     dialogManager.showAlertDialog(result.message ?? "");
  //   }
  //   if (CacheManager.getIsLicenseVerified(verifiedUser.account?.email ?? "") == false) {
  //     dialogManager.hideAlertDialog;
  //     dialogManager.showAlertDialog("Lisansınızın yenilenmesi gerekiyor.");
  //   }
  //   return result;
  // }
}

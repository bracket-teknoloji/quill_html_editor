// ignore_for_file: use_build_context_synchronously

import "dart:convert";
import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:hive_ce_flutter/hive_flutter.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/login_dialog_model.dart";
import "package:picker/core/components/wave/login_wave_widget.dart";
import "package:picker/core/gen/assets.gen.dart";
import "package:picker/view/add_company/model/account_response_model.dart";
import "package:picker/view/auth/login/model/login_model.dart";

import "../../../../core/base/state/base_state.dart";
import "../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../core/init/app_info/app_info.dart";
import "../../../../core/init/cache/cache_manager.dart";
import "../../../add_company/model/account_model.dart";
import "../view_model/login_view_model.dart";

final class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

final class _LoginViewState extends BaseState<LoginView> {
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
    if (CacheManager.getUzaktanMi(selectedUser.account?.email ?? "")) {
      viewModel.changeBaglantiTipi(true);
      CacheManager.setUzaktanMi(selectedUser.account?.email ?? "", true);
    } else {
      viewModel.changeBaglantiTipi(false);
      CacheManager.setUzaktanMi(selectedUser.account?.email ?? "", false);
    }
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
  Widget build(BuildContext context) => Title(
    color: theme.colorScheme.primary,
    title: "Picker'a Giriş Yap",
    child: PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: theme.appBarTheme.systemOverlayStyle?.copyWith(
            systemNavigationBarColor: theme.colorScheme.surfaceContainer,
            systemNavigationBarDividerColor: theme.colorScheme.surfaceContainer,
          ),
        ),
        // appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent, automaticallyImplyLeading: false),
        floatingActionButton: !context.general.isKeyBoardOpen ? fab() : null,
        floatingActionButtonLocation: context.isLandscape
            ? FloatingActionButtonLocation.endFloat
            : FloatingActionButtonLocation.centerDocked,
        // primary: true,
        // backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        body: Stack(children: [const LoginWaveWidget(), body(context)]),
      ),
    ),
  );

  Widget fab() => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text("V ${AppInfoModel.instance.version}"),
      InkWell(
        onTap: () => Get.toNamed("/surumYenilikleri"),
        child: Text("Sürüm Yenilikleri", style: TextStyle(color: theme.colorScheme.primary)),
      ),
    ],
  );

  Center body(BuildContext context) => Center(
    child: SingleChildScrollView(
      child: Padding(
        padding: context.padding.horizontalHigh,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 50),
                    height: context.general.isKeyBoardOpen
                        ? context.sized.dynamicHeight(0.06)
                        : context.sized.dynamicHeight(0.12),
                    child: Assets.appIcon.pickerLogoBeyaz.svg(),
                  ).paddingOnly(bottom: context.sized.dynamicHeight(0.02), top: context.sized.dynamicHeight(0.04)),
                  Padding(
                    padding: UIHelper.highPaddingVertical,
                    child: Column(
                      children: [
                        Text(
                          "Picker",
                          style: context.theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Mobil Veri Toplama Çözümleri",
                          style: context.theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  CustomWidgetWithLabel(
                    addPadding: false,
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
                            AccountModel.instance.uyeSifre = selectedUser.account?.parola;
                          }

                          viewModel.checkDebug();
                        } else {
                          selectedUser = CacheManager.getVerifiedUser;
                          AccountModel.setFromAccountResponseModel(selectedUser.account);
                          viewModel.checkDebug();
                          if (selectedUser.account?.firma != null) {
                            companyController.text = selectedUser.account!.firma!;
                          }
                          emailController.text = selectedUser.username ?? "";
                          passwordController.text = selectedUser.password ?? "";
                        }
                        if (CacheManager.getUzaktanMi(selectedUser.account?.email ?? "")) {
                          viewModel.changeBaglantiTipi(true);
                          CacheManager.setUzaktanMi(selectedUser.account?.email ?? "", true);
                        } else {
                          viewModel.changeBaglantiTipi(false);
                          CacheManager.setUzaktanMi(selectedUser.account?.email ?? "", false);
                        }
                      },
                      decoration: const InputDecoration(suffixIcon: Icon(Icons.more_horiz)),
                      controller: companyController,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Padding(
                    padding: UIHelper.midPaddingOnlyTop,
                    child: CustomWidgetWithLabel(
                      addPadding: false,
                      text: "Netfect Kullanıcı Adı",
                      child: TextFormField(controller: emailController, textInputAction: TextInputAction.next),
                    ),
                  ),
                  Padding(
                    padding: UIHelper.midPaddingVertical,
                    child: CustomWidgetWithLabel(
                      addPadding: false,
                      text: "Şifre",
                      child: Observer(
                        builder: (_) => TextField(
                          controller: passwordController,
                          textInputAction: TextInputAction.done,
                          obscureText: viewModel.obscurePassword,
                          onSubmitted: (_) => login(),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () => viewModel.changeShowPassword(),
                              icon: viewModel.obscurePassword
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 8.0), child: elevatedButton),
                ],
              ),
              FittedBox(
                child: InkWell(
                  onTap: () async {
                    final AccountResponseModel? model = CacheManager.getAccounts(selectedUser.account?.email ?? "");
                    final result = await bottomSheetDialogManager.showBaglantiSekliBottomSheetDialog(context, model);
                    if (result != null) {
                      viewModel.changeBaglantiTipi(result);
                      CacheManager.setUzaktanMi(selectedUser.account?.email ?? "", result);
                    }
                  },
                  child: Row(
                    children: [
                      Observer(
                        builder: (_) => Text(
                          "${viewModel.baglantiTipi} Sunucu",
                          style: TextStyle(color: theme.colorScheme.primary),
                        ),
                      ),
                      const Icon(Icons.expand_more_outlined, size: UIHelper.highSize),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  // await AppTrackingTransparency.requestTrackingAuthorization();
  // if ((await AppTrackingTransparency.trackingAuthorizationStatus != TrackingStatus.authorized) && Platform.isIOS) {
  //   await dialogManager.showAlertDialog(
  //       "Cihaz bilgilerinizin toplanması için izin vermeniz gerekmektedir. Ayarlar'dan lütfen cihazın \n\"Takip Etmeye İzin Ver\"\nayarını açınız.\n\nAyarlar sayfasına yönlendiriliyorsunuz.");
  //   await AppSettings.openAppSettings();
  // } else {
  // }
  ElevatedButton get elevatedButton => ElevatedButton(onPressed: () async => login(), child: const Text("Giriş"));

  Future<void> login() async {
    // dialogManager.showLoadingDialog("Yükleniyor...");

    var instance = AccountModel.instance
      ..kullaniciAdi = emailController.text
      ..uyeEmail = selectedUser.account?.email;
    if (instance.uyeEmail == "demo@netfect.com") {
      instance.uyeSifre = null;
    } else {
      if (instance.qrData == null) {
        instance.uyeSifre = selectedUser.account?.parola;
      }
    }
    final result = await networkManager.getUyeBilgileri(
      selectedUser.account?.email ?? "",
      password: selectedUser.account?.parola,
      getFromCache: false,
    );
    if (!result.isSuccess) {
      log(result.ex.toString());
      if (!CacheManager.getIsLicenseVerified(selectedUser.account?.email ?? "")) {
        // dialogManager.hideAlertDialog;
        dialogManager.showAlertDialog(
          "${result.message ?? ""}\n${result.ex?["Message"] ?? result.errorDetails ?? "Lisansınız bulunamadı. Lütfen lisansınızı kontrol ediniz."}",
        );
        return;
      }
    }
    // dialogManager.hideAlertDialog;
    dialogManager.showLoadingDialog("Giriş Yapılıyor");
    log(jsonEncode(instance.toJson()));
    TokenModel? response;
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        response = await networkManager.getToken(
          queryParameters: {"deviceInfos": jsonEncode(instance.toJson())},
          data: {"grant_type": "password", "username": emailController.text, "password": passwordController.text},
        );
      } on Exception catch (e) {
        dialogManager
          ..hideAlertDialog
          ..showAlertDialog(e.toString());
      }
      if (response?.error == null) {
        log(jsonEncode(instance.toJson()), name: "sea");
        instance = instance
          ..adi = response?.userJson?.ad
          ..soyadi = response?.userJson?.soyad
          ..admin = response?.userJson?.admin ?? "H";
        CacheManager.setHesapBilgileri(instance);
        viewModel.checkDebug();
        dialogManager.hideAlertDialog;
        Hive.box(
          "preferences",
        ).put(companyController.text, [selectedUser.account?.firma, emailController.text, passwordController.text]);

        if (context.mounted && response?.accessToken != null) {
          CacheManager.setVerifiedUser(
            selectedUser
              ..username = emailController.text
              ..password = passwordController.text,
          );
          CacheManager.setToken(response!.accessToken.toString());
          // final uyeBilgiResponse =
          //     await networkManager.dioPost<AccountResponseModel>(bodyModel: AccountResponseModel(), data: AccountModel.instance, addTokenKey: false, path: ApiUrls.getUyeBilgileri);
          // if (uyeBilgiResponse.isSuccess) {
          //   CacheManager.setAccounts(uyeBilgiResponse.dataList.firstOrNull);
          // }
          Get.toNamed("/entryCompany");
        }
      } else {
        dialogManager
          ..hideAlertDialog
          ..showAlertDialog(response?.errorDescription ?? response?.error ?? "Hata");
      }
    } else {
      Navigator.of(context, rootNavigator: true).pop();
      dialogManager.showErrorSnackBar("Lütfen boş alan bırakmayınız.");
    }
  }
}

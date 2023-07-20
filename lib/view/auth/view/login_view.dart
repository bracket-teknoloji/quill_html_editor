import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/base/model/generic_response_model.dart';
import 'package:picker/core/base/model/login_dialog_model.dart';
import 'package:picker/view/add_company/model/account_response_model.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/components/helper_widgets/custom_label_widget.dart';
import '../../../core/constants/ui_helper/ui_helper.dart';
import '../../../core/init/app_info/app_info.dart';
import '../../../core/init/cache/cache_manager.dart';
import '../../../core/init/network/login/api_urls.dart';
import '../../add_company/model/account_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  bool isObscure = true;
  late LoginDialogModel textFieldData;
  late final TextEditingController emailController;
  late final TextEditingController companyController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    companyController = TextEditingController();
    passwordController = TextEditingController();
    var box = CacheManager.getVerifiedUser;
    textFieldData = box;
    if (textFieldData.account?.firma != null) {
      companyController.text = textFieldData.account!.firma!;
    }
    if (textFieldData.username != null) {
      emailController.text = textFieldData.username!;
    }
    if (textFieldData.password != null) {
      passwordController.text = textFieldData.password!;
    }
    // autoLogin();
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
            appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent, automaticallyImplyLeading: false),
            floatingActionButton: !context.isKeyBoardOpen ? Text("V ${AppInfoModel.instance.version}").paddingOnly(bottom: 20) : null,
            floatingActionButtonLocation: context.isLandscape ? FloatingActionButtonLocation.endFloat : FloatingActionButtonLocation.centerDocked,
            primary: true,
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: context.horizontalPaddingHigh,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: context.isKeyBoardOpen ? context.dynamicHeight(0.06) : context.dynamicHeight(0.12),
                          child: SvgPicture.asset("assets/splash/PickerLogoTuruncu.svg"),
                        ).paddingOnly(bottom: context.dynamicHeight(0.02), top: context.dynamicHeight(0.04)),
                        Padding(
                          padding: UIHelper.midPaddingVertical,
                          child: Column(
                            children: [
                              Text(
                                "Picker",
                                style: context.theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500),
                              ),
                              Text("Mobil Veri Toplama Çözümleri", style: context.theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w300)),
                            ],
                          ),
                        ),
                        CustomWidgetWithLabel(
                            text: "Firma",
                            child: TextFormField(
                              readOnly: true,
                              onTap: () async {
                                var a = await dialogManager.selectCompanyDialog();
                                a = a as LoginDialogModel?;
                                if (a != null) {
                                  textFieldData = a;
                                  //*LoginDialogModel
                                  if (textFieldData.account?.firma != null) {
                                    companyController.text = textFieldData.account!.firma!;
                                  }
                                  if (textFieldData.username != null) {
                                    emailController.text = textFieldData.username!;
                                  }
                                  if (textFieldData.password != null) {
                                    passwordController.text = textFieldData.password ?? "";
                                  }
                                  if (textFieldData.account?.firma == "demo") {
                                    AccountModel.instance.uyeEmail = "demo@netfect.com";
                                    AccountModel.instance.uyeSifre = null;
                                    textFieldData.account?.email = "demo@netfect.com";
                                    textFieldData.account?.parola = null;
                                  } else {
                                    AccountModel.instance.uyeEmail = textFieldData.account?.email;
                                    AccountModel.instance.uyeSifre = textFieldData.account?.parola;
                                    textFieldData.account?.email = textFieldData.account?.email;
                                    textFieldData.account?.parola = textFieldData.account?.parola;
                                  }
                                  setState(() {});
                                }
                              },
                              decoration: const InputDecoration(suffixIcon: Icon(Icons.more_horiz)),
                              controller: companyController,
                              textInputAction: TextInputAction.next,
                            )),
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
                              child: TextField(
                                controller: passwordController,
                                textInputAction: TextInputAction.done,
                                obscureText: isObscure,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isObscure = !isObscure;
                                      });
                                    },
                                    icon: isObscure ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                                  ),
                                ),
                              )),
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

  void autoLogin() async {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (AccountModel.instance.ozelCihazKimligi.isNotNullOrNoEmpty) {
        bool? a = CacheManager.getLogout;
        if (a != null && a) {
          login();
        }
      }
    });
  }

  ElevatedButton get elevatedButton {
    return ElevatedButton(
        onPressed: () async {
          // await AppTrackingTransparency.requestTrackingAuthorization();
          // if ((await AppTrackingTransparency.trackingAuthorizationStatus != TrackingStatus.authorized) && Platform.isIOS) {
          //   await dialogManager.showAlertDialog(
          //       "Cihaz bilgilerinizin toplanması için izin vermeniz gerekmektedir. Ayarlar'dan lütfen cihazın \n\"Takip Etmeye İzin Ver\"\nayarını açınız.\n\nAyarlar sayfasına yönlendiriliyorsunuz.");
          //   await AppSettings.openAppSettings();
          // } else {
          // }
          login();
        },
        child: const Text(
          "Giriş",
        ));
  }

  void login() async {
    var result = await getUyeBilgileri();
    if (result.success != true) {
      if (result.errorCode == 5) {
        CacheManager.setIsLicenseVerified(textFieldData.account?.email ?? "",false);
        dialogManager.showAlertDialog(result.message ?? "");
        return;
      } else {
        CacheManager.setIsLicenseVerified(textFieldData.account?.email ?? "",true);
      }
    }
    if (CacheManager.getIsLicenseVerified(textFieldData.account?.email ?? "")){
      dialogManager.showAlertDialog("Lisansınızın yenilenmesi gerekiyor.");
      return;
    }
    AccountModel instance = AccountModel.instance;
    var a = instance
      ..kullaniciAdi = emailController.text
      ..uyeEmail = textFieldData.account?.email;
    if (a.uyeEmail == "demo@netfect.com") {
      a.uyeSifre = null;
    } else {
      a.uyeSifre = textFieldData.account?.parola;
    }
    dialogManager.showLoadingDialog("Giriş Yapılıyor");

    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        log(jsonEncode(a.toJson()), name: "sea");
        final response = await networkManager.getToken(
          path: ApiUrls.token,
          queryParameters: {"deviceInfos": jsonEncode(a.toJson())},
          data: {"grant_type": "password", "username": emailController.text, "password": passwordController.text},
        );
        CacheManager.setHesapBilgileri(a);
        dialogManager.hideAlertDialog;
        Hive.box("preferences").put(companyController.text, [
          textFieldData.account?.firma,
          emailController.text,
          passwordController.text,
        ]);

        if (context.mounted && response != null) {
          CacheManager.setVerifiedUser(textFieldData
            ..username = emailController.text
            ..password = passwordController.text);
          CacheManager.setToken(response.accessToken.toString());
          // final uyeBilgiResponse =
          //     await networkManager.dioPost<AccountResponseModel>(bodyModel: AccountResponseModel(), data: AccountModel.instance, addTokenKey: false, path: ApiUrls.getUyeBilgileri);
          // if (uyeBilgiResponse.success == true) {
          //   CacheManager.setAccounts(uyeBilgiResponse.data.first);
          // }
          Get.toNamed("/entryCompany");
        }
      } on DioException catch (e) {
        dialogManager.hideAlertDialog;
        dialogManager.showAlertDialog(e.response?.data["error_description"] ?? "Hata :${e.message}");
      }
    } else {
      Navigator.of(context, rootNavigator: true).pop();
      dialogManager.hideSnackBar;
      dialogManager.showSnackBar("Lütfen boş alan bırakmayınız.");
    }
  }

  Future<GenericResponseModel> getUyeBilgileri() async {
    final response = await networkManager.dioPost<AccountResponseModel>(
        bodyModel: AccountResponseModel(), showError: false, data: AccountModel.instance.toJson(), addTokenKey: false, path: ApiUrls.getUyeBilgileri);
    if (response.success == true) {
      CacheManager.setAccounts(response.data.first..parola = AccountModel.instance.uyeSifre);
    }
    return response;
  }
}

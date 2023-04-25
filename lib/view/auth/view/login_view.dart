import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kartal/kartal.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/components/textfield/custom_textfield.dart';
import '../../../core/constants/ui_helper/ui_helper.dart';
import '../../../core/init/app_info/app_info.dart';
import '../../../core/init/cache/cache_manager.dart';
import '../../../core/init/network/login/api_urls.dart';
import '../../../core/init/network/network_manager.dart';
import '../../add_company/model/account_model.dart';
import '../../add_company/model/account_response_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  bool isObscure = true;
  String? version;
  Map textFieldData = {"company": "demo", "user": "demo", "password": "demo"};
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
    if (box != null) {
      textFieldData = box;
    }
    companyController.text = textFieldData["company"];
    emailController.text = textFieldData["user"];
    passwordController.text = textFieldData["password"];
    AppInfoModel().init().then((value) {
      setState(() {
        version = AppInfoModel.version;
      });
    });
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
      onWillPop: () async {
        return false;
      },
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
            floatingActionButton: !context.isKeyBoardOpen ? Text("V $version").paddingOnly(bottom: 20) : null,
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
                        CustomTextField(text: "Firma", children: [
                          TextFormField(
                            readOnly: true,
                            onTap: () async {
                              var a = await dialogManager.selectCompanyDialog();
                              if (a != null) {
                                textFieldData = a;
                              }
                              companyController.text = textFieldData["company"] ?? "";
                              emailController.text = textFieldData["user"] ?? "";
                              passwordController.text = textFieldData["password"] ?? "";
                              setState(() {});
                            },
                            decoration: const InputDecoration(suffixIcon: Icon(Icons.more_horiz)),
                            controller: companyController,
                            textInputAction: TextInputAction.next,
                          )
                        ]),
                        Padding(
                          padding: UIHelper.midPaddingOnlyTop,
                          child: CustomTextField(
                            text: "Netfect Kullanıcı Adı",
                            children: [
                              TextFormField(
                                controller: emailController,
                                textInputAction: TextInputAction.next,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: UIHelper.midPaddingVertical,
                          child: CustomTextField(
                            text: "Şifre",
                            children: [
                              TextField(
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
                              )
                            ],
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
    return ElevatedButton(
        onPressed: () async {
          dialogManager.showLoadingDialog("Giriş Yapılıyor");

          if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
            try {
              final response = await NetworkManager.getToken(path: ApiUrls.token, data: {
                "grant_type": "password",
                "username": emailController.text,
                "password": passwordController.text,
              });
              dialogManager.hideAlertDialog;
              AccountResponseModel? accountCache = CacheManager.getAccounts(companyController.text);
              var based =
                  base64Encode(utf8.encode("${AccountModel.instance.cihazMarkasi}:${AccountModel.instance.cihazModeli}:${AccountModel.instance.cihazSistemVersiyonu}"));
              AccountModel.instance
                ..cihazKimligi = based
                ..kullaniciAdi = emailController.text
                ..uyeEmail = accountCache?.email ?? "demo@netfect.com"
                ..uyeSifre = accountCache?.parola;
              Hive.box("preferences").put(companyController.text, [
                textFieldData["user"],
                emailController.text,
                passwordController.text,
              ]);
              if (context.mounted) {
                // TODO: Hata: VerifiedUser'ı kontrol et.
                CacheManager.setVerifiedUser(
                    {"user": emailController.text, "password": passwordController.text, "company": companyController.text, "email": accountCache?.email ?? ""});
                CacheManager.setToken(response.accessToken.toString());

                Get.toNamed("/entryCompany");
                print("object");
              }
            } on DioError catch (e) {
              dialogManager.hideAlertDialog;
              dialogManager.showAlertDialog(e.response?.data["error_description"] ?? "Hata :${e.message}");
            } on Exception catch (e) {
              dialogManager.showAlertDialog(e.toString());
            }
          } else {
            Navigator.of(context, rootNavigator: true).pop();
            dialogManager.hideSnackBar;
            dialogManager.showSnackBar("Lütfen boş alan bırakmayınız.");
          }
        },
        child: const Text(
          "Giriş",
        ));
  }
}

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/constants/image/image_enums.dart';
import '../../../core/constants/login_page_constants.dart';
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

  Map textFieldData = {};
  var box = Hive.box('preferences');

  late final TextEditingController emailController;
  late final TextEditingController companyController;
  late final TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    companyController = TextEditingController();
    passwordController = TextEditingController();
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
          Container(
            decoration: const BoxDecoration(
              gradient: LoginConstants.linearGradient,
            ),
          ),
          Scaffold(
            primary: true,
            extendBodyBehindAppBar: true,
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: context.horizontalPaddingHigh,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        child: Padding(
                          padding: context.paddingLow,
                          child: Image.asset(ImageEnum.pickerLogo.path, height: context.isKeyBoardOpen ? 50 : 100),
                          //child: Lottie.network("https://assets2.lottiefiles.com/private_files/lf30_fup2uejx.json"),
                        ),
                      ),
                      Padding(
                        padding: context.verticalPaddingLow,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              "Picker",
                              style: context.theme.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
                            ),
                            Text("Mobil Veri Toplama Çözümleri",
                                style: context.theme.textTheme.titleLarge!
                                    .copyWith(fontSize: 15, fontWeight: FontWeight.w300)),
                            Text("V$version")
                          ],
                        ),
                      ),
                      Wrap(
                        children: [
                          const Text("Firma"),
                          TextFormField(
                            readOnly: true,
                            onTap: () async {
                              textFieldData = await showAlertDialog(dialogManager.listTileDialog(
                                    title: "Firma Seçiniz",
                                  )) ??
                                  {};
                              companyController.text = textFieldData["company"] ?? "";
                              emailController.text = textFieldData["user"] ?? "";
                              passwordController.text = textFieldData["password"] ?? "";
                              setState(() {});
                            },
                            decoration: const InputDecoration(suffixIcon: Icon(Icons.more_horiz)),
                            controller: companyController,
                            textInputAction: TextInputAction.next,
                          ),
                        ],
                      ),
                      Padding(
                        padding: context.onlyTopPaddingLow,
                        child: Wrap(
                          children: [
                            const Text("Netfect Kullanıcı Adı"),
                            TextFormField(
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.verticalPaddingLow,
                        child: Wrap(
                          children: [
                            const Text("Şifre"),
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
                      elevatedButton(emailController, passwordController, context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton elevatedButton(
      TextEditingController emailController, TextEditingController passwordController, BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          dialogManager.showLoadingDialog();

          if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
            {
              try {
                final response = await NetworkManager.getToken(path: ApiUrls.token, data: {
                  "grant_type": "password",
                  "username": emailController.text,
                  "password": passwordController.text,
                });
                AccountResponseModel? accountCache = CacheManager.getAccounts(companyController.text);
                AccountModel.instance
                  ..kullaniciAdi = emailController.text
                  ..uyeEmail = accountCache!.email
                  ..uyeSifre = accountCache.parola;
                Hive.box("preferences").put(companyController.text, [
                  textFieldData["user"],
                  emailController.text,
                  passwordController.text,
                ]);
                if (context.mounted) {
                  CacheManager.setToken(response.accessToken.toString());
                  log(response.userJson?.erpKullanici.toString() ?? "null");

                  Navigator.popAndPushNamed(context, "/entryCompany");
                }
              } on DioError catch (e) {
                dialogManager.hideAlertDialog;
                dialogManager.showAlertDialog("${e.response?.data["error_description"]}");
              }
            }
          } else {
            Navigator.of(context, rootNavigator: true).pop();
            dialogManager.hideSnackBar;
            dialogManager.showSnackBar("Lütfen boş alan bırakmayınız.");
          }
        },
        child: const Text(
          "Giriş",
          style: TextStyle(color: Colors.red),
        ));
  }
}

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/init/app_info/app_info.dart';
import '../../../core/init/network/login/api_urls.dart';
import '../../../core/init/network/network_manager.dart';
import '../model/login_model.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/constants/image/image_enums.dart';
import '../../../core/constants/login_page_constants.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  bool isObscure = true;
  String? version;

  Map company = {};

  late final TextEditingController emailController;
  late final TextEditingController companyController;
  late final TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    AppInfoModel().init().then((value) {
      setState(() {
        version = AppInfoModel.version;
      });
    });
    emailController = TextEditingController();
    emailController.text = Hive.box("preferences").get("email") ?? "";
    companyController = TextEditingController();
    passwordController = TextEditingController();
    passwordController.text = Hive.box("preferences").get("password") ?? "";
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        child: Padding(
                          padding: context.paddingLow,
                          child: Image.asset(ImageEnum.pickerLogo.path,
                              height: context.isKeyBoardOpen ? 50 : 100),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: context.verticalPaddingMedium,
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                Text(
                                  "Picker",
                                  style: context.textTheme.headlineSmall!
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                Text("Mobil Veri Toplama Çözümleri",
                                    style: context.textTheme.titleLarge!
                                        .copyWith(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300)),
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
                                  company = await showAlertDialog(dialogManager
                                          .listTileDialog(
                                              title: "Firma Seçiniz",
                                              data: {
                                            "user": "demo",
                                            "password": "demo"
                                          })) ??
                                      {};
                                  emailController.text = company["user"] ?? "";
                                  passwordController.text =
                                      company["password"].toString();
                                  setState(() {});
                                },
                                decoration: const InputDecoration(
                                    suffixIcon: Icon(Icons.more_horiz)),
                                controller: TextEditingController(
                                    text: company["user"] ?? ""),
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
                                Text("Şifre",
                                    style: context.textTheme.bodySmall),
                                TextField(
                                  controller: passwordController,
                                  textInputAction: TextInputAction.go,
                                  obscureText: isObscure,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isObscure = !isObscure;
                                        });
                                      },
                                      icon: isObscure
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      elevatedButton(
                          emailController, passwordController, context),
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

  ElevatedButton elevatedButton(TextEditingController emailController,
      TextEditingController passwordController, BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          dialogManager.showLoadingDialog();

          if (emailController.text.isNotEmpty &&
              passwordController.text.isNotEmpty) {
            {
              try {
                final response = await NetworkManager.getToken(
                    path: ApiUrls.token,
                    bodyModel: TokenModel(),
                    data: {
                      "grant_type": "password",
                      "username": emailController.text,
                      "password": passwordController.text,
                    });

                Hive.box("preferences").put("email", emailController.text);
                debugPrint("${Hive.box("preferences").get("email")}");
                Hive.box("preferences")
                    .put("password", passwordController.text);
                Hive.box("token").put("token", response.accessToken);
                debugPrint("${Hive.box("preferences").get("password")}");
                log(response.userJson.toString());
                if (context.mounted) {
                  Navigator.popAndPushNamed(
                    context,
                    "/mainPage",
                  );
                }
              } on DioError catch (e) {
                dialogManager.hideAlertDialog;
                dialogManager.showAlertDialog(
                    "${e.response!.data["error_description"]}");
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

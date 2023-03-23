import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/init/network/login/api_urls.dart';
import 'package:picker/core/init/network/network_manager.dart';
import 'package:picker/view/auth/model/login_model.dart';

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
  bool isRemember = true;

  String company = "";

  late final TextEditingController emailController;
  late final TextEditingController companyController;
  late final TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
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

  Future<bool> createRememberBox() async {
    var box = await Hive.openBox("remember");
    box.put("remember", isRemember);
    if (box.get("remember") == true) {
      return true;
    } else {
      return false;
    }
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
            primary: false,
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: context.horizontalPaddingHigh,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(seconds: 10),
                        child: Padding(
                          padding: context.paddingMedium,
                          child: Image.asset(ImageEnum.pickerLogo.path,
                              height: context.isKeyBoardOpen ? 50 : 100),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Wrap(
                            children: [
                              const Text("Firma"),
                              TextFormField(
                                readOnly: true,
                                onTap: () async {
                                  company = await showAlertDialog(dialogManager
                                      .listTileDialog(
                                          title: "Firma Seçiniz",
                                          list: [
                                        "Firma 1",
                                        "Firma 2",
                                        "Firma 3",
                                      ]));
                                  setState(() {});
                                },
                                decoration: const InputDecoration(
                                    suffixIcon: Icon(Icons.arrow_drop_down)),
                                controller:
                                    TextEditingController(text: company),
                                textInputAction: TextInputAction.next,
                              ),
                            ],
                          ),
                          Wrap(
                            children: [
                              const Text("Email"),
                              TextFormField(
                                controller: emailController,
                                textInputAction: TextInputAction.next,
                              ),
                            ],
                          ),
                          Wrap(
                            children: [
                              const Text("Password"),
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
                await NetworkManager.getToken(
                    path: ApiUrls.token,
                    bodyModel: TokenModel(),
                    data: {
                      "grant_type": "password",
                      "username": emailController.text,
                      "password": passwordController.text,
                    }).then((value) {
                  Hive.box("preferences").put("email", emailController.text);
                  debugPrint("${Hive.box("preferences").get("email")}");
                  Hive.box("preferences")
                      .put("password", passwordController.text);
                  Hive.box("token").put("token", value.accessToken);
                  debugPrint("${Hive.box("preferences").get("password")}");
                  Navigator.restorablePopAndPushNamed(
                    context,
                    "/mainPage",
                  );
                });
              } catch (e) {
                Navigator.of(context, rootNavigator: true).pop();
                dialogManager.hideSnackBar;
                dialogManager.showSnackBar("Hatalı giriş yaptınız.");
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

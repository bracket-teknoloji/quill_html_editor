import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/components/dialog/dialog_manager.dart';
import '../../../core/components/snackbar/snackbar.dart';
import '../../../core/constants/image/image_enums.dart';
import '../../../core/constants/login_page_constants.dart';
import '../../../core/init/network/login/login_service.dart';

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
    companyController = TextEditingController();
    passwordController = TextEditingController();
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
              body: Padding(
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
                                  company = await DialogManager.listTileDialog(
                                          title: "Firma Seçiniz",
                                          context: context);
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
                                            : const Icon(
                                                Icons.visibility_off))),
                                controller: passwordController,
                              )
                            ],
                          ),
                        ],
                      ),
                      elevatedButton(
                          emailController, passwordController, context),
                    ]),
              )),
        ],
      ),
    );
  }

  ElevatedButton elevatedButton(TextEditingController emailController,
      TextEditingController passwordController, BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          DialogManager.loadingDialog(context);
          if (emailController.text.isNotEmpty &&
              passwordController.text.isNotEmpty) {
            await LoginManager.login(
                    company: company,
                    username: emailController.text,
                    password: passwordController.text)
                .then((value) {
              Navigator.of(context, rootNavigator: true).pop();
              if (value == true) {
                Navigator.restorablePopAndPushNamed(
                  context,
                  "/mainPage",
                );
              } else {
                hideSnackBar();
                showSnackBar(SnackBarManager.snackBarError);
              }
            });
          } else {
            hideSnackBar();
            showSnackBar(SnackBarManager.snackBarErrorMissingValue);
          }
        },
        child: const Text(
          "Giriş",
          style: TextStyle(color: Colors.red),
        ));
  }
}

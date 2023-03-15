import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/components/snackbar/snackbar.dart';
import '../../../core/constants/image/image_enums.dart';
import 'package:kartal/kartal.dart';
import '../../../core/init/network/login/login_service.dart';
import '../login_state.dart';
import '../../../core/constants/login_page_constants.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginState());
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Stack(
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
              padding: context.paddingHigh,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: context.paddingMedium,
                        child: Image.asset(ImageEnum.pickerLogo.path),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Wrap(
                          children: [
                            const Text("Email"),
                            TextFormField(
                              controller: emailController,
                            ),
                          ],
                        ),
                        Wrap(
                          children: [
                            const Text("Password"),
                            TextField(
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
                                          : const Icon(Icons.visibility_off))),
                              controller: passwordController,
                            )
                          ],
                        ),
                        elevatedButton(
                            emailController, passwordController, context),
                      ],
                    )
                  ]),
            )),
      ],
    );
  }

  Column loginMembers(TextEditingController emailController, bool isObscure,
      TextEditingController passwordController, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          children: [
            const Text("Email"),
            TextFormField(
              controller: emailController,
            ),
          ],
        ),
        Wrap(
          children: [
            const Text("Password"),
            TextField(
              obscureText: isObscure,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: getIcon(isObscure))),
              controller: passwordController,
            )
          ],
        ),
        elevatedButton(emailController, passwordController, context),
      ],
    );
  }

  ElevatedButton elevatedButton(TextEditingController emailController,
      TextEditingController passwordController, BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          if (emailController.text.isNotEmpty &&
              passwordController.text.isNotEmpty) {
            await LoginManager.login(
                    emailController.text, passwordController.text)
                .then((value) {
              if (value == true) {
                Navigator.restorablePopAndPushNamed(
                  context,
                  "/mainPage",
                );
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBarManager.snackBarError);
              }
            });
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBarManager.snackBarErrorMissingValue);
          }
        },
        child: const Text(
          "Giriş",
          style: TextStyle(color: Colors.red),
        ));
  }
}

Widget getIcon(bool isObscure) {
  if (isObscure) {
    return const Icon(Icons.visibility);
  } else {
    return const Icon(Icons.visibility_off);
  }
}

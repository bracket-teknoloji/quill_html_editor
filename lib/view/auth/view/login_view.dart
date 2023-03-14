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
                    loginMembers(emailController, controller,
                        passwordController, context)
                  ]),
            )),
      ],
    );
  }

  Form loginMembers(
      TextEditingController emailController,
      LoginState controller,
      TextEditingController passwordController,
      BuildContext context) {
    return Form(
      child: Column(
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
              Obx(() => TextFormField(
                    obscureText: controller.isPasswordVisible.value,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.togglePasswordVisibility();
                            },
                            icon: controller.getIcon())),
                    controller: passwordController,
                  ))
            ],
          ),
          elevatedButton(emailController, passwordController, context),
        ],
      ),
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
                    .showSnackBar(SnackBarManager.errorSnackBar);
              }
            });
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBarManager.errorSnackBarMissingvalue);
          }
        },
        child: const Text(
          "Giriş",
          style: TextStyle(color: Colors.red),
        ));
  }
}

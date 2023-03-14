import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picker/core/constants/image/image_enums.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/view/auth/login_state.dart';
import 'package:picker/view/main_page/view/main_page_view.dart';
import '../../core/constants/login_page_constants.dart';

class Loginview extends StatelessWidget {
  const Loginview({super.key});

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
                    loginMembers(emailController, controller, passwordController, context)
                  ]),
            )),
      ],
    );
  }

  Form loginMembers(TextEditingController emailController, LoginState controller, TextEditingController passwordController, BuildContext context) {
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
                                  obscureText:
                                      controller.isPasswordVisible.value,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            controller
                                                .togglePasswordVisibility();
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

  ElevatedButton elevatedButton(TextEditingController emailController, TextEditingController passwordController, BuildContext context) {
    return ElevatedButton(
                            onPressed: () {
                              if (emailController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MainPageView()));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        "Kullanıcı adı veya şifre hatalı"),
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              "Giriş",
                              style: TextStyle(color: Colors.red),
                            ));
  }
}

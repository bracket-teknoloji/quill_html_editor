import 'package:flutter/material.dart';
import 'package:picker/core/constants/image/image_enums.dart';
import 'package:picker/core/constants/login_page_constants.dart';
import 'package:picker/view/auth/login/view-model/login_view_model.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final _viewModel = LoginViewModel();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // Arkaplan
      Container(
          decoration: const BoxDecoration(
        gradient: LoginConstants.linearGradient,
      )),
      Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: context.horizontalPaddingHigh,
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(child: Image.asset(ImageEnum.pickerLogo.path)),
                formField("E-posta"),
                formField("Şifre"),
                elevatedButton(),
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  Observer elevatedButton() {
    return Observer(
        builder: (_) => ElevatedButton(
              onPressed: () {
                debugPrint("username: ${_viewModel.getUsername()}");
              },
              child: const Text(
                "Giriş",
                style: TextStyle(color: Colors.red),
              ),
            ));
  }

  Observer formField(String hintText) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: hintText != "Şifre"
            ? _viewModel.usernameController
            : _viewModel.passwordController,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      );
    });
  }
}

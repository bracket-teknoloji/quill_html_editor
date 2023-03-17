import 'package:flutter/material.dart';

class LoginConstants {
  static var loginFormKey = GlobalKey<FormState>();
  static const linearGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.transparent,
        Colors.red,
      ],
    );
}
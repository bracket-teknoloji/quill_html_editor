import 'package:flutter/material.dart';

class LoginConstants {
  static var loginFormKey = GlobalKey<FormState>();
  static const linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
    stops: [0.2, 0.8],
    colors: [
      Colors.black,
      Color.fromRGBO(186, 60, 22, 1),
    ],
  );
}

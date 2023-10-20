import "package:flutter/material.dart";

import "ui_helper/ui_helper.dart";

class LoginConstants {
  static GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  static LinearGradient linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
    stops: const <double>[0.2, 0.8],
    colors: <Color>[
      Colors.black,
      UIHelper.primaryColor,
    ],
  );
}

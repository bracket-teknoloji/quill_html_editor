import "package:flutter/material.dart";

import "ui_helper/ui_helper.dart";

final class LoginConstants {
  static GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  static LinearGradient linearGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
    stops: [0.2, 0.8],
    colors: [
      Colors.black,
      UIHelper.primaryColor,
    ],
  );
}

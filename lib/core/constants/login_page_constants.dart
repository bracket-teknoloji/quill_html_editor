import "package:flutter/material.dart";

import "ui_helper/ui_helper.dart";

class LoginConstants {
  static var loginFormKey = GlobalKey<FormState>();
  static var linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
    stops: const [0.2, 0.8],
    colors: [
      Colors.black,
      UIHelper.primaryColor,
    ],
  );
}

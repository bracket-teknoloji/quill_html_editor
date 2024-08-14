import "package:flutter/material.dart";
import "package:get/get_utils/src/platform/platform.dart";

abstract class AppTheme {
  ThemeData? theme;
  bool get isIOS => GetPlatform.isIOS;
}

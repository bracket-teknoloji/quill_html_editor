import "package:flutter/material.dart";
import "package:get/get.dart";

import "../color_palette.dart";

class UIHelper {
  static ThemeData get _theme => Get.theme;
  //* Radius
  static BorderRadius get highBorderRadius => BorderRadius.circular(highSize);
  static BorderRadius get midBorderRadius => BorderRadius.circular(midSize);
  static BorderRadius get lowBorderRadius => BorderRadius.circular(lowSize);
  static BorderRadius get zeroBorderRadius => BorderRadius.circular(0);

  //* Padding
  static const EdgeInsets highPadding = EdgeInsets.all(highSize);
  static const EdgeInsets midPadding = EdgeInsets.all(midSize);
  static const EdgeInsets lowPadding = EdgeInsets.all(lowSize);
  static const EdgeInsets zeroPadding = EdgeInsets.all(0);

  static const EdgeInsets highPaddingVertical = EdgeInsets.symmetric(vertical: highSize);
  static const EdgeInsets midPaddingVertical = EdgeInsets.symmetric(vertical: midSize);
  static const EdgeInsets lowPaddingVertical = EdgeInsets.symmetric(vertical: lowSize);
  static const EdgeInsets zeroPaddingVertical = EdgeInsets.symmetric(vertical: 0);

  static const EdgeInsets highPaddingHorizontal = EdgeInsets.symmetric(horizontal: highSize);
  static const EdgeInsets midPaddingHorizontal = EdgeInsets.symmetric(horizontal: midSize);
  static const EdgeInsets lowPaddingHorizontal = EdgeInsets.symmetric(horizontal: lowSize);
  static const EdgeInsets zeroPaddingHorizontal = EdgeInsets.symmetric(horizontal: 0);

  static const EdgeInsets midPaddingOnlyTop = EdgeInsets.only(top: midSize);
  static const EdgeInsets highPaddingOnlyTop = EdgeInsets.only(top: highSize);
  static const EdgeInsets lowPaddingOnlyTop = EdgeInsets.only(top: lowSize);

  //* Size
  static const double highSize = 15;
  static const double midSize = 10;
  static const double lowSize = 5;

  //* color
  static Color get primaryColor => const Color.fromRGBO(189, 61, 23, 1);
  static Color get secondaryColor => _theme.colorScheme.onSurface.withOpacity(0.1);
  static Color getColorWithValue(double bakiye) {
    if (bakiye > 0.0) {
      return ColorPalette.mantis;
    } else if (bakiye < 0) {
      return ColorPalette.persianRed;
    } else {
      return ColorPalette.slateGray;
    }
  }
}

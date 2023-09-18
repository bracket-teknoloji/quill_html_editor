import "package:flutter/material.dart";

class UIHelper {
  //* Radius
  static BorderRadius get highBorderRadius => BorderRadius.circular(highSize);
  static BorderRadius get midBorderRadius => BorderRadius.circular(midSize);
  static BorderRadius get lowBorderRadius => BorderRadius.circular(lowSize);
  static BorderRadius get zeroBorderRadius => BorderRadius.circular(0);

  //* Padding
  static EdgeInsets get highPadding =>  EdgeInsets.all(highSize);
  static EdgeInsets get midPadding =>  EdgeInsets.all(midSize);
  static EdgeInsets get lowPadding =>  EdgeInsets.all(lowSize);
  static EdgeInsets get zeroPadding => const EdgeInsets.all(0);

  static EdgeInsets get highPaddingVertical =>  EdgeInsets.symmetric(vertical: highSize);
  static EdgeInsets get midPaddingVertical =>  EdgeInsets.symmetric(vertical: midSize);
  static EdgeInsets get lowPaddingVertical =>  EdgeInsets.symmetric(vertical: lowSize);
  static EdgeInsets get zeroPaddingVertical => const EdgeInsets.symmetric(vertical: 0);

  static EdgeInsets get highPaddingHorizontal =>  EdgeInsets.symmetric(horizontal: highSize);
  static EdgeInsets get midPaddingHorizontal =>  EdgeInsets.symmetric(horizontal: midSize);
  static EdgeInsets get lowPaddingHorizontal =>  EdgeInsets.symmetric(horizontal: lowSize);
  static EdgeInsets get zeroPaddingHorizontal => const EdgeInsets.symmetric(horizontal: 0);

  static EdgeInsets get midPaddingOnlyTop =>  EdgeInsets.only(top: midSize);
  static EdgeInsets get highPaddingOnlyTop =>  EdgeInsets.only(top: highSize);
  static EdgeInsets get lowPaddingOnlyTop =>  EdgeInsets.only(top: lowSize);

  //* Size
  static double get highSize => 15;
  static double get midSize => 10;
  static double get lowSize => 5;

  //* color
  static Color get primaryColor => const Color.fromRGBO(189, 61, 23, 1);
  static Color getColorWithValue(double bakiye) {
    if (bakiye > 0) {
      return Colors.green;
    } else if (bakiye < 0) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }
}

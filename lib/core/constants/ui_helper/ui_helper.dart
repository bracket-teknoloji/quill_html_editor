import 'package:flutter/material.dart';

class UIHelper {
  //* Radius
  static BorderRadius get highBorderRadius => BorderRadius.circular(15);
  static BorderRadius get midBorderRadius => BorderRadius.circular(10);
  static BorderRadius get lowBorderRadius => BorderRadius.circular(5);
  static BorderRadius get zeroBorderRadius => BorderRadius.circular(0);

  //* Padding
  static EdgeInsets get highPadding => const EdgeInsets.all(15);
  static EdgeInsets get midPadding => const EdgeInsets.all(10);
  static EdgeInsets get lowPadding => const EdgeInsets.all(5);
  static EdgeInsets get zeroPadding => const EdgeInsets.all(0);

  static EdgeInsets get highPaddingVertical => const EdgeInsets.symmetric(vertical: 15);
  static EdgeInsets get midPaddingVertical => const EdgeInsets.symmetric(vertical: 10);
  static EdgeInsets get lowPaddingVertical => const EdgeInsets.symmetric(vertical: 5);
  static EdgeInsets get zeroPaddingVertical => const EdgeInsets.symmetric(vertical: 0);

  static EdgeInsets get highPaddingHorizontal => const EdgeInsets.symmetric(horizontal: 15);
  static EdgeInsets get midPaddingHorizontal => const EdgeInsets.symmetric(horizontal: 10);
  static EdgeInsets get lowPaddingHorizontal => const EdgeInsets.symmetric(horizontal: 5);
  static EdgeInsets get zeroPaddingHorizontal => const EdgeInsets.symmetric(horizontal: 0);

  static EdgeInsets get midPaddingOnlyTop => const EdgeInsets.only(top: 10);
  static EdgeInsets get highPaddingOnlyTop => const EdgeInsets.only(top: 15);
  static EdgeInsets get lowPaddingOnlyTop => const EdgeInsets.only(top: 5);

  //* Size
  static double get highSize => 15;
  static double get midSize => 10;
  static double get lowSize => 5;

  //* color
  static Color get primaryColor => const Color.fromRGBO(186, 60, 22, 1);
}

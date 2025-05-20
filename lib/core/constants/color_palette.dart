import "package:flutter/material.dart";

abstract final class ColorPalette {
  static const Color ecru = Color(0xFFA59C6C);
  static const Color persianRed = Color(0xFFCA3433);
  static const Color skyBlue = Color(0xFF87CEEB);
  static const Color coyote = Color(0xFF795C32);
  static const Color dodgerBlue = Color(0xFF1E90FF);
  static const Color mountbattenPink = Color(0xFF9F7397);
  static const Color blueGray = Color(0xFF6498CE);
  static const Color mantis = Color(0xFF66BB6A);
  static const Color pineGreen = Color(0xFF01796F);
  static const Color mulberry = Color(0xFFC64B8C);
  static const Color slateGray = Color(0xFF708090);
  static const Color outerSpace = Color(0xFF48494B);
  static const Color tomato = Color(0xFFFF6347);
  static const Color gamboge = Color(0xFFEB9605);
  static const Color marineBlue = Color(0xFF84B6BE);
  static const Color asparagus = Color(0xFF729473);
  static const Color surfGreen = Color(0xFF02B59F);
  static const Color carminePink = Color(0xFFE74C3C);

  // With Opacity
  static Color persianRedWithOpacity = persianRed.withValues(alpha: 0.5);
  static Color get mantisWithOpacity => mantis.withValues(alpha: 0.5);
}

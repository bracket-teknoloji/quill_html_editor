import "package:flutter/material.dart";

import "../../init/theme/app_theme_dark.dart";
import "ui_helper.dart";

class TextStyleHelper {
  static ThemeData get theme => AppThemeDark.instance?.theme ?? ThemeData();
  //* Title
  //*
  static const TextStyle title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: UIHelper.primaryColor,
  );
  static const TextStyle titleBlack = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);
  static TextStyle titleWhite = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface);

  //* Subtitle
  //*
  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: UIHelper.primaryColor,
  );
  static final TextStyle subtitleBlack = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black.withOpacity(0.8),
  );
  static TextStyle subtitleWhite = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: theme.colorScheme.onSurface);

  //* Body
  //*
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: UIHelper.primaryColor,
  );
  static const TextStyle captionBlack = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static TextStyle captionWhite = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: theme.colorScheme.onSurface,
  );
}

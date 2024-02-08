import "package:flutter/material.dart";

import "../../init/theme/app_theme_dark.dart";

class TextStyleHelper {
  static ThemeData get theme => AppThemeDark.instance?.theme ?? ThemeData();
  //* Title
  //*
  static final TextStyle title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: theme.colorScheme.inversePrimary,
  );
  static const TextStyle titleBlack = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);
  static TextStyle titleWhite = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface);

  //* Subtitle
  //*
  static final TextStyle subtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: theme.colorScheme.inversePrimary,
  );
  static final TextStyle subtitleBlack = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black.withOpacity(0.8),
  );
  static TextStyle subtitleWhite = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: theme.colorScheme.onSurface);

  //* Body
  //*
  static final TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: theme.colorScheme.inversePrimary,
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

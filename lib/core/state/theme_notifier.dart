import "package:flutter/material.dart";

import "../init/theme/app_theme_dark.dart";

final class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeDark.instance!.theme;
  ThemeData get currentTheme => _currentTheme;

  void changeTheme(ThemeData theme) {
    _currentTheme = theme;
    notifyListeners();
  }
}

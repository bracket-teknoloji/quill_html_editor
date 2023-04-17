import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/ui_helper/ui_helper.dart';
import 'app_theme.dart';

class AppThemeDark extends AppTheme {
  static AppThemeDark? _instance;
  static AppThemeDark? get instance {
    _instance ??= AppThemeDark._init();
    return _instance;
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData.dark(useMaterial3: true).copyWith(
      textTheme: GoogleFonts.dmSansTextTheme().apply(bodyColor: Colors.white),
      brightness: Brightness.light,
      splashFactory: InkRipple.splashFactory,
      primaryColorLight: UIHelper.primaryColor,
      primaryColorDark: UIHelper.primaryColor,
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Colors.black,
        elevation: 0,
        surfaceTintColor: Colors.black,
      ),
      tooltipTheme: const TooltipThemeData(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: Colors.black.withOpacity(0.2),
        space: 0,
        thickness: 0,
        endIndent: UIHelper.midSize,
        indent: UIHelper.midSize,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: UIHelper.primaryColor,
        linearTrackColor: Colors.transparent,
        circularTrackColor: Colors.transparent,
        linearMinHeight: 2,
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
          menuStyle: MenuStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          inputDecorationTheme: InputDecorationTheme(
            iconColor: Colors.red,
            border: OutlineInputBorder(
              borderRadius: UIHelper.highBorderRadius,
              borderSide: const BorderSide(color: Colors.green),
            ),
            errorStyle: const TextStyle(
              fontSize: 0,
              color: Colors.red,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: UIHelper.highBorderRadius,
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: UIHelper.highBorderRadius,
              borderSide: const BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: UIHelper.highBorderRadius,
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: UIHelper.highBorderRadius,
              borderSide: const BorderSide(color: Colors.white),
            ),
          )),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white24,
        foregroundColor: Colors.white,
        shape: CircleBorder(
          side: BorderSide(color: Colors.white),
        ),
      ),
      applyElevationOverlayColor: true,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        splashFactory: InkRipple.splashFactory,
        shape: RoundedRectangleBorder(
          borderRadius: UIHelper.highBorderRadius,
        ),
        foregroundColor: UIHelper.primaryColor,
        backgroundColor: Colors.white,
        textStyle: TextStyle(
          fontFamily: GoogleFonts.dmSans().fontFamily,
          fontSize: 15,
          color: Colors.white,
        ),
      )),
      iconTheme: const IconThemeData(color: Colors.white, size: 30),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: UIHelper.highBorderRadius,
        ),
        actionsPadding: EdgeInsets.zero,
        alignment: Alignment.center,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        titleTextStyle: TextStyle(fontFamily: GoogleFonts.dmSans().fontFamily, color: Colors.black, fontSize: 24),
        contentTextStyle: TextStyle(
          fontFamily: GoogleFonts.dmSans().fontFamily,
          fontSize: 16,
          color: Colors.black87,
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: UIHelper.highBorderRadius,
        ),
      ),
      listTileTheme: ListTileThemeData(
        style: ListTileStyle.list,
        visualDensity: const VisualDensity(vertical: -4),
        shape: RoundedRectangleBorder(
          borderRadius: UIHelper.highBorderRadius,
        ),
        tileColor: Colors.white,
        selectedTileColor: Colors.red,
        textColor: Colors.black,
        iconColor: UIHelper.primaryColor,
        dense: true,
      ),
      drawerTheme: DrawerThemeData(
          endShape: RoundedRectangleBorder(
            borderRadius: UIHelper.zeroBorderRadius,
          ),
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: UIHelper.zeroBorderRadius,
          )),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.red,
        selectionColor: Colors.red,
        selectionHandleColor: Colors.red,
      ),
      useMaterial3: true,
      primaryColor: Colors.blue,
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        overlayColor: MaterialStateProperty.all(UIHelper.primaryColor.withOpacity(0.2)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        textStyle: MaterialStateProperty.all(TextStyle(
          fontFamily: GoogleFonts.dmSans().fontFamily,
          fontSize: 15,
          color: Colors.white,
        )),
      )),
      snackBarTheme: SnackBarThemeData(
        showCloseIcon: true,
        closeIconColor: UIHelper.primaryColor,
        backgroundColor: UIHelper.primaryColor,
        insetPadding: UIHelper.lowPadding,
        shape: RoundedRectangleBorder(
          borderRadius: UIHelper.lowBorderRadius,
        ),
        behavior: SnackBarBehavior.floating,
        actionTextColor: UIHelper.primaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isCollapsed: true,
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderRadius: UIHelper.highBorderRadius,
          borderSide: const BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderRadius: UIHelper.highBorderRadius,
          borderSide: const BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: UIHelper.highBorderRadius,
          borderSide: BorderSide(color: UIHelper.primaryColor),
        ),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          titleSpacing: 10,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: GoogleFonts.dmSans().fontFamily,
            fontSize: 24,
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.white,
          scrolledUnderElevation: 0,
          elevation: 0));
}

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
  ThemeData get theme => ThemeData.from(useMaterial3: true, textTheme: Typography.whiteRedmond, colorScheme: const ColorScheme.dark()).copyWith(
      brightness: Brightness.light,
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
            iconColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: UIHelper.highBorderRadius,
            ),
            errorStyle: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
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
        backgroundColor: Colors.black,
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
          fontFamily: GoogleFonts.roboto().fontFamily,
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
        titleTextStyle: TextStyle(fontFamily: GoogleFonts.roboto().fontFamily, color: Colors.black, fontSize: 24),
        contentTextStyle: TextStyle(
          fontFamily: GoogleFonts.roboto().fontFamily,
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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
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
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
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
          fontFamily: GoogleFonts.roboto().fontFamily,
          fontSize: 15,
          color: Colors.white,
        )),
      )),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isCollapsed: true,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: Colors.red),
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
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontSize: 24,
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.white,
          scrolledUnderElevation: 0,
          elevation: 0));
}

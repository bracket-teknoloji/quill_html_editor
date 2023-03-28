import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

class AppThemeDark extends AppTheme {
  static AppThemeDark? _instance;
  static AppThemeDark? get instance {
    _instance ??= AppThemeDark._init();
    return _instance;
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData.dark().copyWith(
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: CircleBorder(
          side: BorderSide(color: Colors.white),
        ),
      ),
      applyElevationOverlayColor: true,
      dialogBackgroundColor: Colors.blueGrey,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(2),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        textStyle: TextStyle(
          fontFamily: GoogleFonts.roboto().fontFamily,
          fontSize: 15,
          color: Colors.white,
        ),
      )),
      iconTheme: const IconThemeData(color: Colors.white, size: 30),
      dialogTheme: DialogTheme(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.black12,
        titleTextStyle: TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 24),
        contentTextStyle: TextStyle(
          fontFamily: GoogleFonts.roboto().fontFamily,
          fontSize: 16,
          color: Colors.black87,
        ),
        iconColor: Colors.black,
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        style: ListTileStyle.list,
        tileColor: Colors.white12,
        selectedColor: Colors.blue,
        selectedTileColor: Colors.red,
        textColor: Colors.black,
        iconColor: Colors.black,
        dense: true,
      ),
      drawerTheme: const DrawerThemeData(
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.grey),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.red,
        selectionColor: Colors.red,
        selectionHandleColor: Colors.red,
      ),
      useMaterial3: true,
      primaryColor: Colors.blue,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        fillColor: Colors.white,
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(2)),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(2)),
          borderSide: BorderSide(color: Colors.white),
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

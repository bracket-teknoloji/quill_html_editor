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
  var colorManager = ColorScheme.fromSeed(seedColor: UIHelper.primaryColor, brightness: Brightness.dark);
  @override
  ThemeData get theme => ThemeData(
    
      radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all(UIHelper.primaryColor), overlayColor: MaterialStateProperty.all(UIHelper.primaryColor.withOpacity(0.1))),
      useMaterial3: true,
      colorSchemeSeed: UIHelper.primaryColor,
      tabBarTheme: TabBarTheme(
        indicatorColor: UIHelper.primaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: UIHelper.primaryColor,
        labelPadding: UIHelper.lowPadding,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
          style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        foregroundColor: MaterialStateProperty.all(UIHelper.primaryColor),
        overlayColor: MaterialStateProperty.all(UIHelper.primaryColor.withOpacity(0.1)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: UIHelper.lowBorderRadius,
          ),
        ),
      )),
      toggleButtonsTheme: ToggleButtonsThemeData(
          color: colorManager.onPrimaryContainer,
          splashColor: Colors.transparent,
          fillColor: UIHelper.primaryColor,
          borderRadius: UIHelper.lowBorderRadius,
          textStyle: const TextStyle(
            fontSize: 12,
          )),
      brightness: Brightness.dark,
      textTheme: GoogleFonts.dmSansTextTheme().apply(bodyColor: ColorScheme.fromSeed(seedColor: UIHelper.primaryColor, brightness: Brightness.dark).onPrimaryContainer).copyWith(
              bodySmall: TextStyle(
            fontSize: 12,
            color: colorManager.onPrimaryContainer,
          )),
      splashFactory: InkRipple.splashFactory,
      bottomAppBarTheme: const BottomAppBarTheme(
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
        space: 0,
        thickness: 1,
        endIndent: UIHelper.highSize,
        indent: UIHelper.highSize,
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
            errorStyle: const TextStyle(
              fontSize: 12,
              color: Colors.green,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: UIHelper.lowBorderRadius,
              borderSide: const BorderSide(color: Colors.green),
            ),
            border: OutlineInputBorder(
              borderRadius: UIHelper.lowBorderRadius,
              borderSide: const BorderSide(color: Colors.green),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: UIHelper.lowBorderRadius,
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: UIHelper.lowBorderRadius,
              borderSide: const BorderSide(color: Colors.white),
            ),
          )),
      applyElevationOverlayColor: true,
      bottomSheetTheme: const BottomSheetThemeData(
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
        backgroundColor: UIHelper.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: UIHelper.lowBorderRadius,
        ),
      )),
      iconTheme: const IconThemeData(color: Colors.white, size: 30),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: UIHelper.lowBorderRadius,
        ),
        actionsPadding: EdgeInsets.zero,
        alignment: Alignment.center,
        contentTextStyle: const TextStyle(
          fontSize: 16,
        ),
        elevation: 0,
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: UIHelper.lowBorderRadius,
        ),
      ),
      listTileTheme: ListTileThemeData(
        style: ListTileStyle.list,
        visualDensity: const VisualDensity(vertical: -2),
        shape: RoundedRectangleBorder(
          borderRadius: UIHelper.lowBorderRadius,
        ),
        dense: true,
      ),
      drawerTheme: DrawerThemeData(
          endShape: RoundedRectangleBorder(
            borderRadius: UIHelper.zeroBorderRadius,
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: UIHelper.zeroBorderRadius,
          )),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: MaterialStateProperty.all(TextStyle(
          fontFamily: GoogleFonts.dmSans().fontFamily,
          fontSize: 15,
        )),
      )),
      snackBarTheme: SnackBarThemeData(
        showCloseIcon: true,
        closeIconColor: colorManager.onPrimaryContainer,
        backgroundColor: UIHelper.primaryColor,
        contentTextStyle: TextStyle(color: colorManager.onPrimaryContainer),
        insetPadding: UIHelper.lowPadding,
        shape: RoundedRectangleBorder(
          borderRadius: UIHelper.lowBorderRadius,
        ),
        behavior: SnackBarBehavior.floating,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isCollapsed: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: UIHelper.lowBorderRadius,
          borderSide: const BorderSide(color: Colors.white30),
        ),
        border: OutlineInputBorder(
          borderRadius: UIHelper.lowBorderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: UIHelper.lowBorderRadius,
          borderSide: BorderSide(color: UIHelper.primaryColor),
        ),
      ),
      buttonBarTheme: const ButtonBarThemeData(alignment: MainAxisAlignment.spaceBetween, mainAxisSize: MainAxisSize.max, buttonHeight: 10),
      appBarTheme: AppBarTheme(
          titleSpacing: 10,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
            statusBarColor: colorManager.background,
            systemNavigationBarColor: Colors.black,
            systemStatusBarContrastEnforced: true,
          ),
          centerTitle: false,
          iconTheme: IconThemeData(color: colorManager.primary),
          titleTextStyle: TextStyle(color: colorManager.primary, fontSize: 20),
          scrolledUnderElevation: 0,
          elevation: 0));
}
// //!
//   ThemeData get theme2 => ThemeData.dark(useMaterial3: true).copyWith(
//       textTheme: GoogleFonts.dmSansTextTheme().apply(bodyColor: Colors.white),
//       brightness: Brightness.light,
//       splashFactory: InkRipple.splashFactory,
//       primaryColorLight: UIHelper.primaryColor,
//       primaryColorDark: UIHelper.primaryColor,
//       bottomAppBarTheme: const BottomAppBarTheme(
//         color: Colors.black,
//         elevation: 0,
//         surfaceTintColor: Colors.black,
//       ),
//       tooltipTheme: const TooltipThemeData(
//         decoration: BoxDecoration(
//           color: Colors.black,
//           borderRadius: BorderRadius.all(Radius.circular(50)),
//         ),
//         textStyle: TextStyle(
//           color: Colors.white,
//           fontSize: 12,
//         ),
//       ),
//       dividerTheme: DividerThemeData(
//         color: Colors.black.withOpacity(0.2),
//         space: 0,
//         thickness: 0,
//         endIndent: UIHelper.midSize,
//         indent: UIHelper.midSize,
//       ),
//       progressIndicatorTheme: ProgressIndicatorThemeData(
//         color: UIHelper.primaryColor,
//         linearTrackColor: Colors.transparent,
//         circularTrackColor: Colors.transparent,
//         linearMinHeight: 2,
//       ),
//       dropdownMenuTheme: DropdownMenuThemeData(
//           menuStyle: MenuStyle(
//             backgroundColor: MaterialStateProperty.all(Colors.red),
//           ),
//           inputDecorationTheme: InputDecorationTheme(
//             iconColor: Colors.red,
//             border: OutlineInputBorder(
//               borderRadius: UIHelper.lowBorderRadius,
//               borderSide: const BorderSide(color: Colors.green),
//             ),
//             errorStyle: const TextStyle(
//               fontSize: 0,
//               color: Colors.red,
//             ),
//             errorBorder: OutlineInputBorder(
//               borderRadius: UIHelper.lowBorderRadius,
//               borderSide: const BorderSide(color: Colors.red),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderRadius: UIHelper.lowBorderRadius,
//               borderSide: const BorderSide(color: Colors.red),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: UIHelper.lowBorderRadius,
//               borderSide: const BorderSide(color: Colors.white),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: UIHelper.lowBorderRadius,
//               borderSide: const BorderSide(color: Colors.white),
//             ),
//           )),
//       floatingActionButtonTheme: const FloatingActionButtonThemeData(
//         backgroundColor: Colors.white24,
//         foregroundColor: Colors.white,
//         shape: CircleBorder(
//           side: BorderSide(color: Colors.white),
//         ),
//       ),
//       applyElevationOverlayColor: true,
//       bottomSheetTheme: const BottomSheetThemeData(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             top: Radius.circular(15),
//           ),
//         ),
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//         splashFactory: InkRipple.splashFactory,
//         shape: RoundedRectangleBorder(
//           borderRadius: UIHelper.lowBorderRadius,
//         ),
//         foregroundColor: UIHelper.primaryColor,
//         backgroundColor: Colors.white,
//         textStyle: TextStyle(
//           fontFamily: GoogleFonts.dmSans().fontFamily,
//           fontSize: 15,
//           color: Colors.white,
//         ),
//       )),
//       iconTheme: const IconThemeData(color: Colors.white, size: 30),
//       dialogTheme: DialogTheme(
//         shape: RoundedRectangleBorder(
//           borderRadius: UIHelper.lowBorderRadius,
//         ),
//         actionsPadding: EdgeInsets.zero,
//         alignment: Alignment.center,
//         backgroundColor: Colors.white,
//         surfaceTintColor: Colors.white,
//         titleTextStyle: TextStyle(fontFamily: GoogleFonts.dmSans().fontFamily, color: Colors.black, fontSize: 24),
//         contentTextStyle: TextStyle(
//           fontFamily: GoogleFonts.dmSans().fontFamily,
//           fontSize: 16,
//           color: Colors.black87,
//         ),
//         elevation: 0,
//         shadowColor: Colors.transparent,
//       ),
//       cardTheme: CardTheme(
//         color: Colors.white,
//         shadowColor: Colors.transparent,
//         shape: RoundedRectangleBorder(
//           borderRadius: UIHelper.lowBorderRadius,
//         ),
//       ),
//       listTileTheme: ListTileThemeData(
//         style: ListTileStyle.list,
//         shape: RoundedRectangleBorder(
//           borderRadius: UIHelper.lowBorderRadius,
//         ),
//         tileColor: Colors.white,
//         selectedTileColor: Colors.red,
//         textColor: Colors.black,
//         iconColor: UIHelper.primaryColor,
//         dense: true,
//       ),
//       drawerTheme: DrawerThemeData(
//           endShape: RoundedRectangleBorder(
//             borderRadius: UIHelper.zeroBorderRadius,
//           ),
//           surfaceTintColor: Colors.transparent,
//           elevation: 0,
//           shadowColor: Colors.transparent,
//           backgroundColor: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: UIHelper.zeroBorderRadius,
//           )),
//       textSelectionTheme: const TextSelectionThemeData(
//         cursorColor: Colors.red,
//         selectionColor: Colors.red,
//         selectionHandleColor: Colors.red,
//       ),
//       useMaterial3: true,
//       primaryColor: Colors.blue,
//       textButtonTheme: TextButtonThemeData(
//           style: ButtonStyle(
//         splashFactory: InkRipple.splashFactory,
//         overlayColor: MaterialStateProperty.all(UIHelper.primaryColor.withOpacity(0.2)),
//         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//         foregroundColor: MaterialStateProperty.all(Colors.white),
//         backgroundColor: MaterialStateProperty.all(Colors.transparent),
//         textStyle: MaterialStateProperty.all(TextStyle(
//           fontFamily: GoogleFonts.dmSans().fontFamily,
//           fontSize: 15,
//           color: Colors.white,
//         )),
//       )),
//       snackBarTheme: SnackBarThemeData(
//         showCloseIcon: true,
//         closeIconColor: UIHelper.primaryColor,
//         backgroundColor: UIHelper.primaryColor,
//         insetPadding: UIHelper.lowPadding,
//         shape: RoundedRectangleBorder(
//           borderRadius: UIHelper.lowBorderRadius,
//         ),
//         behavior: SnackBarBehavior.floating,
//         actionTextColor: UIHelper.primaryColor,
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         isCollapsed: true,
//         labelStyle: const TextStyle(color: Colors.black),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: UIHelper.lowBorderRadius,
//           borderSide: const BorderSide(color: Colors.white),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: UIHelper.lowBorderRadius,
//           borderSide: const BorderSide(color: Colors.green),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: UIHelper.lowBorderRadius,
//           borderSide: BorderSide(color: UIHelper.primaryColor),
//         ),
//       ),
//       appBarTheme: AppBarTheme(
//           titleSpacing: 10,
//           systemOverlayStyle: SystemUiOverlayStyle(
//             statusBarColor: theme.scaffoldBackgroundColor,
//             statusBarIconBrightness: Brightness.light,
//             systemNavigationBarIconBrightness: Brightness.dark,
//             statusBarBrightness: Brightness.dark,
//           ),
//           centerTitle: true,
//           titleTextStyle: TextStyle(
//             fontFamily: GoogleFonts.dmSans().fontFamily,
//             fontSize: 24,
//           ),
//           backgroundColor: Colors.transparent,
//           shadowColor: Colors.transparent,
//           foregroundColor: Colors.white,
//           scrolledUnderElevation: 0,
//           elevation: 0));
// }

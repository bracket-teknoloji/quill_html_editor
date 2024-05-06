import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get_utils/src/platform/platform.dart";
import "package:google_fonts/google_fonts.dart";

import "../../constants/ui_helper/ui_helper.dart";
import "app_theme.dart";

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight? get instance => _instance ??= AppThemeLight._init();

  AppThemeLight._init();

  ColorScheme colorManager = ColorScheme.fromSeed(seedColor: UIHelper.primaryColor.withOpacity(0.2), brightness: Brightness.light);
  @override
  ThemeData get theme => ThemeData(
        cupertinoOverrideTheme: const CupertinoThemeData(
          primaryColor: UIHelper.primaryColor,
          applyThemeToAll: true,
        ),
        // scaffoldBackgroundColor: colorManager.onInverseSurface,
        platform: GetPlatform.isIOS ? TargetPlatform.iOS : TargetPlatform.android,
        datePickerTheme: DatePickerThemeData(shape: RoundedRectangleBorder(borderRadius: UIHelper.midBorderRadius)),
        radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all(UIHelper.primaryColor), overlayColor: MaterialStateProperty.all(UIHelper.primaryColor.withOpacity(0.1))),
        useMaterial3: true,
        colorSchemeSeed: UIHelper.primaryColor,
        actionIconTheme: ActionIconThemeData(backButtonIconBuilder: (context) => const Icon(Icons.arrow_back_outlined)),
        tabBarTheme: const TabBarTheme(
          indicatorColor: UIHelper.primaryColor,
          labelColor: UIHelper.primaryColor,
          labelPadding: UIHelper.lowPadding,
          labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        segmentedButtonTheme: SegmentedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            foregroundColor: MaterialStateProperty.all(UIHelper.primaryColor),
            overlayColor: MaterialStateProperty.all(UIHelper.primaryColor.withOpacity(0.1)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: UIHelper.lowBorderRadius)),
          ),
        ),
        toggleButtonsTheme: ToggleButtonsThemeData(
          borderRadius: UIHelper.lowBorderRadius,
        ),
        brightness: Brightness.light,
        textTheme: GoogleFonts.dmSansTextTheme().apply(
          bodyColor: colorManager.onSecondaryContainer,
          displayColor: colorManager.onSecondaryContainer,
          decorationColor: colorManager.onSecondaryContainer,
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          elevation: 0,
          surfaceTintColor: colorManager.shadow,
        ),
        tooltipTheme: TooltipThemeData(
          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50))),
          textStyle: TextStyle(color: colorManager.onBackground, fontSize: 12),
        ),
        dividerTheme: DividerThemeData(space: 0, thickness: 1, color: colorManager.onPrimaryContainer.withOpacity(0.2), endIndent: UIHelper.highSize, indent: UIHelper.highSize),
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: UIHelper.primaryColor, linearTrackColor: Colors.transparent, circularTrackColor: Colors.transparent, linearMinHeight: 2),
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            errorStyle: const TextStyle(
              fontSize: 12,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: UIHelper.lowBorderRadius,
            ),
            border: OutlineInputBorder(
              borderRadius: UIHelper.lowBorderRadius,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: UIHelper.lowBorderRadius,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: UIHelper.lowBorderRadius,
            ),
          ),
        ),
        applyElevationOverlayColor: true,
        bottomSheetTheme: const BottomSheetThemeData(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(UIHelper.highSize),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            splashFactory: InkRipple.splashFactory,
            backgroundColor: UIHelper.primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: UIHelper.lowBorderRadius,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: colorManager.primary, size: 30),
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: UIHelper.lowBorderRadius,
          ),
          actionsPadding: EdgeInsets.zero,
          alignment: Alignment.center,
          contentTextStyle: const TextStyle(
            fontSize: 14,
          ),
        ),
        cardTheme: CardTheme(
          elevation: 0,
          color: colorManager.surfaceVariant.withOpacity(0.3),
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
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            splashFactory: InkRipple.splashFactory,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontFamily: GoogleFonts.dmSans().fontFamily,
                fontSize: 15,
              ),
            ),
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          showCloseIcon: true,
          // closeIconColor: colorManager.onBackground,
          backgroundColor: UIHelper.primaryColor,
          contentTextStyle: TextStyle(color: colorManager.onBackground),
          insetPadding: UIHelper.lowPadding,
          shape: RoundedRectangleBorder(
            borderRadius: UIHelper.lowBorderRadius,
          ),
          behavior: SnackBarBehavior.floating,
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: UIHelper.midSize, vertical: UIHelper.midSize),
          isCollapsed: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: UIHelper.lowBorderRadius,
            borderSide: BorderSide(color: colorManager.primary.withOpacity(0.2)),
          ),
          border: OutlineInputBorder(
            borderRadius: UIHelper.lowBorderRadius,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: UIHelper.lowBorderRadius,
            borderSide: const BorderSide(color: UIHelper.primaryColor),
          ),
        ),
        buttonBarTheme: const ButtonBarThemeData(alignment: MainAxisAlignment.spaceBetween, mainAxisSize: MainAxisSize.max, buttonHeight: UIHelper.midSize),
        // scaffoldBackgroundColor: colorManager.surfaceVariant.withOpacity(0.3),
        appBarTheme: AppBarTheme(
          titleSpacing: UIHelper.midSize,
          // backgroundColor: colorManager.primary,
          // foregroundColor: colorManager.oı,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: colorManager.background,
            systemNavigationBarColor: colorManager.background,
            systemStatusBarContrastEnforced: true,
          ),
          centerTitle: false,
          iconTheme: IconThemeData(color: colorManager.primary),
          titleTextStyle: TextStyle(color: colorManager.primary, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: GoogleFonts.dmSans().fontFamily),
          scrolledUnderElevation: 0,
          elevation: 0,
        ),
      );
}

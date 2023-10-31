import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get_utils/src/platform/platform.dart";
import "package:google_fonts/google_fonts.dart";

import "../../constants/ui_helper/ui_helper.dart";
import "app_theme.dart";

class AppThemeDark extends AppTheme {
  static AppThemeDark? _instance;
  static AppThemeDark? get instance => _instance ??= AppThemeDark._init();

  AppThemeDark._init();
  ColorScheme colorManager = ColorScheme.fromSeed(seedColor: UIHelper.primaryColor, brightness: Brightness.light);
  @override
  ThemeData get theme => ThemeData(
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: UIHelper.primaryColor,
          applyThemeToAll: true,
        ),
        platform: GetPlatform.isIOS ? TargetPlatform.iOS : TargetPlatform.android,
        datePickerTheme: DatePickerThemeData(shape: RoundedRectangleBorder(borderRadius: UIHelper.lowBorderRadius)),
        radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all(UIHelper.primaryColor), overlayColor: MaterialStateProperty.all(UIHelper.primaryColor.withOpacity(0.1))),
        useMaterial3: true,
        colorSchemeSeed: UIHelper.primaryColor,
        actionIconTheme: ActionIconThemeData(backButtonIconBuilder: (context) => const Icon(Icons.arrow_back_outlined)),
        tabBarTheme: TabBarTheme(
          indicatorColor: UIHelper.primaryColor,
          labelColor: UIHelper.primaryColor,
          labelPadding: UIHelper.lowPadding,
          labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
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
          color: colorManager.onPrimaryContainer,
          splashColor: Colors.transparent,
          fillColor: UIHelper.primaryColor,
          borderRadius: UIHelper.lowBorderRadius,
          textStyle: const TextStyle(fontSize: 12),
        ),
        brightness: Brightness.light,
        textTheme: GoogleFonts.dmSansTextTheme()
            .apply(bodyColor: ColorScheme.fromSeed(seedColor: UIHelper.primaryColor, brightness: Brightness.light).onPrimaryContainer)
            .copyWith(bodySmall: TextStyle(fontSize: 12, color: colorManager.onPrimaryContainer)),
        splashFactory: InkRipple.splashFactory,
        bottomAppBarTheme: BottomAppBarTheme(elevation: 0, surfaceTintColor: colorManager.shadow),
        tooltipTheme: TooltipThemeData(
          decoration: const BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(50))),
          textStyle: TextStyle(color: colorManager.onBackground, fontSize: 12),
        ),
        dividerTheme: DividerThemeData(space: 0, thickness: 1, color: colorManager.onPrimaryContainer.withOpacity(0.2), endIndent: UIHelper.highSize, indent: UIHelper.highSize),
        progressIndicatorTheme: ProgressIndicatorThemeData(color: UIHelper.primaryColor, linearTrackColor: Colors.transparent, circularTrackColor: Colors.transparent, linearMinHeight: 2),
        dropdownMenuTheme: DropdownMenuThemeData(
          menuStyle: const MenuStyle(),
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
        bottomSheetTheme: BottomSheetThemeData(
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
            foregroundColor: colorManager.onPrimaryContainer,
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
          closeIconColor: colorManager.onBackground,
          backgroundColor: UIHelper.primaryColor,
          contentTextStyle: TextStyle(color: colorManager.onBackground),
          insetPadding: UIHelper.lowPadding,
          shape: RoundedRectangleBorder(
            borderRadius: UIHelper.lowBorderRadius,
          ),
          behavior: SnackBarBehavior.floating,
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: UIHelper.midSize, vertical: UIHelper.midSize),
          isCollapsed: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: UIHelper.lowBorderRadius,
            borderSide: BorderSide(color: colorManager.onBackground.withOpacity(0.3)),
          ),
          border: OutlineInputBorder(
            borderRadius: UIHelper.lowBorderRadius,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: UIHelper.lowBorderRadius,
            borderSide: BorderSide(color: UIHelper.primaryColor),
          ),
        ),
        buttonBarTheme: ButtonBarThemeData(alignment: MainAxisAlignment.spaceBetween, mainAxisSize: MainAxisSize.max, buttonHeight: UIHelper.midSize),
        appBarTheme: AppBarTheme(
          titleSpacing: UIHelper.midSize,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: colorManager.background,
            systemNavigationBarColor: colorManager.onBackground,
            systemStatusBarContrastEnforced: true,
          ),
          centerTitle: false,
          iconTheme: IconThemeData(color: colorManager.primary),
          titleTextStyle: TextStyle(color: colorManager.primary, fontSize: 20),
          scrolledUnderElevation: 0,
          elevation: 0,
        ),
      );
}

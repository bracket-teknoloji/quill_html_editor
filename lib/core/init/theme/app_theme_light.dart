import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get_utils/src/platform/platform.dart";
import "package:google_fonts/google_fonts.dart";

import "../../constants/ui_helper/ui_helper.dart";
import "app_theme.dart";

final class AppThemeLight extends AppTheme {
  AppThemeLight._init();
  static AppThemeLight? _instance;
  static AppThemeLight? get instance => _instance ??= AppThemeLight._init();

  ColorScheme colorManager = ColorScheme.fromSeed(seedColor: UIHelper.primaryColor.withValues(alpha: 0.2));
  @override
  ThemeData get theme => ThemeData(
        cupertinoOverrideTheme: const CupertinoThemeData(
          primaryColor: UIHelper.primaryColor,
          applyThemeToAll: true,
        ),
        platform: GetPlatform.isIOS ? TargetPlatform.iOS : TargetPlatform.android,
        datePickerTheme: DatePickerThemeData(shape: RoundedRectangleBorder(borderRadius: UIHelper.midBorderRadius)),
        radioTheme: RadioThemeData(fillColor: WidgetStateProperty.all(UIHelper.primaryColor), overlayColor: WidgetStateProperty.all(UIHelper.primaryColor.withValues(alpha: 0.1))),
        useMaterial3: true,
        bannerTheme: MaterialBannerThemeData(
          backgroundColor: colorManager.primaryContainer.withValues(alpha: 0.7),
        ),
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
            textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            foregroundColor: WidgetStateProperty.all(UIHelper.primaryColor),
            overlayColor: WidgetStateProperty.all(UIHelper.primaryColor.withValues(alpha: 0.1)),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: UIHelper.lowBorderRadius)),
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
          // elevation: 0,
          surfaceTintColor: colorManager.shadow,
        ),
        tooltipTheme: TooltipThemeData(
          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50))),
          textStyle: TextStyle(color: colorManager.onSurface, fontSize: 12),
        ),
        switchTheme: SwitchThemeData(
          thumbIcon: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const Icon(Icons.check);
            }
            return const Icon(Icons.close_outlined);
          }),
          // trackOutlineColor: WidgetStatePropertyAll(colorManager.onPrimaryFixedVariant),
        ),
        dividerTheme: DividerThemeData(space: 0, thickness: 1, color: colorManager.onPrimaryContainer.withValues(alpha: 0.2), endIndent: UIHelper.midSize, indent: UIHelper.midSize),
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: UIHelper.primaryColor, linearTrackColor: Colors.transparent, circularTrackColor: Colors.transparent, linearMinHeight: 2),
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            errorStyle: const TextStyle(
              fontSize: 12,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: UIHelper.midBorderRadius,
            ),
            border: OutlineInputBorder(
              borderRadius: UIHelper.midBorderRadius,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: UIHelper.midBorderRadius,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: UIHelper.midBorderRadius,
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
              borderRadius: UIHelper.midBorderRadius,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            elevation: 0.4,
            splashFactory: InkRipple.splashFactory,
            side: BorderSide(color: colorManager.secondary),
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
          elevation: 0.4,
          color: colorManager.surfaceContainer,
          shape: RoundedRectangleBorder(
            borderRadius: UIHelper.midBorderRadius,
          ),
        ),
        listTileTheme: ListTileThemeData(
          style: ListTileStyle.list,
          visualDensity: const VisualDensity(vertical: -2),
          shape: RoundedRectangleBorder(
            borderRadius: UIHelper.midBorderRadius,
          ),
          dense: true,
        ),
        drawerTheme: DrawerThemeData(
          endShape: RoundedRectangleBorder(
            borderRadius: UIHelper.zeroBorderRadius,
          ),
          // elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: UIHelper.zeroBorderRadius,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            splashFactory: InkRipple.splashFactory,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            textStyle: WidgetStateProperty.all(
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
          contentTextStyle: TextStyle(color: colorManager.onSurface),
          insetPadding: UIHelper.lowPadding,
          shape: RoundedRectangleBorder(
            borderRadius: UIHelper.midBorderRadius,
          ),
          behavior: SnackBarBehavior.floating,
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: UIHelper.midSize, vertical: UIHelper.midSize),
          isCollapsed: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: UIHelper.midBorderRadius,
            borderSide: BorderSide(color: colorManager.primary.withValues(alpha: 0.2)),
          ),
          border: OutlineInputBorder(
            borderRadius: UIHelper.midBorderRadius,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: UIHelper.lowBorderRadius,
            borderSide: const BorderSide(color: UIHelper.primaryColor),
          ),
        ),

        // scaffoldBackgroundColor: colorManager.surfaceVariant.withValues(alpha: 0.3),
        appBarTheme: AppBarTheme(
          titleSpacing: UIHelper.midSize,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          // backgroundColor: colorManager.primary,
          // foregroundColor: colorManager.oı,
          systemOverlayStyle: SystemUiOverlayStyle(
            // statusBarColor: colorManager.onPrimary,
            statusBarIconBrightness: isIOS ? Brightness.light : Brightness.dark,
            systemNavigationBarColor: colorManager.surface,
            systemNavigationBarDividerColor: colorManager.surface,
            systemNavigationBarIconBrightness: isIOS ? Brightness.light : Brightness.dark,
            statusBarBrightness: isIOS ? Brightness.light : Brightness.dark,
            systemStatusBarContrastEnforced: true,
            systemNavigationBarContrastEnforced: true,
            statusBarColor: colorManager.surface,
            // systemStatusBarContrastEnforced: true,
          ),
          centerTitle: false,
          // backgroundColor: colorManager.surfaceContainerLow,
          iconTheme: IconThemeData(color: colorManager.primary),
          titleTextStyle: TextStyle(color: colorManager.primary, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: GoogleFonts.dmSans().fontFamily),
          // scrolledUnderElevation: 0,
          // elevation: 0,
        ),
      );
}

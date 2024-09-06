import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class BaseScaffold extends Scaffold {
  BaseScaffold({
    final Widget? body,
    final AppBar? appBar,
    super.key,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    super.floatingActionButtonAnimator,
    super.persistentFooterButtons,
    super.drawer,
    super.endDrawer,
    super.bottomSheet,
    super.backgroundColor,
    // super.resizeToAvoidBottomInset,
    // super.primary,
    super.bottomNavigationBar,
    super.drawerDragStartBehavior,
    super.drawerEdgeDragWidth,
    super.drawerEnableOpenDragGesture,
    super.drawerScrimColor,
    super.endDrawerEnableOpenDragGesture,
    // super.extendBody,
    super.extendBodyBehindAppBar,
    super.restorationId,
    super.onDrawerChanged,
    super.onEndDrawerChanged,
    super.persistentFooterAlignment,
  }) : super(
          extendBody: true,
          // primary: bottomNavigationBar != null,
          resizeToAvoidBottomInset: bottomNavigationBar == null,
          body: body == null ? null : Container(alignment: Alignment.topCenter,child: Container(color: Get.theme.scaffoldBackgroundColor, width: (kIsWeb && (Get.context?.isLandscape ?? false)) ? Get.width * 0.5 : null, child: body)),
          appBar: appBar == null
              ? null
              : PreferredSize(
                  preferredSize: Size(kIsWeb ? Get.width * 0.5 : double.maxFinite, (appBar.bottom != null ? 2 : 1) * kToolbarHeight),
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(width: (kIsWeb && (Get.context?.isLandscape ?? false)) ? Get.width * 0.5 : null, child: appBar),
                  ),
                ),
        );
}

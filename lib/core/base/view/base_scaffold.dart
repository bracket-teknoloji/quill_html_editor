import "package:flutter/material.dart";

final class BaseScaffold extends Scaffold {
  const BaseScaffold({
    super.body,
    super.appBar,
    final Color? backgroundColor,
    // final FloatingActionButtonLocation? floatingActionButtonLocation,
    // final Widget? floatingActionButton,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    super.bottomNavigationBar,
    super.key,
    super.floatingActionButtonAnimator,
    super.persistentFooterButtons,
    super.drawer,
    super.endDrawer,
    super.bottomSheet,
    // super.resizeToAvoidBottomInset,
    // super.primary,
    super.drawerDragStartBehavior,
    super.drawerEdgeDragWidth,
    super.drawerEnableOpenDragGesture,
    super.drawerScrimColor,
    super.endDrawerEnableOpenDragGesture,
    // super.extendBody,
    // super.extendBodyBehindAppBar,
    super.restorationId,
    super.onDrawerChanged,
    super.onEndDrawerChanged,
    super.persistentFooterAlignment,
  }) : super(
         extendBody: true,
         extendBodyBehindAppBar: false,
         // primary: bottomNavigationBar != null,
         //  backgroundColor: (kIsWeb && (Get.context?.isLandscape ?? false) ? Colors.transparent : null),
         // floatingActionButton: floatingActionButton?.paddingOnly(right: (kIsWeb && (Get.context?.isLandscape ?? false)) ? Get.width * 0.17 : 0),
         // floatingActionButtonLocation: (kIsWeb && (Get.context?.isLandscape ?? false) ? FloatingActionButtonLocation.miniCenterDocked : null),
         resizeToAvoidBottomInset: bottomNavigationBar == null,
         // : PreferredSize(
         //     preferredSize: Size(kIsWeb ? Get.width * 0.5 : double.maxFinite, (appBar.bottom != null ? 2 : 1) * kToolbarHeight),
         //     child: Align(
         //       child: SizedBox(width: (kIsWeb && (Get.context?.isLandscape ?? false)) ? Get.width * 0.5 : null, child: appBar),
         //     ),
         //   ),
         // bottomNavigationBar: Align(
         //   alignment: Alignment.bottomCenter,
         //   child: Container(
         // //   alignment: Alignment.bottomCenter,
         // //     constraints: kIsWeb && (Get.context?.isLandscape ?? false) ? BoxConstraints(maxWidth: Get.width * 0.5, maxHeight: double.maxFinite) : null,
         //     child: bottomNavigationBar,
         //   ),
         // ),
       );
}

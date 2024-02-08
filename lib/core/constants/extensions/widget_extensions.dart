// an extension on a widget to add safe area
import "dart:ui" as ui;

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:get/get.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/cache/cache_manager.dart";

extension WidgetExtension on Widget {
  Widget get withSafeArea => SafeArea(child: this);
  Widget get withSizedBox => SizedBox(width: (Get.width - UIHelper.midSize) * 0.45, child: this);
  Widget yetkiVarMi(bool yetki) => yetki ? this : const SizedBox();
  Widget? get sizedBoxMi => this is SizedBox ? null : this;

  Future<BitmapDescriptor> toBitmapDescriptor({
    Size? logicalSize,
    Size? imageSize,
    Duration waitToRender = const Duration(milliseconds: 3),
    TextDirection textDirection = TextDirection.ltr,
  }) async {
    final widget = RepaintBoundary(
      child: MediaQuery(data: const MediaQueryData(), child: Directionality(textDirection: TextDirection.ltr, child: this)),
    );
    final pngBytes = await createImageFromWidget(widget, waitToRender: waitToRender, logicalSize: logicalSize, imageSize: imageSize);
    return BitmapDescriptor.fromBytes(pngBytes);
  }

  Future<Uint8List> createImageFromWidget(Widget widget, {Size? logicalSize, required Duration waitToRender, Size? imageSize}) async {
    final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();
    final view = ui.PlatformDispatcher.instance.views.first;
    logicalSize ??= view.physicalSize / view.devicePixelRatio;
    imageSize ??= view.physicalSize;

    // assert(logicalSize.aspectRatio == imageSize.aspectRatio);

    final RenderView renderView = RenderView(
      view: view,
      child: RenderPositionedBox(alignment: Alignment.center, child: repaintBoundary),
      configuration: ViewConfiguration(
        size: logicalSize,
        devicePixelRatio: 1.0,
      ),
    );

    final PipelineOwner pipelineOwner = PipelineOwner();
    final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());

    pipelineOwner.rootNode = renderView;
    renderView.prepareInitialFrame();

    final RenderObjectToWidgetElement<RenderBox> rootElement = RenderObjectToWidgetAdapter<RenderBox>(
      container: repaintBoundary,
      child: widget,
    ).attachToRenderTree(buildOwner);

    buildOwner.buildScope(rootElement);

    await Future.delayed(waitToRender);

    buildOwner.buildScope(rootElement);
    buildOwner.finalizeTree();

    pipelineOwner.flushLayout();
    pipelineOwner.flushCompositingBits();
    pipelineOwner.flushPaint();

    final ui.Image image = await repaintBoundary.toImage(pixelRatio: (imageSize.width) / (logicalSize.width));
    final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
  }
}

extension RowExtension on Row {
  Row get withExpanded => Row(children: children.map((e) => Expanded(child: e)).toList());
}

extension YetkiExtension2 on dynamic {
  Object? isDebug() => (CacheManager.getHesapBilgileri?.uyeEmail == "destek@netfect.com" || kDebugMode
  //  || CacheManager.getHesapBilgileri?.admin == "E"
   ) ? this : null;
  Object? isKDebug() => kDebugMode ? this : null;
}

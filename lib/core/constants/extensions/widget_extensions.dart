// an extension on a widget to add safe area
import "dart:ui" as ui;

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:get/get.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
import "package:picker/core/components/hero/hero_widget.dart";
import "package:picker/core/init/cache/cache_manager.dart";

extension WidgetExtension on Widget {
  Widget yetkiVarMi(bool yetki) => yetki ? this : const SizedBox.shrink();

  Widget wrapWithHero<T>(T tag) => InkWell(onTap: () => Get.to(() => HeroWidget(tag: tag, child: this)), child: this);

  Future<BitmapDescriptor> toBitmapDescriptor({
    Size? logicalSize,
    Size? imageSize,
    Duration waitToRender = const Duration(milliseconds: 30),
    TextDirection textDirection = TextDirection.ltr,
  }) async {
    final widget = RepaintBoundary(
      child: MediaQuery(
        data: const MediaQueryData(),
        child: Directionality(textDirection: TextDirection.ltr, child: this),
      ),
    );

    final view = ui.PlatformDispatcher.instance.views.first;

    final pngBytes = await createImageFromWidget(
      widget,
      waitToRender: waitToRender,
      view: view,
      logicalSize: logicalSize,
      imageSize: imageSize,
    );

    return BitmapDescriptor.bytes(pngBytes, imagePixelRatio: view.devicePixelRatio);
  }

  Future<Uint8List> createImageFromWidget(
    Widget widget, {
    required Duration waitToRender,
    required ui.FlutterView view,
    Size? logicalSize,
    Size? imageSize,
  }) async {
    final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();
    logicalSize ??= view.physicalSize / view.devicePixelRatio;
    imageSize ??= view.physicalSize;

    // assert(logicalSize.aspectRatio == imageSize.aspectRatio);

    final RenderView renderView = RenderView(
      view: view,
      child: RenderPositionedBox(child: repaintBoundary),
      configuration: ViewConfiguration(
        physicalConstraints: BoxConstraints.tight(logicalSize) * view.devicePixelRatio,
        logicalConstraints: BoxConstraints.tight(logicalSize),
        devicePixelRatio: view.devicePixelRatio,
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

    buildOwner
      ..buildScope(rootElement)
      ..finalizeTree();

    pipelineOwner
      ..flushLayout()
      ..flushCompositingBits()
      ..flushPaint();

    final ui.Image image = await repaintBoundary.toImage(pixelRatio: imageSize.width / logicalSize.width);
    final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
  }
}

extension YetkiExtension2 on Object? {
  bool get isNull => this == null;
  Object? isDebug() => (CacheManager.getHesapBilgileri?.uyeEmail == "destek@netfect.com" || kDebugMode) ? this : null;
  Object? isKDebug() => kDebugMode ? this : null;

  // Object? yetkiVarMi(bool? yetki) => yetki == true ? this : null;
}

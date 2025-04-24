import "dart:async";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:mobile_scanner/mobile_scanner.dart";
import "package:permission_handler/permission_handler.dart";

import "../../../../components/wrap/appbar_title.dart";
// import "package:qr_code_scanner/qr_code_scanner.dart";

import "../../../../constants/color_palette.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../../state/base_state.dart";
import "../view_model/qr_view_model.dart";

final class QRScannerView extends StatefulWidget {
  const QRScannerView({super.key});

  @override
  State<QRScannerView> createState() => _QRScannerState();
}

final class _QRScannerState extends BaseState<QRScannerView> with WidgetsBindingObserver {
  final QRViewModel viewModel = QRViewModel();
  final qrKey = GlobalKey(debugLabel: "QR");
  late final MobileScannerController qrViewController;
  Barcode? barcode;
  String result = "Scan a code";

  @override
  void initState() {
    qrViewController = MobileScannerController();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // Stop listening to the barcode events.
    qrViewController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!qrViewController.value.isInitialized) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        unawaited(qrViewController.start());
      case AppLifecycleState.inactive:
        // Stop the scanner when the app is paused.
        // Also stop the barcode events subscription.
        unawaited(qrViewController.stop());
    }
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: const AppBarTitle(title: "QR Kod Okuyucu"),
      actions: [
        if (!kIsWeb)
          Observer(
            builder:
                (_) => IconButton(
                  onPressed: () {
                    viewModel.changeFlash();
                    qrViewController.toggleTorch();
                  },
                  icon: Icon(Icons.flash_on, color: viewModel.isFlashOpen ? ColorPalette.gamboge : null),
                ),
          ),
        if (!kIsWeb)
          Observer(
            builder:
                (_) => IconButton(
                  isSelected: false,
                  onPressed: () {
                    if (viewModel.isFlashOpen) {
                      viewModel.changeFlash();
                      qrViewController.toggleTorch();
                    }
                    viewModel.changeCameraReverse();
                    qrViewController.switchCamera();
                  },
                  icon: Icon(Icons.flip_camera_ios, color: viewModel.isCameraReverse ? ColorPalette.gamboge : null),
                ),
          ),
      ],
    ),
    body: Stack(
      children: [
        Stack(fit: StackFit.expand, children: [buildQrView(), buildResult()]),
        Center(child: CustomPaint(painter: BorderPainter(), child: SizedBox(width: width * 0.7, height: width * 0.7))),
      ],
    ),
  );

  Widget buildQrView() => MobileScanner(
    controller: qrViewController,
    onDetect: _onQRViewCreated,
    onDetectError: (error, stackTrace) {
      // Handle error
      debugPrint("Error: $error");
      debugPrint("StackTrace: $stackTrace");
    },
  );
  Future<void> _onQRViewCreated(BarcodeCapture barcode) async {
    // final PermissionStatus status = await Permission.camera.request();
    // if (status.isDenied) {
    //   return;
    // }
    if (kIsWeb) {
      MobileScannerPlatform.instance.setBarcodeLibraryScriptUrl("bracket.com.tr");
    }
    qrViewController.barcodes.listen((scanData) async {
      if (scanData.barcodes.firstOrNull != null && viewModel.isValueEmpty) {
        if (kIsWeb) {
          // MobileScannerPlatform.instance.setBarcodeLibraryScriptUrl(scriptUrl);
        }
        viewModel.setValue(scanData.barcodes.firstOrNull?.rawValue);
        await qrViewController.stop();
        Get.back(result: scanData.barcodes.firstOrNull?.rawValue);
        return;
        // Navigator.pop(context, scanData.barcodes.firstOrNull?.rawValue);
      }
    });
  }

  Widget buildResult() => Container(
    alignment: Alignment.bottomCenter,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[Colors.black.withAlpha(0), Colors.black12, Colors.black45],
      ),
    ),
    child: SafeArea(
      child: Text(
        "QR Kodu Okutunuz",
        style: context.general.appTheme.textTheme.titleLarge!.copyWith(color: Colors.white),
      ),
    ),
  );
}

final class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const width = UIHelper.lowSize;
    const radius = UIHelper.highSize;
    const tRadius = 2 * radius;
    final rect = Rect.fromLTWH(width, width, size.width - 2 * width, size.height - 2 * width);
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(radius));
    const clippingRect0 = Rect.fromLTWH(0, 0, tRadius, tRadius);
    final clippingRect1 = Rect.fromLTWH(size.width - tRadius, 0, tRadius, tRadius);
    final clippingRect2 = Rect.fromLTWH(0, size.height - tRadius, tRadius, tRadius);
    final clippingRect3 = Rect.fromLTWH(size.width - tRadius, size.height - tRadius, tRadius, tRadius);

    final path =
        Path()
          ..addRect(clippingRect0)
          ..addRect(clippingRect1)
          ..addRect(clippingRect2)
          ..addRect(clippingRect3);

    canvas
      ..clipPath(path)
      ..drawRRect(
        rrect,
        Paint()
          ..color = UIHelper.primaryColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = width,
      );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

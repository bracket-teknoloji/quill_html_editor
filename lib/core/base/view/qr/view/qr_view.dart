import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:permission_handler/permission_handler.dart";
import "package:qr_code_scanner/qr_code_scanner.dart";

import "../../../../constants/color_palette.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../../state/base_state.dart";
import "../view_model/qr_view_model.dart";

class QRScannerView extends StatefulWidget {
  const QRScannerView({super.key});

  @override
  State<QRScannerView> createState() => _QRScannerState();
}

class _QRScannerState extends BaseState<QRScannerView> {
  QRViewModel viewModel = QRViewModel();
  final qrKey = GlobalKey(debugLabel: "QR");
  late final QRViewController qrViewController;
  Barcode? barcode;
  String result = "Scan a code";
  @override
  void dispose() {
    super.dispose();
    qrViewController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("QR Kod Okuyucu"),
          actions: [
            Observer(
              builder: (_) => IconButton(
                onPressed: () {
                  viewModel.changeFlash();
                  qrViewController.toggleFlash();
                },
                icon: Icon(
                  Icons.flash_on,
                  color: viewModel.isFlashOpen ? ColorPalette.gamboge : null,
                ),
              ),
            ),
            Observer(
              builder: (_) => IconButton(
                isSelected: false,
                onPressed: () {
                  if (viewModel.isFlashOpen) {
                    viewModel.changeFlash();
                    qrViewController.toggleFlash();
                  }
                  viewModel.changeCameraReverse();
                  qrViewController.flipCamera();
                },
                icon: Icon(
                  Icons.flip_camera_ios,
                  color: viewModel.isCameraReverse ? ColorPalette.gamboge : null,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [buildQrView(context), buildResult()],
        ),
      );

  Widget buildQrView(BuildContext context) => QRView(
        overlay: QrScannerOverlayShape(
          borderColor: UIHelper.primaryColor,
          borderRadius: UIHelper.midSize,
          borderWidth: UIHelper.midSize * 2,
          cutOutSize: width * 0.7,
          overlayColor: Colors.black.withOpacity(0.7),
        ),
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        cameraFacing: CameraFacing.back,
      );
  Future<void> _onQRViewCreated(QRViewController controller) async {
    final PermissionStatus status = await Permission.camera.status;
    qrViewController = controller;

    if (status.isDenied) {
      await Permission.camera.request();
    }
    qrViewController.scannedDataStream.listen((scanData) async {
      if (scanData.code != null && viewModel.isValueEmpty) {
        viewModel.setValue(scanData.code);
        await qrViewController.pauseCamera();
        log(scanData.code ?? "");
        Get.back(result: scanData.code);
        return;
        // Navigator.pop(context, scanData.code);
      }
    });
  }

  Widget buildResult() => Center(
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: UIHelper.highPaddingHorizontal,
          margin: UIHelper.highPaddingVertical,
          child: Text(
            "QR Kodu Okutunuz",
            style: context.general.appTheme.textTheme.titleLarge!.copyWith(color: theme.colorScheme.onSurface),
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/base/state/base_state.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerView extends StatefulWidget {
  const QRScannerView({super.key});

  @override
  State<QRScannerView> createState() => _QRScannerState();
}

class _QRScannerState extends BaseState<QRScannerView> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrViewController;
  Barcode? barcode;
  String result = "Scan a code";
  @override
  void dispose() {
    super.dispose();
    qrViewController?.dispose();
  }

  bool isFlash = false;
  bool isCameraReverse = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("QR Kod Okuyucu"),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isFlash = !isFlash;
                  });
                  qrViewController?.toggleFlash();
                },
                icon: Icon(Icons.flash_on,
                    color: isFlash ? Colors.amber : Colors.white)),
            IconButton(
                isSelected: false,
                onPressed: () {
                  setState(() {
                    isCameraReverse = !isCameraReverse;
                  });
                  qrViewController?.flipCamera();
                },
                icon: Icon(Icons.flip_camera_ios,
                    color: isCameraReverse ? Colors.amber : Colors.white)),
          ],
        ),
        body: Stack(
          children: [buildQrView(context), buildResult()],
        ),
      ),
    );
  }

  Widget buildQrView(BuildContext context) => QRView(
        overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 50,
          borderWidth: 20,
          cutOutSize: width * 0.7,
          overlayColor: Colors.black.withOpacity(0.5),
        ),
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        cameraFacing: CameraFacing.back,
      );
  void _onQRViewCreated(QRViewController controller) async {
    PermissionStatus status = await Permission.camera.status;
    qrViewController = controller;

    if (status.isDenied) {
      await Permission.camera.request();
    }
    qrViewController?.scannedDataStream.listen((scanData) {
      setState(() {
        barcode = scanData;
        if (barcode?.code != null) {
          Navigator.pop(
            context,
            barcode?.code,
          );
        }
      });
    });
  }

  Widget buildResult() {
    return Center(
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(8),
        child: Text(barcode?.code ?? 'QR Kodu Okutunuz 👆🏼',
            style: context.appTheme.textTheme.titleLarge!
                .copyWith(color: Colors.white)),
      ),
    );
  }
}

import "dart:developer";

import "package:esc_pos_utils_plus/esc_pos_utils_plus.dart";
import "package:flutter_blue_plus/flutter_blue_plus.dart";
import "package:picker/core/base/model/yazici_model.dart";
import "package:picker/core/init/dependency_injection/intectable_interface.dart";
import "package:print_bluetooth_thermal/print_bluetooth_thermal.dart";

final class BluetoothManager implements InjectableInterface {

  Stream<List<YaziciModel>> scanForDevices({void Function()? onError}) async* {
    FlutterBluePlus.adapterState.listen((state) {
      log(state.toString());
      if (state == BluetoothAdapterState.on) {
        // usually start scanning, connecting, etc
      } else {
        onError?.call();
        return;
      }
    });

    List<YaziciModel> devices = [];
    await FlutterBluePlus.startScan(
      timeout: const Duration(seconds: 5),
      // androidLegacy: true,
      continuousUpdates: true,
      removeIfGone: const Duration(seconds: 5),
      androidScanMode: AndroidScanMode.balanced,
      continuousDivisor: 10,
      androidLegacy: true,
      androidUsesFineLocation: true,
    );
    await for (final List<ScanResult> results in FlutterBluePlus.scanResults) {
      log("BluetoothManager.scanForDevices: results: $results");
      devices =
          results
              .map(
                (scanResult) =>
                    YaziciModel(yaziciAdi: scanResult.device.platformName, macAdresi: scanResult.device.remoteId.str),
              )
              .toList();
      yield devices;
    }

    FlutterBluePlus.stopScan();
  }

  Future<void> connectToDevice(String macAdresi) async {
    await PrintBluetoothThermal.connect(macPrinterAddress: macAdresi);
  }

  Future<void> disconnectFromDevice() async {
    if (await PrintBluetoothThermal.connectionStatus) {
      await PrintBluetoothThermal.disconnect;
    }
  }

  Stream<bool> isDeviceConnected(String macAdresi) async* {
    yield await PrintBluetoothThermal.connectionStatus;
  }

  Future<void> printText() async {
    final generator = Generator(PaperSize.mm58, await CapabilityProfile.load());
    final result = await PrintBluetoothThermal.writeBytes(generator.text("Hello World"));
    log("print result: $result");
  }

  Future<void> printTest() async {
    final bool connectionStatus = await PrintBluetoothThermal.connectionStatus;
    if (connectionStatus) {
      final List<int> ticket = await testTicket();
      final result = await PrintBluetoothThermal.writeBytes(ticket);
      log("print result: $result");
    } else {
      //no connected
    }
  }

  Future<List<int>> testTicket() async {
    List<int> bytes = [];
    // Using default profile
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    //bytes += generator.setGlobalFont(PosFontType.fontA);
    bytes += generator.reset();
    bytes += generator.text("Regular: aA bB cC dD eE fF gG hH iI jJ kK lL mM nN oO pP qQ rR sS tT uU vV wW xX yY zZ");
    bytes += generator.text("Special 1: ñÑ àÀ èÈ éÉ üÜ çÇ ôÔ", styles: const PosStyles(codeTable: "CP1252"));
    bytes += generator.text("Special 2: blåbærgrød", styles: const PosStyles(codeTable: "CP1252"));

    bytes += generator.text("Bold text", styles: const PosStyles(bold: true));
    bytes += generator.text("Reverse text", styles: const PosStyles(reverse: true));
    bytes += generator.text("Underlined text", styles: const PosStyles(underline: true), linesAfter: 1);
    bytes += generator.text("Align left");
    bytes += generator.text("Align center", styles: const PosStyles(align: PosAlign.center));
    bytes += generator.text("Align right", styles: const PosStyles(align: PosAlign.right), linesAfter: 1);

    bytes += generator.row([
      PosColumn(text: "col3", width: 3, styles: const PosStyles(align: PosAlign.center, underline: true)),
      PosColumn(text: "col6", width: 6, styles: const PosStyles(align: PosAlign.center, underline: true)),
      PosColumn(text: "col3", width: 3, styles: const PosStyles(align: PosAlign.center, underline: true)),
    ]);

    //barcode
    final List<int> barData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 4];
    bytes += generator.barcode(Barcode.upcA(barData));

    //QR code
    bytes += generator.qrcode("example.com");

    bytes += generator.text("Text size 50%", styles: const PosStyles(fontType: PosFontType.fontB));
    bytes += generator.text("Text size 100%", styles: const PosStyles(fontType: PosFontType.fontA));
    bytes += generator.text(
      "Text size 200%",
      styles: const PosStyles(height: PosTextSize.size2, width: PosTextSize.size2),
    );

    bytes += generator.feed(2);
    //bytes += generator.cut();
    return bytes;
  }

  @override
  Future<void> load() async {
    await FlutterBluePlus.turnOn();
  }
}

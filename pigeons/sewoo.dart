import "package:pigeon/pigeon.dart";

@ConfigurePigeon(
  PigeonOptions(
    kotlinOptions: KotlinOptions(package: "com.bracket25.sewoo"),
    swiftOptions: SwiftOptions(fileSpecificClassNameComponent: "Sewoo"),
    dartOptions: DartOptions(),
    dartOut: "lib/src/sewoo.dart",
    swiftOut: "ios/Runner/Sewoo.generated.swift",
    kotlinOut: "android/app/src/main/kotlin/com/bracket23/picker/Sewoo.kt",
  ),
)
/// Sewoo is a Bluetooth printer
@HostApi()
abstract class Sewoo {
  bool openPort();

  bool closePort();

  @async
  bool printText(String text);

  @async
  bool printImage(Int64List image, int width, int height);

  @async
  bool printPDF(Int64List pdfData, int width, int height);

  PrinterList? checkConnectedAccessories();
}

final class PrinterList {
  PrinterList({required this.printers});
  List<PrinterDetails> printers;
}

final class PrinterDetails {
  PrinterDetails({
    required this.connected,
    required this.connectionID,
    required this.name,
    required this.modelNumber,
    required this.serialNumber,
    required this.width,
    required this.height,
  });
  bool connected;
  int connectionID;
  String name;
  String modelNumber;
  String serialNumber;
  int? width;
  int? height;
}

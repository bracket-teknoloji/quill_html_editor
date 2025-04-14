import "dart:developer";
import "dart:typed_data";

import "package:picker/core/init/dependency_injection/intectable_interface.dart";
import "package:picker/src/sewoo.dart";

class SewooPrinter extends Sewoo implements InjectableInterface {
  SewooPrinter() : super(messageChannelSuffix: "");
  @override
  Future<void> load() async {
    log("SewooPrinter loaded", name: "SewooPrinter");
  }

  @override
  Future<bool> printPDF(Int64List pdfData, int width, int height) {
    openPort();
    return super.printPDF(pdfData, width, height);
  }

  @override
  Future<bool> printText(String text) {
    openPort();
    return super.printText(text);
  }

  @override
  Future<bool> printImage(Int64List image, int width, int height) {
    openPort();
    return super.printImage(image, width, height);
  }
}

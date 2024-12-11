import "dart:html" as web_file;

import "package:flutter/foundation.dart";

void fileDownload(Uint8List data, String fileName) {
  if (kIsWeb) {
    final blob = web_file.Blob([data], "application/pdf", "native");

    web_file.AnchorElement(
      href: web_file.Url.createObjectUrlFromBlob(blob),
    )
      ..setAttribute("download", fileName)
      ..click();
  }
}

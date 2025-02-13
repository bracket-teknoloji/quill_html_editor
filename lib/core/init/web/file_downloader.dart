import "dart:js_interop" as js;

import "package:flutter/foundation.dart";
import "package:web/web.dart" as web_file;

void fileDownload(Uint8List data, String fileName) {
  if (kIsWeb) {
    final blob = web_file.Blob(
      js.JSArray()..add(data.jsify()),
      web_file.BlobPropertyBag(
        type: "native",
        endings: "application/pdf",
      ),
    );

    web_file.HTMLAnchorElement()
      ..href = web_file.URL.createObjectURL(blob)
      ..setAttribute("download", fileName)
      ..click();
  }
}

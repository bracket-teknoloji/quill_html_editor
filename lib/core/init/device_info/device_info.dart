import "dart:developer";
import "dart:io";

import "package:device_info_plus/device_info_plus.dart";
import "package:flutter/foundation.dart";

final class DeviceInfoModel {
  String? model;
  String? brand;
  String? serial;

  Future<void> init() async {
    final deviceInfo = DeviceInfoPlugin();
    if (kIsWeb) {
      log("Running on Web");
      model = "Web";
      brand = "Web";
    }
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      model = androidInfo.model;
      brand = androidInfo.brand;

      log("Running on ${androidInfo.brand}");
      log("Running on ${androidInfo.serialNumber}");
      log("Running on ${androidInfo.data}");
      log("Running on ${Platform.operatingSystem}");
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      log("Running on ${iosInfo.utsname.machine}");
    }
  }
}

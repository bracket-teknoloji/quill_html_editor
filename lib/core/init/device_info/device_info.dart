import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoModel {
  String? model;
  String? brand;
  String? serial;

  Future<void> init() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      model = androidInfo.model;
      brand = androidInfo.brand;

      log('Running on ${androidInfo.brand}');
      log('Running on ${androidInfo.serialNumber}');
      log('Running on ${androidInfo.data.toString()}');
      log('Running on ${Platform.operatingSystem}');
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      log('Running on ${iosInfo.utsname.machine}');
    }
  }
}

import 'package:flutter/material.dart' show debugPrint;
import 'package:package_info_plus/package_info_plus.dart';

class AppInfoModel {
  static String? appName;
  static String? packageName;
  static String? version;
  static String? buildNumber;

  Future<void> init() async {
    final packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.buildSignature;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
    debugPrint('AppInfoModel: $appName, $packageName, $version, $buildNumber');
  }
}

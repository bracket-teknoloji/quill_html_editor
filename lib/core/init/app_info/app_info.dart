import "dart:developer";

import "package:kartal/kartal.dart";

class AppInfoModel {
  String? appName;
  String? packageName;
  String? version;
  String? buildNumber;

  //singleton
  static final AppInfoModel _instance = AppInfoModel._init();
  static AppInfoModel get instance => _instance;
  AppInfoModel._init();

  Future<void> init() async {
    try {
      await DeviceUtility.instance.initPackageInfo();
      appName = CustomPlatform.instance.appName;
      packageName = CustomPlatform.instance.packageName;
      version = CustomPlatform.instance.version;
      buildNumber = CustomPlatform.instance.buildNumber;
    } catch (e) {
      log(e.toString());
    }
  }
}

import 'dart:developer';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:picker/core/base/model/base_network_mixin.dart';

class AppInfoModel with NetworkManagerMixin {
  static late final PackageInfo _packageInfo;
  Future<Map> get getAppData async {
    _packageInfo = await PackageInfo.fromPlatform();
    return {
      "appName": _packageInfo.appName,
      "packageName": _packageInfo.packageName,
      "version": _packageInfo.version,
      "buildNumber": _packageInfo.buildNumber,
    };
  }

  void getAppFile() async {
    var appData = await AppInfoModel().getAppData;
    log(appData.toString());
  }

  @override
  fromJson(Map<String, dynamic> json) {}

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

import "package:package_info_plus/package_info_plus.dart";

final class AppInfoModel {
  AppInfoModel._init();
  String? appName;
  String? packageName;
  String? version;
  String? buildNumber;

  //singleton
  static final AppInfoModel _instance = AppInfoModel._init()..init();
  static AppInfoModel get instance => _instance;

  Future<void> init() async {
    final packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.buildSignature;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
  }
}

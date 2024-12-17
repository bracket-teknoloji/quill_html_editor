import "dart:convert";

import "package:flutter/services.dart" show rootBundle;

class LocaleBase {
  late Map<String, dynamic> _data;
  late String _path;
  Future<void> load(String path) async {
    _path = path;
    final strJson = await rootBundle.loadString(path);
    _data = jsonDecode(strJson);
    initAll();
  }

  Map<String, String> getData(String group) => Map<String, String>.from(_data[group]);

  String getPath() => _path;

  late LocalerightDrawer _rightDrawer;
  LocalerightDrawer get rightDrawer => _rightDrawer;
  late LocaleserviceOperations _serviceOperations;
  LocaleserviceOperations get serviceOperations => _serviceOperations;
  late LocalegeneralStrings _generalStrings;
  LocalegeneralStrings get generalStrings => _generalStrings;

  void initAll() {
    _rightDrawer = LocalerightDrawer(Map<String, String>.from(_data["rightDrawer"]));
    _serviceOperations = LocaleserviceOperations(Map<String, String>.from(_data["serviceOperations"]));
    _generalStrings = LocalegeneralStrings(Map<String, String>.from(_data["generalStrings"]));
  }
}

class LocalerightDrawer {
  LocalerightDrawer(this._data);
  late final Map<String, String> _data;

  String getByKey(String key) => _data[key]!;

  String get sample => _data["sample"]!;
  String get save => _data["save"]!;
  String get profile => _data["profile"]!;
  String get executiveUser => _data["executiveUser"]!;
  String get exit => _data["exit"]!;
  String get changeCompany => _data["changeCompany"]!;
  String get remote => _data["remote"]!;
  String get local => _data["local"]!;
  String get releaseNotes => _data["releaseNotes"]!;
  String get themeChange => _data["themeChange"]!;
  String get darkMode => _data["darkMode"]!;
}

class LocaleserviceOperations {
  LocaleserviceOperations(this._data);
  late final Map<String, String> _data;

  String getByKey(String key) => _data[key]!;

  String get isWebServicesWorking => _data["isWebServicesWorking"]!;
  String get isWebServicesWorkingSubtitle => _data["isWebServicesWorkingSubtitle"]!;
  String get updateService => _data["updateService"]!;
  String get updateServiceSubtitle => _data["updateServiceSubtitle"]!;
  String get dbUpdate => _data["dbUpdate"]!;
  String get dbUpdateSubtitle => _data["dbUpdateSubtitle"]!;
  String get serviceOperationsTitle => _data["serviceOperationsTitle"]!;
  String get netOpenXKernelStatus => _data["netOpenXKernelStatus"]!;
  String get netOpenXKernelStatusSubTitle => _data["netOpenXKernelStatusSubTitle"]!;
  String get eFaturaDLLKayitla => _data["eFaturaDLLKayitla"]!;
  String get eFaturaDLLKayitlaSubTitle => _data["eFaturaDLLKayitlaSubTitle"]!;
  String get netOpenXCreateKernel => _data["netOpenXCreateKernel"]!;
  String get netOpenXCreateKernelSubTitle => _data["netOpenXCreateKernelSubTitle"]!;
  String get netfectWinServiceRestart => _data["netfectWinServiceRestart"]!;
  String get netfectWinServiceRestartSubTitle => _data["netfectWinServiceRestartSubTitle"]!;
}

class LocalegeneralStrings {
  LocalegeneralStrings(this._data);
  late final Map<String, String> _data;

  String getByKey(String key) => _data[key]!;

  String get save => _data["save"]!;
  String get success => _data["success"]!;
  String get error => _data["error"]!;
  String get filter => _data["filter"]!;
  String get sort => _data["sort"]!;
  String get options => _data["options"]!;
  String get edit => _data["edit"]!;
  String get print => _data["print"]!;
  String get delete => _data["delete"]!;
  String get view => _data["view"]!;
  String get actions => _data["actions"]!;
  String get other => _data["other"]!;
  String get general => _data["general"]!;
  String get warning => _data["warning"]!;
  String get refresh => _data["refresh"]!;
  String get apply => _data["apply"]!;
  String get themeChange => _data["themeChange"]!;
  String get cancel => _data["cancel"]!;
  String get ok => _data["ok"]!;
}

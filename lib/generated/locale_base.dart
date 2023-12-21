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

  void initAll() {
    _rightDrawer = LocalerightDrawer(Map<String, String>.from(_data["rightDrawer"]));
    _serviceOperations = LocaleserviceOperations(Map<String, String>.from(_data["serviceOperations"]));
  }
}

class LocalerightDrawer {
  late final Map<String, String> _data;
  LocalerightDrawer(this._data);

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
}

class LocaleserviceOperations {
  late final Map<String, String> _data;
  LocaleserviceOperations(this._data);

  String getByKey(String key) => _data[key]!;

  String get isWebServicesWorking => _data["isWebServicesWorking"]!;
  String get isWebServicesWorkingSubtitle => _data["isWebServicesWorkingSubtitle"]!;
  String get updateService => _data["updateService"]!;
  String get updateServiceSubtitle => _data["updateServiceSubtitle"]!;
  String get dbUpdate => _data["dbUpdate"]!;
  String get dbUpdateSubtitle => _data["dbUpdateSubtitle"]!;
  String get serviceOperations => _data["serviceOperations"]!;
}

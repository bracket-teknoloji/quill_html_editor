import "dart:convert";

import "package:flutter/services.dart" show rootBundle;

class LocaleBase {
  late Map<String, dynamic> _data;
  late Localemain _main;
  late String _path;

  Future<void> load(String path) async {
    _path = path;
    final strJson = await rootBundle.loadString(path);
    _data = jsonDecode(strJson);
    initAll();
  }

  Map<String, String> getData(String group) => Map<String, String>.from(_data[group]);

  String getPath() => _path;

  Localemain get main => _main;

  void initAll() {
    _main = Localemain(Map<String, String>.from(_data["main"]));
  }
}

class Localemain {
  Localemain(this._data);

  late final Map<String, String> _data;

  String getByKey(String key) => _data[key]!;

  String get sample => _data["sample"]!;

  String get save => _data["save"]!;

  String get profile => _data["profile"]!;
}

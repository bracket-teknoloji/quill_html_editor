import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CacheManager {
  static void saveUserData( user) async {
  }

  static Future<String> getUserData() async {
    var box = await Hive.openBox("user");
    return box.get("user");
  }

  static void saveUserPreferences(List data) async {
    var box =  Hive.box("preferences");
    await box.put("user", data);
    debugPrint('User saved \n ${box.toMap().toString()}');
  }
  static void saveDeviceInfo(List data) async {
    var box = Hive.box("deviceInfo");
    await box.put("deviceInfo", data);
    debugPrint('Device Info saved \n ${box.toMap().toString()}');
  }
}

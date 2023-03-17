import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../view/auth/model/login_model.dart';

class CacheManager {
  static void saveUserData(LoginAuth user) async {
    var box = Hive.box<LoginAuth>("burak");
    await box.add(user);
    debugPrint('Kullanıcı kaydedildi \n ${box.values.toString()}');
  }

  static Future<String> getUserData() async {
    var box = await Hive.openBox("user");
    return box.get("user");
  }

  static void saveUserPreferences(List data) async {
    var box = await Hive.openBox("preferences");
    await box.put("user", data);
    debugPrint('User saved \n ${box.toMap().toString()}');
  }
}

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../view/auth/model/login_model.dart';

class CacheManager {
  static void saveUserData(LoginAuth user) async {
    var box = Hive.box<LoginAuth>("deneme");
    await box.add(user);
    debugPrint('User saved \n ${box.toMap().toString()}');
  }

  static Future<String> getUserData() async {
    var box = await Hive.openBox("user");
    return box.get("user");
  }
}

import 'package:hive_flutter/hive_flutter.dart';

import '../../../view/add_company/model/account_response_model.dart';

class CacheManager {
  CacheManager.init() {
    
  Hive.registerAdapter(AccountResponseModelAdapter());
    initHiveBoxes();
  }

  Future<void> initHiveBoxes() async {
    await Hive.initFlutter();
    await Hive.openBox("preferences");
    await Hive.openBox("companies");
    await Hive.openBox("token");
    await Hive.openBox("accounts");
  }

  //* Getters and Setters
  //* Getters
  static String getToken(String query) => Hive.box("token").get(query);
  static String getPref(String query) => Hive.box("preferences").get(query);
  static String companies(String query) => Hive.box("companies").get(query);
  static String accounts(String query) => Hive.box("accounts").get(query);

  //* Setters
  static void setToken(String token) => Hive.box("token").put("token", token);
}

class CacheHelper {
  String token = "token";

}
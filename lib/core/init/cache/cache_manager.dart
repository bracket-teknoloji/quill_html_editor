import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../view/add_company/model/account_response_model.dart';

class CacheManager {
  CacheManager.init() {
    WidgetsFlutterBinding.ensureInitialized();
    Hive.registerAdapter(AccountResponseModelAdapter());
    initHiveBoxes();
  }

  Future<void> initHiveBoxes() async {
    await Hive.initFlutter();
    await Hive.openBox("preferences");
    await Hive.openBox("companies");
    await Hive.openBox("token");
    await Hive.openBox("accounts");
    await Hive.openBox("AnaHesap");
  }

  //*  Getters and Setters

  //* Getters
  static String getToken(String query) => Hive.box("token").get(query);
  static String getPref(String query) => Hive.box("preferences").get(query);
  static String getCompanies(String query) => Hive.box("companies").get(query);
  static AccountResponseModel? getAccounts(String query) => Hive.box("accounts").get(query);

  //* Setters
  static void setToken(String token) => Hive.box("token").put("token", token);
}

class CacheHelper {
  String token = "token";
}

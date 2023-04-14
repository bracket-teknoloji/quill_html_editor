import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../view/add_company/model/account_response_model.dart';
import '../../../view/main_page/model/main_page_model.dart';
import '../../../view/main_page/model/sirket_model.dart';
import '../../../view/main_page/model/user_model/user_model.dart';

class CacheManager {
  static late Box _tokenBox;
  static late Box _preferencesBox;
  static late Box _companiesBox;
  static late Box _accountsBox;
  static late Box _anaVeriBox;
  static late Box _verifiedUsersBox;
  static late Box _veriTabaniBox;
  static late Box _isletmeSubeBox;
  //Lazy Singleton
  static final CacheManager _instance = CacheManager._init();
  static CacheManager get instance => _instance;
  CacheManager._init() {
    WidgetsFlutterBinding.ensureInitialized();
    Hive.registerAdapter(MainPageModelAdapter());
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(SirketModelAdapter());
    Hive.registerAdapter(AccountResponseModelAdapter());
    initHiveBoxes();
  }

  Future<void> initHiveBoxes() async {
    await Hive.initFlutter();
    _preferencesBox = await Hive.openBox("preferences");
    _companiesBox = await Hive.openBox("companies");
    _tokenBox = await Hive.openBox("token");
    _accountsBox = await Hive.openBox("accounts");
    _anaVeriBox = await Hive.openBox<MainPageModel>("anaVeri");
    _verifiedUsersBox = await Hive.openBox("logged");
    _veriTabaniBox = await Hive.openBox("veriTabani");
    _isletmeSubeBox = await Hive.openBox("isletmeSube");
  }

//*  Getters and Setters
  //* Getters
  static String getToken() => _tokenBox.get("token");
  static String getPref(String query) => _preferencesBox.get(query);
  static String getCompanies(String query) => _companiesBox.get(query);
  static MainPageModel? getAnaVeri() => _anaVeriBox.get("data");
  static AccountResponseModel? getAccounts(String query) => _accountsBox.get(query);
  static Map? get getVerifiedUser => _verifiedUsersBox.get("data");
  static Map getVeriTabani() => _veriTabaniBox.get("value");
  static Map getIsletmeSube() => _isletmeSubeBox.get("value");

  //* Setters
  static void setToken(String token) => _tokenBox.put("token", token);
  static void setPref(String key, String value) => _preferencesBox.put(key, value);
  static void setCompanies(String key, String value) => _companiesBox.put(key, value);
  static void setAnaVeri(MainPageModel value) => _anaVeriBox.put("data", value);
  static void setAccounts(String key, AccountResponseModel value) => _accountsBox.put(key, value);
  //TODO DÜZELT
  static void setVerifiedUser(Map value) => _verifiedUsersBox.put("data", value);
  static void setVeriTabani(Map value) => _veriTabaniBox.put("value", value);
  static void setIsletmeSube(Map value) => _isletmeSubeBox.put("value", value);

//* Clear Boxes
  static void clearBox(String boxName) => Hive.box(boxName).clear();
}

class CacheHelper {
  String token = "token";
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../view/add_company/model/account_model.dart';
import '../../../view/add_company/model/account_response_model.dart';
import '../../../view/auth/model/isletme_model.dart';
import '../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_sehirler_model.dart';
import '../../../view/main_page/model/main_page_model.dart';
import '../../../view/main_page/model/param_model.dart';
import '../../../view/main_page/model/sirket_model.dart';
import '../../../view/main_page/model/user_model/user_model.dart';
import 'favorites_model.dart';

class CacheManager {
  static late Box _tokenBox;
  static late Box _preferencesBox;
  static late Box _companiesBox;
  static late Box _accountsBox;
  static late Box _anaHesapBox;
  static late Box _anaVeriBox;
  static late Box _verifiedUsersBox;
  static late Box _veriTabaniBox;
  static late Box _isletmeSubeBox;
  static late Box _favorilerBox;
  static late Box _hesapBilgileriBox;
  static late Box _cariSehirBox;
  static late Box _subeListesiBox;
  static late Box _sirketAdiBox;
  // static late Box _grupKoduListesiBox;
  //Lazy Singleton
  static final CacheManager _instance = CacheManager._init();
  static CacheManager get instance => _instance;
  CacheManager._init() {
    WidgetsFlutterBinding.ensureInitialized();
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(SirketModelAdapter());
    Hive.registerAdapter(AccountResponseModelAdapter());
    Hive.registerAdapter(MainPageModelAdapter());
    Hive.registerAdapter(FavoritesModelAdapter());
    Hive.registerAdapter(AccountModelAdapter());
    Hive.registerAdapter(CariSehirlerModelAdapter());
    Hive.registerAdapter(IsletmeModelAdapter());
    Hive.registerAdapter(NetFectDizaynListAdapter());

    initHiveBoxes();
  }

  Future<void> initHiveBoxes() async {
    await Hive.initFlutter("picker/hive");
    _preferencesBox = await Hive.openBox("preferences");
    _companiesBox = await Hive.openBox("companies");
    _tokenBox = await Hive.openBox("token");
    _accountsBox = await Hive.openBox("accounts");
    _anaHesapBox = await Hive.openBox("anaHesap");
    _anaVeriBox = await Hive.openBox<MainPageModel>("anaVeri");
    _verifiedUsersBox = await Hive.openBox("logged");
    _veriTabaniBox = await Hive.openBox("veriTabani");
    _isletmeSubeBox = await Hive.openBox("isletmeSube");
    _favorilerBox = await Hive.openBox("favoriler");
    _hesapBilgileriBox = await Hive.openBox("hesapBilgileri");
    _cariSehirBox = await Hive.openBox("cariSehir");
    _subeListesiBox = await Hive.openBox<List>("cariListesi");
    _sirketAdiBox = await Hive.openBox("sirketAdi");
  }

//*  Getters and Setters
  //* Getters
  static bool? get getLogout => _preferencesBox.get("logout");
  static String getToken() => _tokenBox.get("token");
  static String getPref(String query) => _preferencesBox.get(query);
  static String getCompanies(String query) => _companiesBox.get(query);
  static AccountResponseModel? getAccounts(String query) => _accountsBox.get(query);

  static MainPageModel? getAnaVeri() => _anaVeriBox.get("data");
  static Map? get getVerifiedUser => _verifiedUsersBox.get("data");
  static Map getVeriTabani() => _veriTabaniBox.get(getVerifiedUser?["user"]) ?? {};
  static Map get getIsletmeSube => _isletmeSubeBox.get(getVerifiedUser?["user"]) ?? {};
  static Map<String, FavoritesModel> getFavoriler() => _favorilerBox.toMap().cast<String, FavoritesModel>();
  static AccountModel getHesapBilgileri() => _hesapBilgileriBox.get("value");
  static CariSehirlerModel getCariSehirler() => _cariSehirBox.get("value");
  static List getSubeListesi() => _subeListesiBox.get("value") ?? [];
  static String get  getSirketAdi => _sirketAdiBox.get("value") ?? "";

  //* Setters
  static void setLogout(bool value) => _preferencesBox.put("logout", value);
  static void setToken(String token) => _tokenBox.put("token", token);
  static void setPref(String key, String value) => _preferencesBox.put(key, value);
  static void setCompanies(String key, String value) => _companiesBox.put(key, value);
  static void setAnaVeri(MainPageModel value) => _anaVeriBox.put("data", value);
  static void setAccounts(AccountResponseModel value) {
    _accountsBox.put(value.email, value);
    log("AccountResponseModel: ${_accountsBox.toMap()}");
  }

  static void setHesapBilgileri(AccountModel value) => _hesapBilgileriBox.put("value", value);

  ///? `[TODO DÜZELT]`
  static void setVerifiedUser(Map value) => _verifiedUsersBox.put("data", value);
  static void setVeriTabani(Map value) => _veriTabaniBox.put(getVerifiedUser?["user"], value);
  static void setIsletmeSube(Map value) => _isletmeSubeBox.put(getVerifiedUser?["user"], value);
  static void setFavoriler(FavoritesModel value) => _favorilerBox.add(value);
  static void setFavorilerSira(int index, FavoritesModel value) => _favorilerBox.putAt(index, value);
  static Future<void> setFavorilerList(List<FavoritesModel> value) async {
    await _favorilerBox.clear();
    _favorilerBox.putAll({for (var e in value) e.title: e});
  }

  static void setCariSehirler(CariSehirlerModel value) => _cariSehirBox.put("value", value);
  static void setSubeListesi(List value) => _subeListesiBox.put("value", value);
  static void setSirketAdi(String value) => _sirketAdiBox.put("value", value);

//* Clear and Remove
  static void clearBox(String boxName) => Hive.box(boxName).clear();
  static void removeFavoriler(String key) {
    if (_favorilerBox.values.toList().indexWhere((element) => element.title == key) >= 0) {
      _favorilerBox.deleteAt(_favorilerBox.values.toList().indexWhere((element) => element.title == key));
    } else {
      log("Favorilerde böyle bir key yok");
    }
  }

  static void removeFavoriWithIndex(int index) => _favorilerBox.deleteAt(index);
}

import "dart:developer";

import "package:flutter/material.dart";
import "package:hive_flutter/hive_flutter.dart";

import "../../../view/add_company/model/account_model.dart";
import "../../../view/add_company/model/account_response_model.dart";
import "../../../view/auth/model/isletme_model.dart";
import "../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_sehirler_model.dart";
import "../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../view/main_page/model/main_page_model.dart";
import "../../../view/main_page/model/param_model.dart";
import "../../../view/main_page/model/sirket_model.dart";
import "../../../view/main_page/model/user_model/user_model.dart";
import "../../base/model/base_profil_parametre_model.dart";
import "../../base/model/login_dialog_model.dart";
import "../../constants/enum/siparis_tipi_enum.dart";
import "../../constants/static_variables/static_variables.dart";
import "favorites_model.dart";

class CacheManager {
  static late Box tokenBox;
  static late Box preferencesBox;
  static late Box companiesBox;
  static late Box accountsBox;
  static late Box anaVeriBox;
  static late Box verifiedUsersBox;
  static late Box veriTabaniBox;
  static late Box isletmeSubeBox;
  static late Box favorilerBox;
  static late Box hesapBilgileriBox;
  static late Box cariSehirBox;
  static late Box subeListesiBox;
  static late Box<bool> isLicenseVerifiedBox;
  static late Box<BaseSiparisEditModel> siparisEditBox;
  static late Box<ListSiparisEditModel> siparisEditListBox;
  static late Box<Map> profilParametreBox;

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
    Hive.registerAdapter(LoginDialogModelAdapter());
    Hive.registerAdapter(BaseSiparisEditModelAdapter());
    Hive.registerAdapter(KalemModelAdapter());
    Hive.registerAdapter(CariListesiModelAdapter());
    Hive.registerAdapter(SiparisTipiEnumAdapter());
    Hive.registerAdapter(ListSiparisEditModelAdapter());
    Hive.registerAdapter(StokListAdapter());
    initHiveBoxes();
  }

  Future<void> initHiveBoxes() async {
    await Hive.initFlutter("picker/hive");
    preferencesBox = await Hive.openBox("preferences");
    companiesBox = await Hive.openBox("companies");
    tokenBox = await Hive.openBox("token");
    accountsBox = await Hive.openBox("accounts");
    anaVeriBox = await Hive.openBox<MainPageModel>("anaVeri");
    verifiedUsersBox = await Hive.openBox("logged");
    veriTabaniBox = await Hive.openBox("veriTabani");
    isletmeSubeBox = await Hive.openBox("isletmeSube");
    favorilerBox = await Hive.openBox("favoriler");
    hesapBilgileriBox = await Hive.openBox("hesapBilgileri");
    cariSehirBox = await Hive.openBox("cariSehir");
    subeListesiBox = await Hive.openBox<List>("cariListesi");
    isLicenseVerifiedBox = await Hive.openBox<bool>("isLicenseVerified");
    siparisEditBox = await Hive.openBox<BaseSiparisEditModel>("siparisEdit");
    siparisEditListBox = await Hive.openBox<ListSiparisEditModel>("siparisEditList");
    profilParametreBox = await Hive.openBox<Map>("profilParametre");
    // profilParametreBox.clear();
    // await verifiedUsersBox.clear();
    // await hesapBilgileriBox.clear();
    // await accountsBox.clear();
    if (profilParametreBox.isEmpty) {
      await profilParametreBox.put("value", BaseProfilParametreModel().toJson());
    }
    if (isLicenseVerifiedBox.isEmpty) {
      await isLicenseVerifiedBox.put("value", false);
    }
    if (verifiedUsersBox.isEmpty) {
      await verifiedUsersBox.put("data", LoginDialogModel(account: AccountResponseModel.demo(firma: "demo", email: "demo@netfect.com"), username: "demo", password: "demo"));
    }
    if (hesapBilgileriBox.isEmpty) {
      await hesapBilgileriBox.put("value", AccountModel.instance);
    }
  }

//*  Getters and Setters
  //* Getters
  static bool? get getLogout => preferencesBox.get("logout");
  static String getToken() => tokenBox.get("token");
  static String getPref(String query) => preferencesBox.get(query);
  static String getCompanies(String query) => companiesBox.get(query);
  static AccountResponseModel? getAccounts(String query) => accountsBox.get(query);

  static MainPageModel? getAnaVeri() => anaVeriBox.get("data");
  static LoginDialogModel get getVerifiedUser => verifiedUsersBox.get("data");
  static Map getVeriTabani() => veriTabaniBox.get(getVerifiedUser.username) ?? {};
  static Map get getIsletmeSube => isletmeSubeBox.get(getVerifiedUser.username) ?? {};
  static Map<String, FavoritesModel> getFavoriler() => favorilerBox.toMap().cast<String, FavoritesModel>();
  static AccountModel? get getHesapBilgileri => hesapBilgileriBox.get("value") ?? AccountModel();
  static CariSehirlerModel getCariSehirler() => cariSehirBox.get("value");
  static List getSubeListesi() => subeListesiBox.get("value") ?? [];
  static bool getIsLicenseVerified(String key) => key == "demo@netfect.com" ? true : (isLicenseVerifiedBox.get(key) ?? false);

  /// Cari Kodu ile arayacaksın
  /// ```dart
  /// // Örnek
  /// BaseSiparisEditModel.instance.cariKodu
  /// ```
  /// {@end-tool}
  static BaseSiparisEditModel? getSiparisEdit(String key) => siparisEditBox.get(key);
  static List<BaseSiparisEditModel?> getSiparisEditList(SiparisTipiEnum siparisTipi) =>
      siparisEditBox.values.where((BaseSiparisEditModel element) => element.siparisTipi == siparisTipi).toList().cast<BaseSiparisEditModel?>();

  static List<BaseSiparisEditModel>? getSiparisEditLists(SiparisTipiEnum siparisTipi) =>
      siparisEditListBox.get(StaticVariables.getSiparisString)?.list?.where((BaseSiparisEditModel element) => element.siparisTipi == siparisTipi).toList().cast<BaseSiparisEditModel>();

  static BaseProfilParametreModel get getProfilParametre => BaseProfilParametreModel.fromJson(
      (profilParametreBox.get("value") ?? {}).cast<String, dynamic>().map((String key, value) => value is Map ? MapEntry(key, value.cast<String, dynamic>()) : MapEntry(key, value)));
  // static String get getSirketAdi => _sirketAdiBox.get("value") ?? "";

  //* Setters
  static Future<void> setLogout(bool value) async => preferencesBox.put("logout", value);
  static Future<void> setToken(String token) async => tokenBox.put("token", token);
  static Future<void> setPref(String key, String value) async => preferencesBox.put(key, value);
  static Future<void> setCompanies(String key, String value) async => companiesBox.put(key, value);
  static Future<void> setAnaVeri(MainPageModel value) async => anaVeriBox.put("data", value);
  static Future<void> setAccounts(AccountResponseModel value) async => accountsBox.put(value.email, value);
  static Future<void> setHesapBilgileri(AccountModel value) async => hesapBilgileriBox.put("value", value);

  ///? `[TODO DÜZELT]`
  static Future<void> setVerifiedUser(LoginDialogModel value) => verifiedUsersBox.put("data", value);
  static Future<void> setVeriTabani(Map value) => veriTabaniBox.put(getVerifiedUser.username, value);
  static Future<void> setIsletmeSube(Map value) => isletmeSubeBox.put(getVerifiedUser.username, value);
  static Future<void> setFavoriler(FavoritesModel value) => favorilerBox.add(value);
  static Future<void> setFavorilerSira(int index, FavoritesModel value) => favorilerBox.putAt(index, value);
  static Future<void> setFavorilerList(List<FavoritesModel> value) async {
    await favorilerBox.clear();
    await favorilerBox.putAll({for (FavoritesModel e in value) e.title: e});
  }

  static Future<void> setCariSehirler(CariSehirlerModel value)async => cariSehirBox.put("value", value);
  static Future<void> setSubeListesi(List value) async => subeListesiBox.put("value", value);
  static Future<void> setIsLicenseVerified(String key, bool value) async => isLicenseVerifiedBox.put(key, value);

  static Future<void> setSiparisEdit(BaseSiparisEditModel value) async => siparisEditBox.put(value.belgeNo, value);
  static Future<void> addSiparisEditListItem(BaseSiparisEditModel value) async {
    if (siparisEditListBox.get(StaticVariables.getSiparisString) == null) {
      await siparisEditListBox.put(StaticVariables.getSiparisString, ListSiparisEditModel());
    }
    if (siparisEditListBox.get(StaticVariables.getSiparisString)?.list?.any((BaseSiparisEditModel element) => element.belgeNo == value.belgeNo) ?? false) {
      await siparisEditListBox.put(StaticVariables.getSiparisString,
          ListSiparisEditModel(list: siparisEditListBox.get(StaticVariables.getSiparisString)?.list?.map((BaseSiparisEditModel e) => e.belgeNo == value.belgeNo ? value : e).toList()));
    } else {
      await siparisEditListBox.put(StaticVariables.getSiparisString, ListSiparisEditModel(list: <BaseSiparisEditModel>[...?siparisEditListBox.get(StaticVariables.getSiparisString)?.list, value]));
    }
  }

  static Future<void> setProfilParametre(BaseProfilParametreModel value) async => profilParametreBox.put("value", value.toJson());

//* Clear and Remove
  static Future<void> resetVerifiedUser() async => setVerifiedUser(LoginDialogModel(account: AccountResponseModel.demo(firma: "demo", email: "demo@netfect.com"), username: "demo", password: "demo"));
  static Future<void> clearBox(String boxName) async => Hive.box(boxName).clear();
  static Future<void> removeFavoriler(String key) async {
    if (favorilerBox.values.toList().indexWhere((element) => element.title == key) >= 0) {
      await favorilerBox.deleteAt(favorilerBox.values.toList().indexWhere((element) => element.title == key));
    } else {
      log("Favorilerde böyle bir key yok");
    }
  }

  static Future<void> removeAccounts(String key) async => accountsBox.delete(key);
  static Future<void> removeFavoriWithIndex(int index) async => favorilerBox.deleteAt(index);
  static Future<void> removeSiparisEdit(String key) async => siparisEditBox.delete(key);
  static Future<void> removeSiparisEditList(int index) async {
    final List<BaseSiparisEditModel>? list = siparisEditListBox.get(StaticVariables.getSiparisString)?.list;
    if (list != null) {
      list.removeAt(index);
    }
    await siparisEditListBox.put(StaticVariables.getSiparisString, ListSiparisEditModel(list: list));
  }

  static Future<bool> removeSiparisEditListWithUuid(String? uuid) async {
    final List<BaseSiparisEditModel>? list = siparisEditListBox.get(StaticVariables.getSiparisString)?.list;
    if (list != null) {
      list.removeWhere((BaseSiparisEditModel element) => element.uuid == uuid);
    }
    await siparisEditListBox.put(StaticVariables.getSiparisString, ListSiparisEditModel(list: list));
    return true;
  }

  //* Helper
}

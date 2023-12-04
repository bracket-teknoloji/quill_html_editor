import "dart:developer";

import "package:flutter/material.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";

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
  static late Box<bool> isUzaktanBox;
  static late Box<BaseSiparisEditModel> siparisEditBox;
  static late Box<ListSiparisEditModel> siparisEditListBox;
  static late Box<BaseSiparisEditModel> faturaEditBox;
  static late Box<ListSiparisEditModel> faturaEditListBox;
  static late Box<BaseSiparisEditModel> talepTeklifEditBox;
  static late Box<ListSiparisEditModel> talepTeklifEditListBox;

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
    Hive.registerAdapter(EditTipiEnumAdapter());
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
    isUzaktanBox = await Hive.openBox<bool>("uzaktanMi");
    siparisEditBox = await Hive.openBox<BaseSiparisEditModel>("siparisEdit");
    siparisEditListBox = await Hive.openBox<ListSiparisEditModel>("siparisEditList");
    profilParametreBox = await Hive.openBox<Map>("profilParametre");
    faturaEditBox = await Hive.openBox<BaseSiparisEditModel>("faturaEdit");
    faturaEditListBox = await Hive.openBox<ListSiparisEditModel>("faturaEditList");
    talepTeklifEditBox = await Hive.openBox<BaseSiparisEditModel>("talepTeklifEdit");
    talepTeklifEditListBox = await Hive.openBox<ListSiparisEditModel>("talepTeklifEditList");
    // profilParametreBox.clear();
    // await verifiedUsersBox.clear();
    // await hesapBilgileriBox.clear();
    // await accountsBox.clear();
    if (profilParametreBox.isEmpty) {
      await profilParametreBox.put(
        "value",
        BaseProfilParametreModel().toJson(),
      );
    }
    if (isLicenseVerifiedBox.isEmpty) {
      await isLicenseVerifiedBox.put("value", false);
    }
    if (verifiedUsersBox.isEmpty) {
      await verifiedUsersBox.put(
        "data",
        LoginDialogModel(
          account: AccountResponseModel.demo(
            firma: "demo",
            email: "demo@netfect.com",
          ),
          username: "demo",
          password: "demo",
        ),
      );
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
  static bool getUzaktanMi(String? sirketAdi) => isUzaktanBox.get(sirketAdi ?? "") ?? true;

  static MainPageModel? get getAnaVeri => anaVeriBox.get("data");
  static LoginDialogModel get getVerifiedUser => verifiedUsersBox.get("data");
  static Map getVeriTabani() => veriTabaniBox.get(getVerifiedUser.username) ?? {};
  static Map get getIsletmeSube => isletmeSubeBox.get(getVerifiedUser.username) ?? {};
  static Map<String, FavoritesModel> get getFavoriler => favorilerBox.toMap().cast<String, FavoritesModel>();
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
  static BaseSiparisEditModel? getSiparisEdit(String cariKodu) => siparisEditBox.get(cariKodu);
  static List<BaseSiparisEditModel?> getSiparisEditList(EditTipiEnum siparisTipi) =>
      siparisEditBox.values.where((element) => element.siparisTipi == siparisTipi).toList().cast<BaseSiparisEditModel?>();
  static List<BaseSiparisEditModel>? getSiparisEditLists(EditTipiEnum siparisTipi) =>
      siparisEditListBox.get(StaticVariables.getSiparisString)?.list?.where((element) => element.siparisTipi == siparisTipi).toList().cast<BaseSiparisEditModel>();

  static BaseSiparisEditModel? getFaturaEdit(String key) => faturaEditBox.get(key);
  static List<BaseSiparisEditModel?> getFaturaEditList(EditTipiEnum siparisTipi) => faturaEditBox.values.where((element) => element.siparisTipi == siparisTipi).toList().cast<BaseSiparisEditModel?>();
  static List<BaseSiparisEditModel>? getFaturaEditLists(EditTipiEnum siparisTipi) =>
      faturaEditListBox.get(StaticVariables.getSiparisString)?.list?.where((element) => element.siparisTipi == siparisTipi).toList().cast<BaseSiparisEditModel>();

  static BaseProfilParametreModel get getProfilParametre => BaseProfilParametreModel.fromJson(
        (profilParametreBox.get("value") ?? {}).cast<String, dynamic>().map(
              (key, value) => value is Map ? MapEntry(key, value.cast<String, dynamic>()) : MapEntry(key, value),
            ),
      );
  // static String get getSirketAdi => _sirketAdiBox.get("value") ?? "";

  //* Setters
  static void setLogout(bool value) => preferencesBox.put("logout", value);
  static void setToken(String token) => tokenBox.put("token", token);
  static void setPref(String key, String value) => preferencesBox.put(key, value);
  static void setCompanies(String key, String value) => companiesBox.put(key, value);
  static void setAnaVeri(MainPageModel value) => anaVeriBox.put("data", value);
  static void setAccounts(AccountResponseModel value) => accountsBox.put(value.email, value);
  static void setHesapBilgileri(AccountModel value) => hesapBilgileriBox.put("value", value);
  static void setUzaktanMi(String? sirketAdi, bool value) => isUzaktanBox.put(sirketAdi, value);

  ///? `[TODO DÜZELT]`
  static void setVerifiedUser(LoginDialogModel value) => verifiedUsersBox.put("data", value);
  static void setVeriTabani(Map value) => veriTabaniBox.put(getVerifiedUser.username, value);
  static void setIsletmeSube(Map value) => isletmeSubeBox.put(getVerifiedUser.username, value);
  static void setFavoriler(FavoritesModel value) => favorilerBox.add(value);
  static void setFavorilerSira(int index, FavoritesModel value) => favorilerBox.putAt(index, value);
  static Future<void> setFavorilerList(List<FavoritesModel> value) async {
    await favorilerBox.clear();
    favorilerBox.putAll({for (var e in value) e.title: e});
  }

  static void setCariSehirler(CariSehirlerModel value) => cariSehirBox.put("value", value);
  static void setSubeListesi(List value) => subeListesiBox.put("value", value);
  static void setIsLicenseVerified(String key, bool value) => isLicenseVerifiedBox.put(key, value);

  static void setSiparisEdit(BaseSiparisEditModel value) => siparisEditBox.put(value.belgeNo, value);
  static void setFaturaEdit(BaseSiparisEditModel value) => faturaEditBox.put(value.belgeNo, value);
  static void setTalepTeklifEdit(BaseSiparisEditModel value) => talepTeklifEditBox.put(value.belgeNo, value);
  static void addSiparisEditListItem(BaseSiparisEditModel value) {
    if (siparisEditListBox.get(StaticVariables.getSiparisString) == null) {
      siparisEditListBox.put(
        StaticVariables.getSiparisString,
        ListSiparisEditModel(),
      );
    }
    if (siparisEditListBox.get(StaticVariables.getSiparisString)?.list?.any((element) => element.belgeNo == value.belgeNo) ?? false) {
      siparisEditListBox.put(
        StaticVariables.getSiparisString,
        ListSiparisEditModel(list: siparisEditListBox.get(StaticVariables.getSiparisString)?.list?.map((e) => e.belgeNo == value.belgeNo ? value : e).toList()),
      );
    } else {
      siparisEditListBox.put(
        StaticVariables.getSiparisString,
        ListSiparisEditModel(
          list: [
            ...?siparisEditListBox.get(StaticVariables.getSiparisString)?.list,
            value,
          ],
        ),
      );
    }
  }

  static void addFaturaEditListItem(BaseSiparisEditModel value) {
    if (faturaEditListBox.get(StaticVariables.getSiparisString) == null) {
      faturaEditListBox.put(
        StaticVariables.getSiparisString,
        ListSiparisEditModel(),
      );
    }
    if (faturaEditListBox.get(StaticVariables.getSiparisString)?.list?.any((element) => element.belgeNo == value.belgeNo) ?? false) {
      faturaEditListBox.put(
        StaticVariables.getSiparisString,
        ListSiparisEditModel(list: faturaEditListBox.get(StaticVariables.getSiparisString)?.list?.map((e) => e.belgeNo == value.belgeNo ? value : e).toList()),
      );
    } else {
      faturaEditListBox.put(
        StaticVariables.getSiparisString,
        ListSiparisEditModel(
          list: [
            ...?faturaEditListBox.get(StaticVariables.getSiparisString)?.list,
            value,
          ],
        ),
      );
    }
  }

  static void addTalepTeklifEditListItem(BaseSiparisEditModel value) {
    if (talepTeklifEditListBox.get(StaticVariables.getSiparisString) == null) {
      talepTeklifEditListBox.put(
        StaticVariables.getSiparisString,
        ListSiparisEditModel(),
      );
    }
    if (talepTeklifEditListBox.get(StaticVariables.getSiparisString)?.list?.any((element) => element.belgeNo == value.belgeNo) ?? false) {
      talepTeklifEditListBox.put(
        StaticVariables.getSiparisString,
        ListSiparisEditModel(list: talepTeklifEditListBox.get(StaticVariables.getSiparisString)?.list?.map((e) => e.belgeNo == value.belgeNo ? value : e).toList()),
      );
    } else {
      talepTeklifEditListBox.put(
        StaticVariables.getSiparisString,
        ListSiparisEditModel(
          list: [
            ...?talepTeklifEditListBox.get(StaticVariables.getSiparisString)?.list,
            value,
          ],
        ),
      );
    }
  }

  static void setProfilParametre(BaseProfilParametreModel value) => profilParametreBox.put("value", value.toJson());

//* Clear and Remove
  static void resetVerifiedUser() => setVerifiedUser(
        LoginDialogModel(
          account: AccountResponseModel.demo(firma: "demo", email: "demo@netfect.com"),
          username: "demo",
          password: "demo",
        ),
      );
  static void clearBox(String boxName) => Hive.box(boxName).clear();
  static void removeFavoriler(String key) {
    if (favorilerBox.values.toList().indexWhere((element) => element.title == key) >= 0) {
      favorilerBox.deleteAt(
        favorilerBox.values.toList().indexWhere((element) => element.title == key),
      );
    } else {
      log("Favorilerde böyle bir key yok");
    }
  }

  static void removeAccounts(String key) => accountsBox.delete(key);
  static void removeFavoriWithIndex(int index) => favorilerBox.deleteAt(index);
  static void removeSiparisEdit(String key) => siparisEditBox.delete(key);
  static void removeSiparisEditList(int index) {
    final list = siparisEditListBox.get(StaticVariables.getSiparisString)?.list;
    if (list != null) {
      list.removeAt(index);
    }
    siparisEditListBox.put(
      StaticVariables.getSiparisString,
      ListSiparisEditModel(list: list),
    );
  }

  static Future<bool> removeSiparisEditListWithUuid(String? uuid) async {
    final list = siparisEditListBox.get(StaticVariables.getSiparisString)?.list;
    if (list != null) {
      list.removeWhere((element) => element.uuid == uuid);
    }
    await siparisEditListBox.put(
      StaticVariables.getSiparisString,
      ListSiparisEditModel(list: list),
    );
    return true;
  }

  static void removeFaturaEdit(String key) => faturaEditBox.delete(key);
  static void removeFaturaEditList(int index) {
    final list = faturaEditListBox.get(StaticVariables.getSiparisString)?.list;
    if (list != null) {
      list.removeAt(index);
    }
    faturaEditListBox.put(
      StaticVariables.getSiparisString,
      ListSiparisEditModel(list: list),
    );
  }

  static Future<bool> removeFaturaEditListWithUuid(String? uuid) async {
    final list = faturaEditListBox.get(StaticVariables.getSiparisString)?.list;
    if (list != null) {
      list.removeWhere((element) => element.uuid == uuid);
    }
    await faturaEditListBox.put(
      StaticVariables.getSiparisString,
      ListSiparisEditModel(list: list),
    );
    return true;
  }

  static void removeTalepTeklifEdit(String key) => talepTeklifEditBox.delete(key);
  static void removeTalepTeklifEditList(int index) {
    final list = talepTeklifEditListBox.get(StaticVariables.getSiparisString)?.list;
    if (list != null) {
      list.removeAt(index);
    }
    talepTeklifEditListBox.put(
      StaticVariables.getSiparisString,
      ListSiparisEditModel(list: list),
    );
  }

  static Future<bool> removeTalepTeklifEditListWithUuid(String? uuid) async {
    final list = talepTeklifEditListBox.get(StaticVariables.getSiparisString)?.list;
    if (list != null) {
      list.removeWhere((element) => element.uuid == uuid);
    }
    await talepTeklifEditListBox.put(
      StaticVariables.getSiparisString,
      ListSiparisEditModel(list: list),
    );
    return true;
  }

  //* Helper
}

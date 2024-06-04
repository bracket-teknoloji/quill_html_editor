import "package:flutter/material.dart";

import "../../../view/add_company/model/account_model.dart";
import "../../base/model/base_grup_kodu_model.dart";
import "../../init/cache/cache_manager.dart";

class StaticVariables {
  //singleton
  StaticVariables._init();
  static StaticVariables? _instance;
  static StaticVariables get instance {
    _instance ??= StaticVariables._init();
    return _instance!;
  }

  static List<BaseGrupKoduModel> grupKodlari = [];

  static String get getSiparisString => "${CacheManager.getVerifiedUser.account?.email ?? ""}-${AccountModel.instance.aktifVeritabani ?? ""}-${AccountModel.instance.aktifSubeKodu ?? ""}";

  //* Cari Kartı
  bool get isCariKartiValid => (cariKartiGenelFormKey.currentState?.validate() ?? false) || (cariKartiDigerFormKey.currentState?.validate() ?? false);
  GlobalKey<FormState> cariKartiGenelFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> cariKartiDigerFormKey = GlobalKey<FormState>();

  //* Stok Kartı
  bool get isStokKartiValid => (stokKartiGenelFormKey.currentState?.validate() ?? false) || (stokKartiDigerFormKey.currentState?.validate() ?? false);
  GlobalKey<FormState> stokKartiGenelFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> stokKartiDigerFormKey = GlobalKey<FormState>();

  //* Sipariş
  bool get isSiparisValid => (siparisGenelFormKey.currentState?.validate() ?? false) || (siparisDigerFormKey.currentState?.validate() ?? false);
  GlobalKey<FormState> siparisGenelFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> siparisDigerFormKey = GlobalKey<FormState>();

  //* Talep
  GlobalKey<FormState> talepTeklifGenelFormKey = GlobalKey<FormState>();

  //* Fatura
  bool get isFaturaValid => faturaGenelFormKey.currentState?.validate() ?? false;
  GlobalKey<FormState> faturaGenelFormKey = GlobalKey<FormState>();

  //* Transfer
  bool get isTransferValid => transferGenelFormKey.currentState?.validate() ?? false;
  GlobalKey<FormState> transferGenelFormKey = GlobalKey<FormState>();

  //* Sayım
  bool get isSayimValid => sayimGenelFormKey.currentState?.validate() ?? false;
  GlobalKey<FormState> sayimGenelFormKey = GlobalKey<FormState>();

  Map<String, dynamic> serbestDicParams = {};
}

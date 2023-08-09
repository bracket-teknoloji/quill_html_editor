import 'package:flutter/material.dart';

import '../../base/model/base_grup_kodu_model.dart';


class StaticVariables {
  //singleton
  StaticVariables._init();
  static StaticVariables? _instance;
  static StaticVariables get instance {
    _instance ??= StaticVariables._init();
    return _instance!;
  }

  static List<BaseGrupKoduModel> grupKodlari = [];

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
}

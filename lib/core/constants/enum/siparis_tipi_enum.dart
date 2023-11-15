import "package:collection/collection.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

import "../yetki_controller/yetki_controller.dart";

part "siparis_tipi_enum.g.dart";

@HiveType(typeId: 79)
enum SiparisTipiEnum {
  @HiveField(0)
  musteri,
  @HiveField(1)
  satici,
  @HiveField(2)
  satisFatura,
  @HiveField(3)
  satisIrsaliye,
  @HiveField(4)
  alisFatura,
  @HiveField(5)
  alisIrsaliye,
}

extension SiparisTipiEnumExtension on SiparisTipiEnum {
  static YetkiController yetkiController = YetkiController();
  String get rawValue {
    switch (this) {
      case SiparisTipiEnum.musteri:
        return "MS";
      case SiparisTipiEnum.satici:
        return "SS";
      case SiparisTipiEnum.satisFatura:
        return "SF";
      case SiparisTipiEnum.satisIrsaliye:
        return "SI";
      case SiparisTipiEnum.alisFatura:
        return "AF";
      case SiparisTipiEnum.alisIrsaliye:
        return "AI";
    }
  }

 
  String get getName {
    switch (this) {
      case SiparisTipiEnum.musteri:
        return "Müşteri Siparişi";
      case SiparisTipiEnum.satici:
        return "Satıcı Siparişi";
      case SiparisTipiEnum.satisFatura:
        return "Satış Faturası";
      case SiparisTipiEnum.satisIrsaliye:
        return "Satış İrsaliyesi";
      case SiparisTipiEnum.alisFatura:
        return "Alış Faturası";
      case SiparisTipiEnum.alisIrsaliye:
        return "Alış İrsaliyesi";
    }
  }

  String get getPrintValue {
    switch (this) {
      case SiparisTipiEnum.musteri:
        return "MusteriSiparisi";
      case SiparisTipiEnum.satici:
        return "SaticiSiparisi";
      case SiparisTipiEnum.satisFatura:
        return "SatisFaturasi";
      case SiparisTipiEnum.satisIrsaliye:
        return "SatisIrsaliyesi";
      case SiparisTipiEnum.alisFatura:
        return "AlisFaturasi";
      case SiparisTipiEnum.alisIrsaliye:
        return "AlisIrsaliyesi";
    }
  }

  bool get satisMi {
    switch (this) {
      case SiparisTipiEnum.musteri:
      case SiparisTipiEnum.satisFatura:
      case SiparisTipiEnum.satisIrsaliye:
        return true;
      case SiparisTipiEnum.satici:
      case SiparisTipiEnum.alisFatura:
      case SiparisTipiEnum.alisIrsaliye:
        return false;
    }
  }

  bool get digerSekmesiGoster {
    switch (this) {
      case SiparisTipiEnum.musteri:
      case SiparisTipiEnum.satici:
        return yetkiController.siparisDigerSekmesiGoster;
      case SiparisTipiEnum.satisFatura:
        return yetkiController.satisFatDigerSekmesiGelsin;
      case SiparisTipiEnum.satisIrsaliye:
        return yetkiController.satisIrsDigerSekmesiGelsin;
      case SiparisTipiEnum.alisFatura:
        return yetkiController.alisFatDigerSekmesiGelsin;
      case SiparisTipiEnum.alisIrsaliye:
        return yetkiController.alisIrsDigerSekmesiGelsin;
      default:
        return false;
    }
  }

  bool get eklensinMi {
    switch (this) {
      case SiparisTipiEnum.musteri:
        return yetkiController.siparisMSKaydet;
      case SiparisTipiEnum.satici:
        return yetkiController.siparisSSKaydet;
      case SiparisTipiEnum.satisFatura:
        return yetkiController.satisFatEkle;
      case SiparisTipiEnum.satisIrsaliye:
        return yetkiController.satisIrsEkle;
      case SiparisTipiEnum.alisFatura:
        return yetkiController.alisFatEkle;
      case SiparisTipiEnum.alisIrsaliye:
        return yetkiController.alisIrsEkle;
    }
  }

  bool get duzenlensinMi {
    switch (this) {
      case SiparisTipiEnum.musteri:
        return yetkiController.siparisMSDuzelt;
      case SiparisTipiEnum.satici:
        return yetkiController.siparisSSDuzelt;
      case SiparisTipiEnum.satisFatura:
        return yetkiController.satisFatDuzenle;
      case SiparisTipiEnum.satisIrsaliye:
        return yetkiController.satisIrsDuzenle;
      case SiparisTipiEnum.alisFatura:
        return yetkiController.alisFatDuzenle;
      case SiparisTipiEnum.alisIrsaliye:
        return yetkiController.alisIrsDuzenle;
    }
  }

  bool get silinsinMi {
    switch (this) {
      case SiparisTipiEnum.musteri:
        return yetkiController.siparisMSSil;
      case SiparisTipiEnum.satici:
        return yetkiController.siparisSSSil;
      case SiparisTipiEnum.satisFatura:
        return yetkiController.satisFatSil;
      case SiparisTipiEnum.satisIrsaliye:
        return yetkiController.satisIrsSil;
      case SiparisTipiEnum.alisFatura:
        return yetkiController.alisFatSil;
      case SiparisTipiEnum.alisIrsaliye:
        return yetkiController.alisIrsSil;
    }
  }

  bool get irsaliyeMi {
    switch (this) {
      case SiparisTipiEnum.musteri:
      case SiparisTipiEnum.satici:
      case SiparisTipiEnum.satisFatura:
      case SiparisTipiEnum.alisFatura:
        return false;
      case SiparisTipiEnum.satisIrsaliye:
      case SiparisTipiEnum.alisIrsaliye:
        return true;
    }
  }

  // BaseSiparisEditModel? get getEditModel {
  //   switch (this) {
  //     case SiparisTipiEnum.musteri:
  //     case SiparisTipiEnum.satici:
  //       return CacheManager.getSiparisEdit(BaseSiparisEditModel.instance.belgeNo ?? "");
  //     case SiparisTipiEnum.satisFatura:
  //     case SiparisTipiEnum.satisIrsaliye:
  //     case SiparisTipiEnum.alisFatura:
  //     case SiparisTipiEnum.alisIrsaliye:
  //       return CacheManager.getFaturaEdit(BaseSiparisEditModel.instance.belgeNo ?? "");
  //   }
  // }

  void setEditModel() {
    switch (this) {
      case SiparisTipiEnum.musteri:
      case SiparisTipiEnum.satici:
        CacheManager.setSiparisEdit(BaseSiparisEditModel.instance);
      case SiparisTipiEnum.satisFatura:
      case SiparisTipiEnum.satisIrsaliye:
      case SiparisTipiEnum.alisFatura:
      case SiparisTipiEnum.alisIrsaliye:
        CacheManager.setFaturaEdit(BaseSiparisEditModel.instance);
    }
  }

  void get addEditListItem {
    switch (this) {
      case SiparisTipiEnum.musteri:
      case SiparisTipiEnum.satici:
        CacheManager.addSiparisEditListItem(BaseSiparisEditModel.instance);
      case SiparisTipiEnum.satisFatura:
      case SiparisTipiEnum.satisIrsaliye:
      case SiparisTipiEnum.alisFatura:
      case SiparisTipiEnum.alisIrsaliye:
        CacheManager.addFaturaEditListItem(BaseSiparisEditModel.instance);
    }
  }

  String get getRoute{
    switch (this) {
      case SiparisTipiEnum.musteri:
        return "/mainPage/siparisMusteriSiparisi";
      case SiparisTipiEnum.satici:
        return "/mainPage/siparisSaticiSiparisi";
        default:
        return "/mainPage/siparisSaticiSiparisi";
    }
  }

  SiparisTipiEnum? getSiparisTipiEnumWithRawValue(String? rawValue) => SiparisTipiEnum.values.firstWhereOrNull((element) => element.rawValue == rawValue);
}

import "package:hive_flutter/hive_flutter.dart";

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
}

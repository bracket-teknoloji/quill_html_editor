import "package:hive_flutter/hive_flutter.dart";

part "siparis_tipi_enum.g.dart";

@HiveType(typeId: 79)
enum SiparisTipiEnum {
  @HiveField(0)
  musteri,
  @HiveField(1)
  satici
}

extension SiparisTipiEnumExtension on SiparisTipiEnum {
  String get rawValue {
    switch (this) {
      case SiparisTipiEnum.musteri:
        return "MS";
      case SiparisTipiEnum.satici:
        return "SS";
    }
  }

  String get getName {
    switch (this) {
      case SiparisTipiEnum.musteri:
        return "Müşteri Siparişi";
      case SiparisTipiEnum.satici:
        return "Satıcı Siparişi";
    }
  }

  String get getPrintValue {
    switch (this) {
      case SiparisTipiEnum.musteri:
        return "MusteriSiparisi";
      case SiparisTipiEnum.satici:
        return "SaticiSiparisi";
    }
  }
}

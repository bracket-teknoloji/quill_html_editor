import 'package:hive_flutter/hive_flutter.dart';

part 'siparis_tipi_enum.g.dart';

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
}

enum SerbestRaporDetayKodEnum { cari, stok, kasa, cek, senet, finans, kaliteKontrol }

extension SerbestRaporDetayKodEnumExtension on SerbestRaporDetayKodEnum {
  //return capitalized with method
  String get value => "${toString().split('.').last[0].toUpperCase()}${toString().split('.').last.substring(1)}";

  String get detayKod => switch (this) {
    SerbestRaporDetayKodEnum.cari => "Cari",
    SerbestRaporDetayKodEnum.stok => "Stok",
    SerbestRaporDetayKodEnum.kasa => "Kasa",
    SerbestRaporDetayKodEnum.cek => "Çek",
    SerbestRaporDetayKodEnum.senet => "Senet",
    SerbestRaporDetayKodEnum.finans => "Finans",
    SerbestRaporDetayKodEnum.kaliteKontrol => "Kalite Kontrol",
  };
}

enum SerbestRaporDetayKodEnum { cari, stok, kasa, cek, senet, finans, kaliteKontrol, siparis, hepsi }

extension SerbestRaporDetayKodEnumExtension on SerbestRaporDetayKodEnum {
  //return capitalized with method
  String get value => "${toString().split('.').last[0].toUpperCase()}${toString().split('.').last.substring(1)}";

  bool get hepsiMi => this == SerbestRaporDetayKodEnum.hepsi;

  String get detayKod => switch (this) {
    SerbestRaporDetayKodEnum.cari => "Cari",
    SerbestRaporDetayKodEnum.stok => "Stok",
    SerbestRaporDetayKodEnum.kasa => "Kasa",
    SerbestRaporDetayKodEnum.cek => "Çek",
    SerbestRaporDetayKodEnum.senet => "Senet",
    SerbestRaporDetayKodEnum.finans => "Finans",
    SerbestRaporDetayKodEnum.siparis => "Sipariş",
    SerbestRaporDetayKodEnum.kaliteKontrol => "Kalite Kontrol",
    SerbestRaporDetayKodEnum.hepsi => "Hepsi",
  };
}

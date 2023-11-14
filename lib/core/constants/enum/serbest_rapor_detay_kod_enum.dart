enum SerbestRaporDetayKodEnum { cari, stok, kasa, cek, senet, finans }

extension SerbestRaporDetayKodEnumExtension on SerbestRaporDetayKodEnum {
  //return capitalized with method
  String get value => "${toString().split('.').last[0].toUpperCase()}${toString().split('.').last.substring(1)}";

  String get detayKod {
    switch (this) {
      case SerbestRaporDetayKodEnum.cari:
        return "Cari";
      case SerbestRaporDetayKodEnum.stok:
        return "Stok";
      case SerbestRaporDetayKodEnum.kasa:
        return "Kasa";
      case SerbestRaporDetayKodEnum.cek:
        return "Çek";
      case SerbestRaporDetayKodEnum.senet:
        return "Senet";
      case SerbestRaporDetayKodEnum.finans:
        return "Finans";
      default:
        throw Exception("Böyle bir değer yok");
    }
  }
}

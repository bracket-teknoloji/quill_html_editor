enum SerbestRaporDetayKodEnum { cari, stok, kasa, cek, finans }

extension SerbestRaporDetayKodEnumExtension on SerbestRaporDetayKodEnum {
  //return capitalized with method
  String get value => "${toString().split('.').last[0].toUpperCase()}${toString().split('.').last.substring(1)}";
}

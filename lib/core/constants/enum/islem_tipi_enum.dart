enum IslemTipiEnum { stok, cari, stokRapor, cariRapor, stokSerbest, cariSerbest }
extension IslemTipiEnumExtension on IslemTipiEnum {
  String get value {
    //return capitalized with method
    return "${toString().split('.').last[0].toUpperCase()}${toString().split('.').last.substring(1)}";
  }
}

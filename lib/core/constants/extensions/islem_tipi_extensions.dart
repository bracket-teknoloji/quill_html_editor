import "../enum/islem_tipi_enum.dart";

extension IslemTipiExtensions on IslemTipiEnum {
  bool get islemMi {
    switch (this) {
      case IslemTipiEnum.cari:
      case IslemTipiEnum.stok:
        return true;
      default:
        return false;
    }
  }
}

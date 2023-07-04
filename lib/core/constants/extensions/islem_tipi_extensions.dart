

import '../enum/islem_tipi_enum.dart';

extension IslemTipiExtensions on IslemTipi {
  bool get islemMi {
    switch (this) {
      case IslemTipi.cari:
      case IslemTipi.stok:
        return true;
      default:
        return false;
    }
  }
}
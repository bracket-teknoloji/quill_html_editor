enum GrupKoduEnum { cari, stok }

extension GrupKoduEnumExtension on GrupKoduEnum {
  String get rawValue {
    switch (this) {
      case GrupKoduEnum.cari:
        return "CARI";
      case GrupKoduEnum.stok:
        return "STOK";
    }
  }
}

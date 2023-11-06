enum CekSenetListesiEnum { cekMusteri, senetMusteri, cekBorc, senetBorc }

extension CekSenetExtensions on CekSenetListesiEnum {
  String get title {
    switch (this) {
      case CekSenetListesiEnum.cekMusteri:
        return "Müşteri Çekleri";
      case CekSenetListesiEnum.senetMusteri:
        return "Müşteri Senetleri";
      case CekSenetListesiEnum.cekBorc:
        return "Borç Çekleri";
      case CekSenetListesiEnum.senetBorc:
        return "Borç Senetleri";
    }
  }

  String get belgeTipi {
    switch (this) {
      case CekSenetListesiEnum.cekMusteri:
        return "MCEK";
      case CekSenetListesiEnum.senetMusteri:
        return "MSEN";
      case CekSenetListesiEnum.cekBorc:
        return "BCEK";
      case CekSenetListesiEnum.senetBorc:
        return "BSEN";
    }
  }
}

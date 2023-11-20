

enum CirolaEnum {cari,tahsil}

extension CirolaEnumExtensions on CirolaEnum{

  String get belgeTipi {
    switch (this) {
      case CirolaEnum.cari:
        return "CHC";
      case CirolaEnum.tahsil:
        return "THC";
    }
  }

  String get name {
    switch (this) {
      case CirolaEnum.cari:
        return "Cari Hesaba Cirola";
      case CirolaEnum.tahsil:
        return "Tahsil Hesaba Cirola";
    }
  }
}
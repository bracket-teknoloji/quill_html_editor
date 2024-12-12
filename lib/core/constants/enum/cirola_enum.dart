enum CirolaEnum { cari, tahsil }

extension CirolaEnumExtensions on CirolaEnum {
  String get belgeTipi => switch (this) {
        CirolaEnum.cari => "CHC",
        CirolaEnum.tahsil => "THC",
      };

  String get name => switch (this) {
        CirolaEnum.cari => "Cari Hesaba Cirola",
        CirolaEnum.tahsil => "Tahsil Hesaba Cirola",
      };
}

enum GrupKoduEnum {
  cari("CARI"),
  stok("STOK");

  final String module;

  const GrupKoduEnum(this.module);

  static GrupKoduEnum getByName(String name) => GrupKoduEnum.values.firstWhere((e) => e.module == name);
}

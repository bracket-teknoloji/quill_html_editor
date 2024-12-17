enum GrupKoduEnum {
  cari("CARI"),
  stok("STOK");

  const GrupKoduEnum(this.module);

  final String module;

  static GrupKoduEnum getByName(String name) => GrupKoduEnum.values.firstWhere((e) => e.module == name);
}

enum HucreTakibiIslemTuruEnum {
  hucreYerlestir("HY"),
  hucreBosalt("HB"),
  hucreTransferi("HT");

  const HucreTakibiIslemTuruEnum(this.kodu);

  final String kodu;

  String get getName => switch (this) {
    //* When kullanımı için örnek (this hucreYerlestir'se ve indeksi 0 değilse)
    // HucreTakibiIslemTuruEnum.hucreYerlestir when index != 0 => "Hücre Yerleştir",
    HucreTakibiIslemTuruEnum.hucreYerlestir => "Hücre Yerleştir",
    HucreTakibiIslemTuruEnum.hucreBosalt => "Hücre Boşalt",
    HucreTakibiIslemTuruEnum.hucreTransferi => "Hücre Transferi",
  };
}

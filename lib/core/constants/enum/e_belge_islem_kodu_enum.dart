enum EBelgeIslemKoduEnum {
  eBelgeBirlestir,
  eBelgeEslestirmeIptali,
  eBelgeSil,
  eBelgeZarfSil,
  eBelgeYazdir,
  eBelgeHariciYollaFaturaIptali,
  eBelgeYanit,
}

extension EBelgeIslemKoduExtensions on EBelgeIslemKoduEnum {
  int get value => switch (this) {
    EBelgeIslemKoduEnum.eBelgeEslestirmeIptali => 11,
    EBelgeIslemKoduEnum.eBelgeHariciYollaFaturaIptali => 12,
    EBelgeIslemKoduEnum.eBelgeYanit => 18,
    EBelgeIslemKoduEnum.eBelgeBirlestir => 20,
    EBelgeIslemKoduEnum.eBelgeSil => 21,
    EBelgeIslemKoduEnum.eBelgeYazdir => 22,
    EBelgeIslemKoduEnum.eBelgeZarfSil => 23,
  };
}

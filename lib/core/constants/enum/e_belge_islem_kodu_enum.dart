enum EBelgeIslemKoduEnum { eBelgeBirlestir, eBelgeEslestirmeIptali, eBelgeSil, eBelgeZarfSil, eBelgeYazdir, eBelgeHariciYollaFaturaIptali, eBelgeYanit }

extension EBelgeIslemKoduExtensions on EBelgeIslemKoduEnum {
  int get value {
    switch (this) {
      case EBelgeIslemKoduEnum.eBelgeEslestirmeIptali:
        return 11;
      case EBelgeIslemKoduEnum.eBelgeHariciYollaFaturaIptali:
        return 12;
      case EBelgeIslemKoduEnum.eBelgeYanit:
        return 18;
      case EBelgeIslemKoduEnum.eBelgeBirlestir:
        return 20;
      case EBelgeIslemKoduEnum.eBelgeSil:
        return 21;
      case EBelgeIslemKoduEnum.eBelgeYazdir:
        return 22;
      case EBelgeIslemKoduEnum.eBelgeZarfSil:
        return 23;
    }
  }
}

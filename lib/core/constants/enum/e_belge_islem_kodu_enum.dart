

enum EBelgeIslemKoduEnum {eBelgeBirlestir, eBelgeSil, eBelgeZarfSil, eBelgeHariciYollaFaturaIptali}

extension EBelgeIslemKoduExtensions on EBelgeIslemKoduEnum {
  
  int get value {
    switch (this) {
      case EBelgeIslemKoduEnum.eBelgeHariciYollaFaturaIptali:
        return 12;
      case EBelgeIslemKoduEnum.eBelgeBirlestir:
        return 20;
      case EBelgeIslemKoduEnum.eBelgeSil:
        return 21;
      case EBelgeIslemKoduEnum.eBelgeZarfSil:
        return 23;
    }
  }
}


enum EBelgeIslemKoduEnum {eBelgeBirlestir, eBelgeSil}

extension EBelgeIslemKoduExtensions on EBelgeIslemKoduEnum {
  
  int get value {
    switch (this) {
      case EBelgeIslemKoduEnum.eBelgeBirlestir:
        return 20;
      case EBelgeIslemKoduEnum.eBelgeSil:
        return 21;
    }
  }
}
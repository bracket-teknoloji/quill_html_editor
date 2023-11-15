enum EBelgeEnum { gelen, giden }

extension EBelgeEnumExtension on EBelgeEnum {
  String get appBarTitle {
    switch (this) {
      case EBelgeEnum.gelen:
        return "Gelen Kutusu";
      case EBelgeEnum.giden:
        return "Giden Kutusu";
    }
  }

  String get faturaYonu {
    switch (this) {
      case EBelgeEnum.gelen:
        return "GET";
      case EBelgeEnum.giden:
        return "GIK";
    }
  }
}

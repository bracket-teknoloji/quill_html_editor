enum HesaplarArasiEnum { virman, eftHavale }

extension HesaplarArasiExtensions on HesaplarArasiEnum {
  String get name {
    switch (this) {
      case HesaplarArasiEnum.virman:
        return "Virman";
      case HesaplarArasiEnum.eftHavale:
        return "EFT/Havale";
      default:
        return "";
    }
  }

  String get belgeAdi {
    switch (this) {
      case HesaplarArasiEnum.virman:
        return "DHV";
      case HesaplarArasiEnum.eftHavale:
        return "DHE";
      default:
        return "";
    }
  }
}

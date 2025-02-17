enum HesaplarArasiEnum { virman, eftHavale }

extension HesaplarArasiExtensions on HesaplarArasiEnum {
  String get name => switch (this) {
    HesaplarArasiEnum.virman => "Virman",
    HesaplarArasiEnum.eftHavale => "EFT/Havale",
  };

  String get belgeAdi => switch (this) {
    HesaplarArasiEnum.virman => "DHV",
    HesaplarArasiEnum.eftHavale => "DHE",
  };
}

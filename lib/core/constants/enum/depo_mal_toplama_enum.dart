enum DepoMalToplamaEnum {
  tumu._(null),
  bekleyen._("BE"),
  toplaniyor._("KA"),
  tamamlandi._("TA"),
  ;

  const DepoMalToplamaEnum._(this.durumKodu);
  final String? durumKodu;

  String get durumAdi => switch (this) {
        DepoMalToplamaEnum.tumu => "Tümü",
        DepoMalToplamaEnum.bekleyen => "Bekleyen",
        DepoMalToplamaEnum.toplaniyor => "Toplanıyor",
        DepoMalToplamaEnum.tamamlandi => "Tamamlandı",
      };
}

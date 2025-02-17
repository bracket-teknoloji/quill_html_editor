enum MuhasebeBelgeTipiEnum {
  aylikMizan,
  muo,
  cari,
  hesaplarArasiVirman,
  hesaplarArasiEft,
  cariHavaleEft,
  muhtelifTahsilat,
  muhtelifOdeme,
  dekont,
}

extension MuhasebeBelgeExtensions on MuhasebeBelgeTipiEnum? {
  String get value => switch (this) {
    MuhasebeBelgeTipiEnum.aylikMizan => "Rapor_FinansAylikMizan",
    MuhasebeBelgeTipiEnum.muo => "MUO",
    MuhasebeBelgeTipiEnum.cari => "CARI",
    MuhasebeBelgeTipiEnum.hesaplarArasiVirman => "DHV",
    MuhasebeBelgeTipiEnum.hesaplarArasiEft => "DHE",
    MuhasebeBelgeTipiEnum.cariHavaleEft => "DCE",
    MuhasebeBelgeTipiEnum.muhtelifTahsilat => "BMT",
    MuhasebeBelgeTipiEnum.muhtelifOdeme => "BMO",
    MuhasebeBelgeTipiEnum.dekont => "DEKO",
    _ => throw Exception("Böyle bir değer yok"),
  };
}

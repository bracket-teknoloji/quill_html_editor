enum MuhasebeBelgeTipiEnum { aylikMizan, muo, cari, hesaplarArasiVirman, hesaplarArasiEft }

extension MuhasebeBelgeExtensions on MuhasebeBelgeTipiEnum? {
  String get value {
    switch (this) {
      case MuhasebeBelgeTipiEnum.aylikMizan:
        return "Rapor_FinansAylikMizan";
      case MuhasebeBelgeTipiEnum.muo:
        return "MUO";
      case MuhasebeBelgeTipiEnum.cari:
        return "CARI";
      case MuhasebeBelgeTipiEnum.hesaplarArasiVirman:
        return "DHV";
      case MuhasebeBelgeTipiEnum.hesaplarArasiEft:
        return "DHE";
      default:
        throw Exception("Böyle bir değer yok");
    }
  }
}

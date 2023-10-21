enum MuhasebeBelgeTipiEnum { aylikMizan, muo, cari}

extension MuhasebeBelgeExtensions on MuhasebeBelgeTipiEnum? {
  String get value {
    switch (this) {
      case MuhasebeBelgeTipiEnum.aylikMizan:
        return "Rapor_FinansAylikMizan";
      case MuhasebeBelgeTipiEnum.muo:
        return "MUO";
      case MuhasebeBelgeTipiEnum.cari:
        return "CARI";
      default:
        throw Exception("Böyle bir değer yok");
    }
  }
}

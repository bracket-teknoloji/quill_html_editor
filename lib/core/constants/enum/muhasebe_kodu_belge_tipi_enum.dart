enum MuhasebeBelgeTipiEnum { aylikMizan, muo }

extension MuhasebeBelgeExtensions on MuhasebeBelgeTipiEnum? {
  String get value {
    switch (this) {
      case MuhasebeBelgeTipiEnum.aylikMizan:
        return "Rapor_FinansAylikMizan";
      case MuhasebeBelgeTipiEnum.muo:
        return "MUO";
      default:
        throw Exception("Böyle bir değer yok");
    }
  }
}

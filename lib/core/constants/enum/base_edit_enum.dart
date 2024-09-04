enum BaseEditEnum { ekle, duzenle, goruntule, kopyala, revize, taslak, bitir, siparistenKopyala }

extension ToString on BaseEditEnum? {
  String? get getName => _getName(this);

  bool get revizeMi => this == BaseEditEnum.revize;
  bool get ekleMi => this == BaseEditEnum.ekle;
  bool get taslakMi => this == BaseEditEnum.taslak;
  bool get goruntuleMi => this == BaseEditEnum.goruntule || this == BaseEditEnum.bitir;
  bool get duzenleMi => this == BaseEditEnum.duzenle;
  bool get kopyalaMi => this == BaseEditEnum.kopyala || this == BaseEditEnum.siparistenKopyala;
  bool get siparistenKopyalaMi => this == BaseEditEnum.siparistenKopyala;

  String? _getName(BaseEditEnum? baseEditEnum) {
    switch (baseEditEnum) {
      case BaseEditEnum.ekle:
        return "Yeni Kayıt";
      case BaseEditEnum.duzenle:
        return "Düzenle";
      case BaseEditEnum.goruntule:
        return "Görüntüle";
      case BaseEditEnum.kopyala || BaseEditEnum.siparistenKopyala:
        return "Kopyala";
      case BaseEditEnum.revize:
        return "Revize";
      case BaseEditEnum.taslak:
        return "Yeni Kayıt";
      case BaseEditEnum.bitir:
        return "Kaydı Tamamla";
      default:
        return "";
    }
  }

  int get islemKodu {
    if (this == BaseEditEnum.ekle) return 1;
    if (this == BaseEditEnum.duzenle) return 2;
    if (this == BaseEditEnum.bitir) return 7;
    return 0;
  }
}

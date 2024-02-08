enum BaseEditEnum { ekle, duzenle, goruntule, kopyala, revize, taslak }

extension ToString on BaseEditEnum? {
  String? get name => getName(this);

  bool get revizeMi => this == BaseEditEnum.revize;
  bool get ekleMi => this == BaseEditEnum.ekle;

  String? getName(BaseEditEnum? baseEditEnum) {
    switch (baseEditEnum) {
      case BaseEditEnum.ekle:
        return "Yeni Kayıt";
      case BaseEditEnum.duzenle:
        return "Düzenle";
      case BaseEditEnum.goruntule:
        return "Görüntüle";
      case BaseEditEnum.kopyala:
        return "Kopyala";
      case BaseEditEnum.revize:
        return "Revize";
      case BaseEditEnum.taslak:
        return "Yeni Kayıt";
      default:
        return "";
    }
  }
}

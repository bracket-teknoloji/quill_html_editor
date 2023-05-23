enum BaseEditEnum {ekle, duzenle, goruntule }

extension ToString on BaseEditEnum {
  String? get name => getName(this);

  String? getName(BaseEditEnum baseEditEnum) {
    switch (baseEditEnum) {
      case BaseEditEnum.ekle:
        return "Yeni Kayıt";
      case BaseEditEnum.duzenle:
        return "Düzenle";
      case BaseEditEnum.goruntule:
        return "Görüntüle";
      default:
        return "";
    }
  }
}

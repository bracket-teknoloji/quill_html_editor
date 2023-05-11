enum CariEditEnum { ekle, duzenle, goruntule }

extension ToString on CariEditEnum {
  String get name => getName(this);

  String getName(CariEditEnum cariEditEnum) {
    switch (cariEditEnum) {
      case CariEditEnum.ekle:
        return "Ekle";
      case CariEditEnum.duzenle:
        return "Düzenle";
      case CariEditEnum.goruntule:
        return "Görüntüle";
      default:
        return "";
    }
  }
}
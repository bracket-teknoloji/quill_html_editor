import "../../../../../../view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";

final class SeriDetayiModel {
  SeriDetayiModel({this.kalanMiktar, this.hareketMiktari, this.seriList, this.miktarKadarSor});

  double? kalanMiktar;
  SeriList? seriList;
  double? hareketMiktari;
  bool? miktarKadarSor;
}

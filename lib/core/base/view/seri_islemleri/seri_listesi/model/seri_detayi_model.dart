import "../../../../../../view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";

final class SeriDetayiModel {
  SeriDetayiModel({this.kalanMiktar, this.hareketMiktari, this.seriList, this.miktarKadarSor});

  int? kalanMiktar;
  SeriList? seriList;
  int? hareketMiktari;
  bool? miktarKadarSor;
}

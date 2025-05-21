import "../../../view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";

/// Bu mixin, stok bilgilerini tutan model sınıflarında kullanılır.
/// stokKodu ve StokAdi ortaklaştırma amacıyla yapılmıştır.
mixin BaseStokMixin {
  String? get stokKodu;
  String? get stokAdi;
  String? get olcuBirimi => null;
  String? get belgeOlcuBirimAdi => null;
  String get getOlcuBirimi => olcuBirimi ?? belgeOlcuBirimAdi ?? "";

  double? get netMiktar => null;
  double? get miktar => null;
  double? get bakiye => null;

  double? get getMiktar => netMiktar ?? bakiye ?? miktar;

  List<SeriList>? get seriList => null;
}

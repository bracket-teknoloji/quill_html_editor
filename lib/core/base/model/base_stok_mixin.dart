

/// Bu mixin, stok bilgilerini tutan model sınıflarında kullanılır.
/// stokKodu ve StokAdi ortaklaştırma amacıyla yapılmıştır.
mixin BaseStokMixin {
  String? get stokKodu;
  String? get stokAdi;
  String? get olcuBirimi => "";

  double? get netMiktar;
  double? get miktar;
  double? get bakiye;

  double? get getMiktar => netMiktar ?? bakiye ?? miktar;
}

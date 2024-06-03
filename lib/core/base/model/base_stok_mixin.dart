import "package:picker/core/constants/extensions/string_extensions.dart";

/// Bu mixin, stok bilgilerini tutan model sınıflarında kullanılır.
/// stokKodu ve StokAdi ortaklaştırma amacıyla yapılmıştır.
mixin BaseStokMixin {
  String? get stokKodu;
  String? get stokAdi;
  String? get olcuBirimi => "";
  String? get belgeOlcuBirimAdi => "";
  String? get getOlcuBirimi => olcuBirimi?.withoutBlanks ?? belgeOlcuBirimAdi.withoutBlanks;

  double? get netMiktar;
  double? get miktar;
  double? get bakiye;

  double? get getMiktar => netMiktar ?? bakiye ?? miktar;
}

// import "package:freezed_annotation/freezed_annotation.dart";
// import "package:picker/core/base/model/base_network_mixin.dart";
// import "package:picker/core/base/model/base_stok_mixin.dart";

// part "uretim_sonu_kaydi_listesi_model.freezed.dart";
// part "uretim_sonu_kaydi_listesi_model.g.dart";

// @unfreezed
// class UretimSonuKaydiListesiModel with _$UretimSonuKaydiListesiModel, NetworkManagerMixin, BaseStokMixin {
//   UretimSonuKaydiListesiModel._();
//   factory UretimSonuKaydiListesiModel({
//     String? belgeNo,
//     DateTime? tarih,
//     int? kalemSayisi,
//     int? cikisDepo,
//     int? girisDepo,
//     String? stokKodu,
//     String? stokAdi,
//     double? miktar,
//     String? aciklama,
//     int? miktar2,
//     String? yapkod,
//     String? yapacik,
//     int? inckeyno,
//     int? girisdepoKodu,
//     int? cikisdepoKodu,
//     String? cikisDepoAdi,
//     String? girisDepoAdi,
//     String? stoklaraIslendi,
//     double? maliyetFiyati,
//     String? ekalan1,
//     String? ekalan2,
//     String? depoOnceligi,
//   }) = _UretimSonuKaydiListesiModel;

//   factory UretimSonuKaydiListesiModel.fromJson(Map<String, dynamic> json) => _$UretimSonuKaydiListesiModelFromJson(json);

//   @override
//   UretimSonuKaydiListesiModel fromJson(Map<String, dynamic> json) => _$UretimSonuKaydiListesiModelFromJson(json);
// }

// extension UretimSonuKaydiListesiModelExtensions on UretimSonuKaydiListesiModel? {
//   double get maliyetTutari => (this?.miktar ?? 0) * (this?.maliyetFiyati ?? 0);
// }

// import "package:json_annotation/json_annotation.dart";

// import "../../../../../../core/base/model/base_network_mixin.dart";

// part "stok_yeni_kayit_model.g.dart";

// @JsonSerializable()
// class StokYeniKayitModel with NetworkManagerMixin {
//   // String? aciklama;
//   // String? belgeNo;
//   int? depoKodu;
//   int? fiyat;
//   // String? gc;
//   String? hareketTuru;
//   int? miktar;
//   // String? plasiyerKodu;
//   // String? projeKodu;
//   String? stokKodu;
//   DateTime? tarih;
//   @JsonKey(name: "_YeniKayit")
//   bool? yeniKayit;

//   @override
//   fromJson(Map<String, dynamic> json) {
//     return _$StokYeniKayitModelFromJson(json);
//   }

//   @override
//   Map<String, dynamic> toJson() {
//     return _$StokYeniKayitModelToJson(this);
//   }
// }
import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "stok_yeni_kayit_model.freezed.dart";
part "stok_yeni_kayit_model.g.dart";

@unfreezed
class StokYeniKayitModel with _$StokYeniKayitModel, NetworkManagerMixin {
  StokYeniKayitModel._();
  factory StokYeniKayitModel({
    String? aciklama,
    String? belgeNo,
    String? gc,
    String? guid,
    String? hesapKodu,
    String? hesapTipi,
    String? kasaKodu,
    @JsonKey(name: "PickerBelgeTuru") String? pickerBelgeTuru,
    String? plasiyerKodu,
    String? projeKodu,
    String? tag,
    bool? tahsilatmi,
    DateTime? tarih,
    double? tutar,
    String? stokKodu,
    int? depoKodu,
    String? hareketTuru,
    int? miktar,
    double? fiyat,
    double? dovizTutari,
    int? dovizTipi,
    @JsonKey(name: "_YeniKayit") bool? yeniKayit,
  }) = _StokYeniKayitModel;

  factory StokYeniKayitModel.fromJson(Map<String, dynamic> json) => _$StokYeniKayitModelFromJson(json);

  @override
  StokYeniKayitModel fromJson(Map<String, dynamic> json) => _$StokYeniKayitModelFromJson(json);
}

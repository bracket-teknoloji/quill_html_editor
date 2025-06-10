import "package:freezed_annotation/freezed_annotation.dart";

part "seri_hareketleri_request_model.freezed.dart";
part "seri_hareketleri_request_model.g.dart";

@unfreezed
sealed class SeriHareketleriRequestModel with _$SeriHareketleriRequestModel {
  factory SeriHareketleriRequestModel({
    @JsonKey(name: "StokKodu") String? stokKodu,
    @JsonKey(name: "SeriNo") String? seriNo,
    @JsonKey(name: "Sirala", defaultValue: "TARIH_ZA") String? sirala,
    @JsonKey(name: "BelgeNo") String? belgeNo,
    @JsonKey(name: "BelgeTipi") String? belgeTipi,
    @JsonKey(name: "HareketID") int? hareketId,
    @JsonKey(name: "TempGetir") String? tempGetir,
  }) = _SeriHareketleriRequestModel;

  factory SeriHareketleriRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SeriHareketleriRequestModelFromJson(json);
}

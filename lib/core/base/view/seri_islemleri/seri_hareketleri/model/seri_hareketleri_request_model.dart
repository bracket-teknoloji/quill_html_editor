import "package:freezed_annotation/freezed_annotation.dart";

part "seri_hareketleri_request_model.freezed.dart";
part "seri_hareketleri_request_model.g.dart";

@unfreezed
class SeriHareketleriRequestModel with _$SeriHareketleriRequestModel {
  factory SeriHareketleriRequestModel({
    @JsonKey(name: "StokKodu") String? stokKodu,
    @JsonKey(name: "Sirala") String? sirala,
  }) = _SeriHareketleriRequestModel;

  factory SeriHareketleriRequestModel.fromJson(Map<String, dynamic> json) => _$SeriHareketleriRequestModelFromJson(json);
}

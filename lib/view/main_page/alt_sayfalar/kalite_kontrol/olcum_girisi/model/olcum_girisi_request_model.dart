import "package:freezed_annotation/freezed_annotation.dart";

part "olcum_girisi_request_model.freezed.dart";
part "olcum_girisi_request_model.g.dart";

@unfreezed
class OlcumGirisiRequestModel with _$OlcumGirisiRequestModel {
  factory OlcumGirisiRequestModel({
    int? durum,
    String? belgeTipi,
    String? bastar,
    String? bittar,
    String? siralama,
    @JsonKey(name: "SearchText") String? searchText,
    @JsonKey(name: "Sayfa") int? sayfa,
  }) = _OlcumGirisiRequestModel;

  factory OlcumGirisiRequestModel.fromJson(Map<String, dynamic> json) => _$OlcumGirisiRequestModelFromJson(json);
}

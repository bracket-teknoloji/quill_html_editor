import "package:freezed_annotation/freezed_annotation.dart";

part "ek_rehber_request_model.freezed.dart";
part "ek_rehber_request_model.g.dart";

@freezed
class EkRehberRequestModel with _$EkRehberRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory EkRehberRequestModel({
    String? belgeNo,
    DateTime? belgeTarihi,
    String? belgeTipi,
    String? cariKodu,
    @JsonKey(name: "ID") int? id,
    int? rehberKodu,
    @JsonKey(includeToJson: false, includeFromJson: false) String? baslik,
  }) = _EkRehberRequestModel;

  factory EkRehberRequestModel.fromJson(Map<String, dynamic> json) => _$EkRehberRequestModelFromJson(json);
}

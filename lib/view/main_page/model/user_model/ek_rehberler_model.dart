import "package:freezed_annotation/freezed_annotation.dart";

part "ek_rehberler_model.freezed.dart";
part "ek_rehberler_model.g.dart";

@freezed
class EkRehberlerModel with _$EkRehberlerModel {
  @JsonSerializable(createFactory: true)
  const factory EkRehberlerModel({int? id, String? baslik, String? ekran, String? alan}) = _EkRehberlerModel;

  factory EkRehberlerModel.fromJson(Map<String, dynamic> json) => _$EkRehberlerModelFromJson(json);
}

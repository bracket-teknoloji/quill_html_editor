import "package:freezed_annotation/freezed_annotation.dart";

part "dekont_request_model.freezed.dart";
part "dekont_request_model.g.dart";

@unfreezed
class DekontRequestModel with _$DekontRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory DekontRequestModel({
    int? sayfa,
    @Default("L") String? ekranTipi,
    String? searchText,
  }) = _DekontRequestModel;

  factory DekontRequestModel.fromJson(Map<String, dynamic> json) => _$DekontRequestModelFromJson(json);
}

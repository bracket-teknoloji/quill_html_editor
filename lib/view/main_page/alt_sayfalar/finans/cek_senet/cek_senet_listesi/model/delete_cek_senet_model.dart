import "package:freezed_annotation/freezed_annotation.dart";

part "delete_cek_senet_model.freezed.dart";
part "delete_cek_senet_model.g.dart";

@freezed
class DeleteCekSenetModel with _$DeleteCekSenetModel {
  const factory DeleteCekSenetModel({
    String? belgeNo,
    String? belgeTipi,
    int? islemKodu,
    @JsonKey(name: "PickerTahsilatTuru") String? pickerTahsilatTuru,
    String? tag,
  }) = _DeleteCekSenetModel;

  factory DeleteCekSenetModel.fromJson(Map<String, dynamic> json) => _$DeleteCekSenetModelFromJson(json);
}

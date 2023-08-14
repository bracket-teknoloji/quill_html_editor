import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "delete_fatura_model.freezed.dart";
part "delete_fatura_model.g.dart";

@freezed
class DeleteFaturaModel with NetworkManagerMixin, _$DeleteFaturaModel {
  const DeleteFaturaModel._();

  const factory DeleteFaturaModel({
    @JsonKey(name: "BelgeTipi") int? belgeTipi,
    @JsonKey(name: "PickerBelgeTuru") String? pickerBelgeTuru,
    bool? remoteTempBelge,
    int? tempBelgeId,
    int? tipi,
    String? belgeNo,
    String? belgeTuru,
    String? cariKodu,
    String? islemId,
    String? mevcutBelgeNo,
    String? mevcutCariKodu,
    String? paramMap,
    String? tag,
  }) = _DeleteFaturaModel;

  factory DeleteFaturaModel.fromJson(Map<String, Object?> json) => _$DeleteFaturaModelFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$DeleteFaturaModelFromJson(json);
}

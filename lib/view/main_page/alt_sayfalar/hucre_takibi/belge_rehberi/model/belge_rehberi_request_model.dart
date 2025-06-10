import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_transferi/model/hucre_transferi_model.dart";

part "belge_rehberi_request_model.freezed.dart";
part "belge_rehberi_request_model.g.dart";

@freezed
sealed class BelgeRehberiRequestModel with _$BelgeRehberiRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory BelgeRehberiRequestModel({
    int? depoKodu,
    String? islemTuru,
    String? pickerBelgeTuru,
    String? searchText,
  }) = _BelgeRehberiRequestModel;

  factory BelgeRehberiRequestModel.fromJson(Map<String, dynamic> json) => _$BelgeRehberiRequestModelFromJson(json);

  factory BelgeRehberiRequestModel.fromHucreTransferiModel(HucreTransferiModel model) => BelgeRehberiRequestModel(
    depoKodu: model.depoKodu,
    islemTuru: model.islemTuru,
    pickerBelgeTuru: model.pickerBelgeTuru,
  );
}

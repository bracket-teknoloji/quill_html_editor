import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../base_siparis_edit/model/base_siparis_edit_model.dart";

part "siparis_edit_request_model.freezed.dart";
part "siparis_edit_request_model.g.dart";

@unfreezed
class SiparisEditRequestModel with NetworkManagerMixin, _$SiparisEditRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory SiparisEditRequestModel({
    @JsonKey(defaultValue: "D") String? ekranTipi,
    @Default(true) bool? kisitYok,
    @JsonKey(name: "BelgeTipi") String? belgeTipi,
    @JsonKey(name: "PickerBelgeTuru") String? pickerBelgeTuru,
    bool? remoteTempBelge,
    int? faturaTipi,
    int? tempBelgeId,
    int? tipi,
    String? belgeNo,
    String? belgeTarihi,
    String? belgeTuru,
    String? cariKodu,
    String? islemId,
    String? kayitModu,
    String? menuKodu,
    String? mevcutBelgeNo,
    String? mevcutCariKodu,
    String? paramMap,
    String? resimGoster,
    String? stokKodu,
    String? tag,
  }) = _SiparisEditRequestModel;

  SiparisEditRequestModel._();

  factory SiparisEditRequestModel.fromJson(Map<String, Object?> json) => _$SiparisEditRequestModelFromJson(json);

  factory SiparisEditRequestModel.fromKalemModel(KalemModel model) => SiparisEditRequestModel(
        belgeNo: model.belgeNo,
        cariKodu: model.cariKodu,
        belgeTuru: model.belgeTipi,
      );

  factory SiparisEditRequestModel.fromSiparislerModel(
    BaseSiparisEditModel model,
  ) =>
      SiparisEditRequestModel(
        belgeNo: model.belgeNo,
        pickerBelgeTuru: model.belgeTuru,
        belgeTuru: model.belgeTuru,
        belgeTipi: model.belgeTipi.toStringIfNotNull,
        cariKodu: model.cariKodu,
        tipi: model.tipi,
        tempBelgeId: model.tempBelgeId,
      );

  @override
  fromJson(Map<String, dynamic> json) => SiparisEditRequestModel.fromJson(json);
}

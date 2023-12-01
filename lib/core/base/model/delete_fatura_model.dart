import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/view/main_page/alt_sayfalar/talep_teklif/talep_teklif_listesi/model/talep_teklif_listesi_model.dart";

import "../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "base_network_mixin.dart";

part "delete_fatura_model.freezed.dart";
part "delete_fatura_model.g.dart";

@freezed
class EditFaturaModel with NetworkManagerMixin, _$EditFaturaModel {
  const EditFaturaModel._();

  const factory EditFaturaModel({
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
    String? yeniBelgeNo,
    String? mevcutCariKodu,
    String? paramMap,
    String? tag,
    int? islemKodu,
  }) = _EditFaturaModel;

  factory EditFaturaModel.fromJson(Map<String, Object?> json) => _$EditFaturaModelFromJson(json);

  factory EditFaturaModel.fromSiparislerModel(BaseSiparisEditModel model) => EditFaturaModel(
        belgeNo: model.belgeNo,
        pickerBelgeTuru: model.belgeTuru,
        belgeTuru: model.belgeTuru,
        belgeTipi: model.belgeTipi,
        cariKodu: model.cariKodu,
        tipi: model.tipi,
        tempBelgeId: model.tempBelgeId,
        islemKodu: model.islemKodu,
        yeniBelgeNo: model.yeniBelgeNo,
      );

      factory EditFaturaModel.fromTalepTeklifListesiModel(TalepTeklifListesiModel model) => EditFaturaModel(
        belgeNo: model.belgeNo,
        pickerBelgeTuru: model.belgeTuru,
        belgeTuru: model.belgeTuru,
        cariKodu: model.cariKodu,
        mevcutCariKodu: model.cariKodu,
        mevcutBelgeNo: model.belgeNo,
        tipi: model.tipi,
        belgeTipi: model.tipi,
      );

  @override
  EditFaturaModel fromJson(Map<String, dynamic> json) => _$EditFaturaModelFromJson(json);
}

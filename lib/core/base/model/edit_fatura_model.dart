import "package:freezed_annotation/freezed_annotation.dart";

import "../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../view/main_page/alt_sayfalar/talep_teklif/talep_teklif_listesi/model/talep_teklif_listesi_model.dart";
import "../../constants/extensions/date_time_extensions.dart";
import "base_network_mixin.dart";

part "edit_fatura_model.freezed.dart";
part "edit_fatura_model.g.dart";

@freezed
@immutable
sealed class EditFaturaModel with NetworkManagerMixin, _$EditFaturaModel {
  factory EditFaturaModel({
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
    String? yeniCariKodu,
    String? mevcutCariKodu,
    @Default({}) Map? paramMap,
    @Default("FaturaModel") String? tag,
    int? islemKodu,
    List<KalemModel>? kalemler,
    bool? irsaliyedenFatura,
    String? resmiBelgeNo,
    DateTime? tarih,
  }) = _EditFaturaModel;
  EditFaturaModel._();

  factory EditFaturaModel.fromJson(Map<String, Object?> json) => _$EditFaturaModelFromJson(json);

  factory EditFaturaModel.fromSiparislerModel(BaseSiparisEditModel model) => EditFaturaModel(
    belgeNo: model.belgeNo,
    pickerBelgeTuru: model.belgeTuru,
    belgeTuru: model.belgeTuru,
    cariKodu: model.cariKodu,
    tempBelgeId: model.tempBelgeId,
    islemKodu: model.islemKodu,
    yeniBelgeNo: model.yeniBelgeNo,
    kalemler: model.kalemList,
    tipi: model.tipi,
    yeniCariKodu: model.yeniCariKodu,
    belgeTipi: model.tipi,
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

  factory EditFaturaModel.forIrsaliyelestir(BaseSiparisEditModel? model) => EditFaturaModel(
    cariKodu: model?.cariKodu,
    irsaliyedenFatura: true,
    belgeNo: model?.belgeNo,
    pickerBelgeTuru: model?.belgeTuru,
    belgeTuru: model?.belgeTuru,
    tarih: DateTime.now().dateTimeWithoutTime,
  );

  @override
  EditFaturaModel fromJson(Map<String, dynamic> json) => _$EditFaturaModelFromJson(json);
}

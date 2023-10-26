import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/view/main_page/alt_sayfalar/e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";

part "e_belge_pdf_request_model.freezed.dart";
part "e_belge_pdf_request_model.g.dart";

@freezed
class EBelgePdfRequestModel with _$EBelgePdfRequestModel {
  const factory EBelgePdfRequestModel({
    String? belgeTuru,
    String? ebelgeTuru,
    int? islemKodu,
    String? resmiBelgeNo,
  }) = _EBelgePdfRequestModel;

  factory EBelgePdfRequestModel.fromJson(Map<String, dynamic> json) => _$EBelgePdfRequestModelFromJson(json);

  factory EBelgePdfRequestModel.fromEBelgeListesiModel(EBelgeListesiModel? model) =>
      EBelgePdfRequestModel(belgeTuru: model?.belgeTuru, ebelgeTuru: model?.ebelgeTuru, islemKodu: 1, resmiBelgeNo: model?.resmiBelgeNo);
}

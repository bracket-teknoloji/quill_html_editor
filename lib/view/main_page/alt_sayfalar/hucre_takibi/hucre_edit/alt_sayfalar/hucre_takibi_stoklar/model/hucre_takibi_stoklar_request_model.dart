import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../hucre_transferi/model/hucre_transferi_model.dart";

part "hucre_takibi_stoklar_request_model.freezed.dart";
part "hucre_takibi_stoklar_request_model.g.dart";

@freezed
class HucreTakibiStoklarRequestModel with _$HucreTakibiStoklarRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory HucreTakibiStoklarRequestModel({
    int? depoKodu,
    String? islemTuru,
    String? cariKodu,
    String? pickerBelgeTuru,
    String? stokKodu,
    String? belgeNo,
  }) = _HucreTakibiStoklarRequestModel;

  factory HucreTakibiStoklarRequestModel.fromJson(Map<String, dynamic> json) => _$HucreTakibiStoklarRequestModelFromJson(json);

  factory HucreTakibiStoklarRequestModel.fromHucreTransferiModel(HucreTransferiModel model) => HucreTakibiStoklarRequestModel(
        depoKodu: model.depoKodu,
        islemTuru: model.islemTuru,
        cariKodu: model.belgeModel?.cariKodu,
        pickerBelgeTuru: model.belgeTuru,
        stokKodu: model.stokKodu,
        belgeNo: model.belgeNo,
      );
}

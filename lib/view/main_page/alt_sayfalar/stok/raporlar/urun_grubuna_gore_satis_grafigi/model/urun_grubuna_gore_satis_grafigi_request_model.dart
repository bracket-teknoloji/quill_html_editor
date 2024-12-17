import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";

part "urun_grubuna_gore_satis_grafigi_request_model.freezed.dart";
part "urun_grubuna_gore_satis_grafigi_request_model.g.dart";

@unfreezed
class UrunGrubunaGoreSatisGrafigiRequestModel with _$UrunGrubunaGoreSatisGrafigiRequestModel, NetworkManagerMixin {
  factory UrunGrubunaGoreSatisGrafigiRequestModel({
    List<String>? arrPlasiyerKodu,
    String? baslamaTarihi,
    String? bitisTarihi,
    String? cariKodu,
    String? donemTipi,
    int? grupNo,
    String? irsDahil,
    String? grupla,
    String? projeKodu,
    String? tipi,
  }) = _UrunGrubunaGoreSatisGrafigiRequestModel;
  UrunGrubunaGoreSatisGrafigiRequestModel._();

  factory UrunGrubunaGoreSatisGrafigiRequestModel.fromJson(Map<String, dynamic> json) => _$UrunGrubunaGoreSatisGrafigiRequestModelFromJson(json);

  @override
  UrunGrubunaGoreSatisGrafigiRequestModel fromJson(Map<String, dynamic> json) => _$UrunGrubunaGoreSatisGrafigiRequestModelFromJson(json);
}

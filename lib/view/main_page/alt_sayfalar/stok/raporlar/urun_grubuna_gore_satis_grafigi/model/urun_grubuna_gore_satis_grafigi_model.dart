import "package:json_annotation/json_annotation.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";

part "urun_grubuna_gore_satis_grafigi_model.g.dart";

@JsonSerializable(explicitToJson: true)
final class UrunGrubunaGoreSatisGrafigiModel with NetworkManagerMixin {
  String? grupKodu;
  String? grupAdi;
  double? netTutar;
  double? toplamTutar;
  double? oran;
  int? sira;
  double? miktar;
  double? oranMiktar;
  double? oranTutar;
  @override
  UrunGrubunaGoreSatisGrafigiModel fromJson(Map<String, dynamic> json) =>
      _$UrunGrubunaGoreSatisGrafigiModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UrunGrubunaGoreSatisGrafigiModelToJson(this);
}

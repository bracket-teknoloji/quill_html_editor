import "package:json_annotation/json_annotation.dart";

import "../../../../model/base_network_mixin.dart";

part "dizayn_model.g.dart";

@JsonSerializable()
class DizaynModel with NetworkManagerMixin {
  DizaynModel({
    this.id,
    this.dizaynAdi,
    this.modulId,
    this.dizaynKodu,
    this.erpDizayni,
    this.varsayilanMi,
  });

  factory DizaynModel.fromJson(Map<String, dynamic> json) => _$DizaynModelFromJson(json);
  @JsonKey(name: "ID")
  final int? id;
  @JsonKey(name: "DIZAYN_ADI")
  final String? dizaynAdi;
  @JsonKey(name: "MODUL_ID")
  final int? modulId;
  @JsonKey(name: "DIZAYN_KODU")
  final String? dizaynKodu;
  @JsonKey(name: "ERP_DIZAYNI")
  final String? erpDizayni;
  @JsonKey(name: "VARSAYILAN_MI")
  final bool? varsayilanMi;

  @override
  Map<String, dynamic> toJson() => _$DizaynModelToJson(this);

  @override
  DizaynModel fromJson(Map<String, dynamic> json) => DizaynModel.fromJson(json);

  String get dizaynTamAd => "${dizaynAdi ?? ""} (${dizaynKodu ?? ""})";
}

import "package:json_annotation/json_annotation.dart";

import "base_network_mixin.dart";

part "base_edit_siradaki_kod_model.g.dart";

@JsonSerializable()
class BaseEditSiradakiKodModel with NetworkManagerMixin {
  BaseEditSiradakiKodModel();
  String? siradakiKod;

  @override
  BaseEditSiradakiKodModel fromJson(Map<String, dynamic> json) => _$BaseEditSiradakiKodModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BaseEditSiradakiKodModelToJson(this);
}

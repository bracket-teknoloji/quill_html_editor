import "package:json_annotation/json_annotation.dart";

import "../../../../../../../../core/base/model/base_network_mixin.dart";

part "ulke_model.g.dart";

@JsonSerializable()
class UlkeModel with NetworkManagerMixin {
  String? ulkeKodu;
  String? ulkeAdi;

  @override
  UlkeModel fromJson(Map<String, dynamic> json) => _$UlkeModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UlkeModelToJson(this);
}

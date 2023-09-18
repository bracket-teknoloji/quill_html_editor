import "package:json_annotation/json_annotation.dart";

import "base_network_mixin.dart";

part "base_proje_model.g.dart";

@JsonSerializable()
class BaseProjeModel with NetworkManagerMixin {
  String? projeKodu;
  String? projeAciklama;
  String? aktif;

  get projeAdi => null;
  @override
  fromJson(Map<String, dynamic> json) {
    return _$BaseProjeModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$BaseProjeModelToJson(this);
  }
}

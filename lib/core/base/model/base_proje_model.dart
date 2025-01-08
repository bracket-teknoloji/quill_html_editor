import "package:json_annotation/json_annotation.dart";

import "base_network_mixin.dart";

part "base_proje_model.g.dart";

@JsonSerializable()
final class BaseProjeModel with NetworkManagerMixin {
  BaseProjeModel({this.projeKodu, this.projeAciklama, this.aktif});
  String? projeKodu;
  String? projeAciklama;
  String? aktif;

  @override
  BaseProjeModel fromJson(Map<String, dynamic> json) => _$BaseProjeModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BaseProjeModelToJson(this);
}

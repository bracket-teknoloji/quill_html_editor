import "package:json_annotation/json_annotation.dart";

import "../../../../base/model/base_network_mixin.dart";

part "kod_degistir_model.g.dart";

@JsonSerializable(includeIfNull: true)
class KodDegistirModel with NetworkManagerMixin {
  String? kaynakSil;
  String? kaynakCari;
  String? hedefCari;
  @override
  fromJson(Map<String, dynamic> json) => _$KodDegistirModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KodDegistirModelToJson(this);
}

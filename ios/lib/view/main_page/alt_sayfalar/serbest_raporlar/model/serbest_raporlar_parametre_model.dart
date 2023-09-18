import "package:json_annotation/json_annotation.dart";

import "../../../../../core/base/model/base_network_mixin.dart";

part "serbest_raporlar_parametre_model.g.dart";

@JsonSerializable(createFactory: true, explicitToJson: true)
class SerbestRaporParametreModel with NetworkManagerMixin {
  String? parametreAdi;
  String? parametreTanimi;
  bool? degerTemizlenmesin;
  bool? enterIslemYap;

  @override
  fromJson(Map<String, dynamic> json) => _$SerbestRaporParametreModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SerbestRaporParametreModelToJson(this);
}

import "package:freezed_annotation/freezed_annotation.dart";

import "base_network_mixin.dart";

part "base_profil_parametre_model.freezed.dart";
part "base_profil_parametre_model.g.dart";

@freezed
abstract class BaseProfilParametreModel with _$BaseProfilParametreModel, NetworkManagerMixin {
  factory BaseProfilParametreModel({
  @Default(true)  bool siparisYeniKaydaHazirla,
  }) = _BaseProfilParametreModel;
  factory BaseProfilParametreModel.fromJson(Map<String, dynamic> json) => _$BaseProfilParametreModelFromJson(json);
  //Empty constructor
  BaseProfilParametreModel._();
  @override
  fromJson(Map<String, dynamic> json) => _$BaseProfilParametreModelFromJson(json);
}

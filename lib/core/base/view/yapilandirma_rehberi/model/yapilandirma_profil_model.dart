import "package:freezed_annotation/freezed_annotation.dart";

import "../../../model/base_network_mixin.dart";
import "yapilandirma_rehberi_model.dart";

part "yapilandirma_profil_model.freezed.dart";
part "yapilandirma_profil_model.g.dart";

@unfreezed
class YapilandirmaProfilModel with _$YapilandirmaProfilModel, NetworkManagerMixin {
  factory YapilandirmaProfilModel({
    int? sira,
    String? ozellikKodu,
    String? aciklama,
    List<YapilandirmaRehberiModel?>? deger,
  }) = _YapilandirmaProfilModel;
  YapilandirmaProfilModel._();

  factory YapilandirmaProfilModel.fromJson(Map<String, dynamic> json) => _$YapilandirmaProfilModelFromJson(json);

  @override
  YapilandirmaProfilModel fromJson(Map<String, dynamic> json) => _$YapilandirmaProfilModelFromJson(json);
}

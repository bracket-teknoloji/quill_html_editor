import "package:freezed_annotation/freezed_annotation.dart";

import "../../../model/base_network_mixin.dart";

part "yapilandirma_rehberi_model.freezed.dart";
part "yapilandirma_rehberi_model.g.dart";

@unfreezed
class YapilandirmaRehberiModel with _$YapilandirmaRehberiModel, NetworkManagerMixin {
  YapilandirmaRehberiModel._();
  factory YapilandirmaRehberiModel({
    String? yapkod,
    String? yapacik,
    String? kod,
    String? kodAciklama,
    String? deger,
    String? degerAciklama,
    int? ozellikSira,
  }) = _YapilandirmaRehberiModel;

  factory YapilandirmaRehberiModel.fromJson(Map<String, dynamic> json) => _$YapilandirmaRehberiModelFromJson(json);

  @override
  YapilandirmaRehberiModel fromJson(Map<String, dynamic> json) => _$YapilandirmaRehberiModelFromJson(json);
}

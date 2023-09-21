import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "yapilandirma_profil_model.freezed.dart";
part "yapilandirma_profil_model.g.dart";


@unfreezed
class YapilandirmaProfilModel with _$YapilandirmaProfilModel, NetworkManagerMixin {
     YapilandirmaProfilModel._();
     factory YapilandirmaProfilModel({
        int? sira,
        String? ozellikKodu,
        String? aciklama,
    }) = _YapilandirmaProfilModel;

    factory YapilandirmaProfilModel.fromJson(Map<String, dynamic> json) => _$YapilandirmaProfilModelFromJson(json);

    @override
    fromJson(Map<String, dynamic> json) => _$YapilandirmaProfilModelFromJson(json);
}
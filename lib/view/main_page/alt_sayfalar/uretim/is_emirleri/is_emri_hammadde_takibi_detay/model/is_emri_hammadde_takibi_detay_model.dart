import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "is_emri_hammadde_takibi_detay_model.freezed.dart";
part "is_emri_hammadde_takibi_detay_model.g.dart";

@unfreezed
class IsEmriHammaddeTakibiDetayModel with _$IsEmriHammaddeTakibiDetayModel, NetworkManagerMixin {
  IsEmriHammaddeTakibiDetayModel._();
  factory IsEmriHammaddeTakibiDetayModel({
    String? hamKodu,
    String? hamAdi,
    int? miktar,
    List<Referanslar>? referanslar,
  }) = _IsEmriHammaddeTakibiDetayModel;

  factory IsEmriHammaddeTakibiDetayModel.fromJson(Map<String, dynamic> json) => _$IsEmriHammaddeTakibiDetayModelFromJson(json);

  @override
  IsEmriHammaddeTakibiDetayModel fromJson(Map<String, dynamic> json) => _$IsEmriHammaddeTakibiDetayModelFromJson(json);
}

@unfreezed
class Referanslar with _$Referanslar {
  factory Referanslar({
    int? id,
    String? hammaddeNo,
    String? stokKodu,
    String? stokAdi,
    String? referansStokKodu,
    String? referansStokAdi,
  }) = _Referanslar;

  factory Referanslar.fromJson(Map<String, dynamic> json) => _$ReferanslarFromJson(json);
}

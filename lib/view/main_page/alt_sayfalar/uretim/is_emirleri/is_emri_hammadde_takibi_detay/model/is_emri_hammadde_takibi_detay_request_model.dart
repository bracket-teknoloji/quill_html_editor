import "package:freezed_annotation/freezed_annotation.dart";

part "is_emri_hammadde_takibi_detay_request_model.freezed.dart";
part "is_emri_hammadde_takibi_detay_request_model.g.dart";

@unfreezed
class IsEmriHammaddeTakibiDetayRequestModel with _$IsEmriHammaddeTakibiDetayRequestModel {
  factory IsEmriHammaddeTakibiDetayRequestModel({
    int? takipno,
    String? tip,
    String? barcode,
    int? islemKodu,
    String? referansStokKodu,
  }) = _IsEmriHammaddeTakibiDetayRequestModel;

  factory IsEmriHammaddeTakibiDetayRequestModel.fromJson(Map<String, dynamic> json) => _$IsEmriHammaddeTakibiDetayRequestModelFromJson(json);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_emri_hammadde_takibi_detay_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IsEmriHammaddeTakibiDetayRequestModel
_$IsEmriHammaddeTakibiDetayRequestModelFromJson(Map<String, dynamic> json) =>
    _IsEmriHammaddeTakibiDetayRequestModel(
      takipno: (json['TAKIPNO'] as num?)?.toInt(),
      tip: json['TIP'] as String?,
      barcode: json['BARCODE'] as String?,
      islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
      referansStokKodu: json['REFERANS_STOK_KODU'] as String?,
    );

Map<String, dynamic> _$IsEmriHammaddeTakibiDetayRequestModelToJson(
  _IsEmriHammaddeTakibiDetayRequestModel instance,
) => <String, dynamic>{
  'TAKIPNO': ?instance.takipno,
  'TIP': ?instance.tip,
  'BARCODE': ?instance.barcode,
  'ISLEM_KODU': ?instance.islemKodu,
  'REFERANS_STOK_KODU': ?instance.referansStokKodu,
};

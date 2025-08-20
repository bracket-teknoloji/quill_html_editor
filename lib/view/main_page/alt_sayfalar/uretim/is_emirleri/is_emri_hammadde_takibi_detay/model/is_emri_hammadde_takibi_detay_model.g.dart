// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_emri_hammadde_takibi_detay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IsEmriHammaddeTakibiDetayModel _$IsEmriHammaddeTakibiDetayModelFromJson(
  Map<String, dynamic> json,
) => _IsEmriHammaddeTakibiDetayModel(
  hamKodu: json['HAM_KODU'] as String?,
  hamAdi: json['HAM_ADI'] as String?,
  miktar: (json['MIKTAR'] as num?)?.toInt(),
  referanslar: (json['REFERANSLAR'] as List<dynamic>?)
      ?.map((e) => Referanslar.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$IsEmriHammaddeTakibiDetayModelToJson(
  _IsEmriHammaddeTakibiDetayModel instance,
) => <String, dynamic>{
  'HAM_KODU': ?instance.hamKodu,
  'HAM_ADI': ?instance.hamAdi,
  'MIKTAR': ?instance.miktar,
  'REFERANSLAR': ?instance.referanslar?.map((e) => e.toJson()).toList(),
};

_Referanslar _$ReferanslarFromJson(Map<String, dynamic> json) => _Referanslar(
  id: (json['ID'] as num?)?.toInt(),
  hammaddeNo: json['HAMMADDE_NO'] as String?,
  stokKodu: json['STOK_KODU'] as String?,
  stokAdi: json['STOK_ADI'] as String?,
  referansStokKodu: json['REFERANS_STOK_KODU'] as String?,
  referansStokAdi: json['REFERANS_STOK_ADI'] as String?,
);

Map<String, dynamic> _$ReferanslarToJson(_Referanslar instance) =>
    <String, dynamic>{
      'ID': ?instance.id,
      'HAMMADDE_NO': ?instance.hammaddeNo,
      'STOK_KODU': ?instance.stokKodu,
      'STOK_ADI': ?instance.stokAdi,
      'REFERANS_STOK_KODU': ?instance.referansStokKodu,
      'REFERANS_STOK_ADI': ?instance.referansStokAdi,
    };

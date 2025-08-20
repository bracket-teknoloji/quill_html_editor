// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ek_alanlar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EkAlanlarModel _$EkAlanlarModelFromJson(Map<String, dynamic> json) =>
    _EkAlanlarModel(
      tabloAdi: json['TABLO_ADI'] as String?,
      alanKodu: json['ALAN_KODU'] as String?,
      alanAciklama: json['ALAN_ACIKLAMA'] as String?,
      zorunlu: json['ZORUNLU'] as String?,
      aktif: json['AKTIF'] as String?,
      sira: (json['SIRA'] as num?)?.toInt(),
      veriTipi: (json['VERI_TIPI'] as num?)?.toInt(),
      uzunluk: (json['UZUNLUK'] as num?)?.toInt(),
      componentTipi: (json['COMPONENT_TIPI'] as num?)?.toInt(),
      secimListesi: (json['SecimListesi'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      ondeger: json['ONDEGER'] as String?,
    );

Map<String, dynamic> _$EkAlanlarModelToJson(_EkAlanlarModel instance) =>
    <String, dynamic>{
      'TABLO_ADI': ?instance.tabloAdi,
      'ALAN_KODU': ?instance.alanKodu,
      'ALAN_ACIKLAMA': ?instance.alanAciklama,
      'ZORUNLU': ?instance.zorunlu,
      'AKTIF': ?instance.aktif,
      'SIRA': ?instance.sira,
      'VERI_TIPI': ?instance.veriTipi,
      'UZUNLUK': ?instance.uzunluk,
      'COMPONENT_TIPI': ?instance.componentTipi,
      'SecimListesi': ?instance.secimListesi,
      'ONDEGER': ?instance.ondeger,
    };

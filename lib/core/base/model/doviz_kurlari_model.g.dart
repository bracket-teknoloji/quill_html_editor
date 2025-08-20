// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doviz_kurlari_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DovizKurlariModel _$DovizKurlariModelFromJson(Map<String, dynamic> json) =>
    _DovizKurlariModel(
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      sira: (json['SIRA'] as num?)?.toInt(),
      dovizTipi: (json['DOVIZ_TIPI'] as num?)?.toInt(),
      dovAlis: (json['DOV_ALIS'] as num?)?.toDouble(),
      dovSatis: (json['DOV_SATIS'] as num?)?.toDouble(),
      dovizAdi: json['DOVIZ_ADI'] as String?,
      effAlis: (json['EFF_ALIS'] as num?)?.toDouble(),
      effSatis: (json['EFF_SATIS'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DovizKurlariModelToJson(_DovizKurlariModel instance) =>
    <String, dynamic>{
      'TARIH': ?instance.tarih?.toIso8601String(),
      'SIRA': ?instance.sira,
      'DOVIZ_TIPI': ?instance.dovizTipi,
      'DOV_ALIS': ?instance.dovAlis,
      'DOV_SATIS': ?instance.dovSatis,
      'DOVIZ_ADI': ?instance.dovizAdi,
      'EFF_ALIS': ?instance.effAlis,
      'EFF_SATIS': ?instance.effSatis,
    };

_DovizKurlariRequestModel _$DovizKurlariRequestModelFromJson(
  Map<String, dynamic> json,
) => _DovizKurlariRequestModel(
  tarih: json['Tarih'] == null ? null : DateTime.parse(json['Tarih'] as String),
  sira: (json['Sira'] as num?)?.toInt(),
  dovizTipi: (json['DovizTipi'] as num?)?.toInt(),
  alis: (json['Alis'] as num?)?.toDouble(),
  satis: (json['Satis'] as num?)?.toDouble(),
  dovizAdi: json['DovizAdi'] as String?,
  eFAlis: (json['EFAlis'] as num?)?.toDouble(),
  eFSatis: (json['EFSatis'] as num?)?.toDouble(),
);

Map<String, dynamic> _$DovizKurlariRequestModelToJson(
  _DovizKurlariRequestModel instance,
) => <String, dynamic>{
  'Tarih': ?instance.tarih?.toIso8601String(),
  'Sira': ?instance.sira,
  'DovizTipi': ?instance.dovizTipi,
  'Alis': ?instance.alis,
  'Satis': ?instance.satis,
  'DovizAdi': ?instance.dovizAdi,
  'EFAlis': ?instance.eFAlis,
  'EFSatis': ?instance.eFSatis,
};

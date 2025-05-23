// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doviz_kurlari_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DovizKurlariModelImpl _$$DovizKurlariModelImplFromJson(Map<String, dynamic> json) => _$DovizKurlariModelImpl(
  tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
  sira: (json['SIRA'] as num?)?.toInt(),
  dovizTipi: (json['DOVIZ_TIPI'] as num?)?.toInt(),
  dovAlis: (json['DOV_ALIS'] as num?)?.toDouble(),
  dovSatis: (json['DOV_SATIS'] as num?)?.toDouble(),
  dovizAdi: json['DOVIZ_ADI'] as String?,
  effAlis: (json['EFF_ALIS'] as num?)?.toDouble(),
  effSatis: (json['EFF_SATIS'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$DovizKurlariModelImplToJson(_$DovizKurlariModelImpl instance) => <String, dynamic>{
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
  if (instance.sira case final value?) 'SIRA': value,
  if (instance.dovizTipi case final value?) 'DOVIZ_TIPI': value,
  if (instance.dovAlis case final value?) 'DOV_ALIS': value,
  if (instance.dovSatis case final value?) 'DOV_SATIS': value,
  if (instance.dovizAdi case final value?) 'DOVIZ_ADI': value,
  if (instance.effAlis case final value?) 'EFF_ALIS': value,
  if (instance.effSatis case final value?) 'EFF_SATIS': value,
};

_$DovizKurlariRequestModelImpl _$$DovizKurlariRequestModelImplFromJson(Map<String, dynamic> json) =>
    _$DovizKurlariRequestModelImpl(
      tarih: json['Tarih'] == null ? null : DateTime.parse(json['Tarih'] as String),
      sira: (json['Sira'] as num?)?.toInt(),
      dovizTipi: (json['DovizTipi'] as num?)?.toInt(),
      alis: (json['Alis'] as num?)?.toDouble(),
      satis: (json['Satis'] as num?)?.toDouble(),
      dovizAdi: json['DovizAdi'] as String?,
      eFAlis: (json['EFAlis'] as num?)?.toDouble(),
      eFSatis: (json['EFSatis'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DovizKurlariRequestModelImplToJson(_$DovizKurlariRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.tarih?.toIso8601String() case final value?) 'Tarih': value,
      if (instance.sira case final value?) 'Sira': value,
      if (instance.dovizTipi case final value?) 'DovizTipi': value,
      if (instance.alis case final value?) 'Alis': value,
      if (instance.satis case final value?) 'Satis': value,
      if (instance.dovizAdi case final value?) 'DovizAdi': value,
      if (instance.eFAlis case final value?) 'EFAlis': value,
      if (instance.eFSatis case final value?) 'EFSatis': value,
    };

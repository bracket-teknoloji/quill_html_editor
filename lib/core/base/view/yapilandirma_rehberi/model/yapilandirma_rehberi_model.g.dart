// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yapilandirma_rehberi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_YapilandirmaRehberiModel _$YapilandirmaRehberiModelFromJson(
  Map<String, dynamic> json,
) => _YapilandirmaRehberiModel(
  yapkod: json['YAPKOD'] as String?,
  yapacik: json['YAPACIK'] as String?,
  kod: json['KOD'] as String?,
  kodAciklama: json['KOD_ACIKLAMA'] as String?,
  deger: json['DEGER'] as String?,
  degerAciklama: json['DEGER_ACIKLAMA'] as String?,
  ozellikSira: (json['OZELLIK_SIRA'] as num?)?.toInt(),
);

Map<String, dynamic> _$YapilandirmaRehberiModelToJson(
  _YapilandirmaRehberiModel instance,
) => <String, dynamic>{
  'YAPKOD': ?instance.yapkod,
  'YAPACIK': ?instance.yapacik,
  'KOD': ?instance.kod,
  'KOD_ACIKLAMA': ?instance.kodAciklama,
  'DEGER': ?instance.deger,
  'DEGER_ACIKLAMA': ?instance.degerAciklama,
  'OZELLIK_SIRA': ?instance.ozellikSira,
};

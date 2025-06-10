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
  if (instance.yapkod case final value?) 'YAPKOD': value,
  if (instance.yapacik case final value?) 'YAPACIK': value,
  if (instance.kod case final value?) 'KOD': value,
  if (instance.kodAciklama case final value?) 'KOD_ACIKLAMA': value,
  if (instance.deger case final value?) 'DEGER': value,
  if (instance.degerAciklama case final value?) 'DEGER_ACIKLAMA': value,
  if (instance.ozellikSira case final value?) 'OZELLIK_SIRA': value,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genel_rehber_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenelRehberModel _$GenelRehberModelFromJson(Map<String, dynamic> json) => _GenelRehberModel(
  kodu: json['KODU'] as String?,
  aciklama: json['ACIKLAMA'] as String?,
  adi: json['ADI'] as String?,
);

Map<String, dynamic> _$GenelRehberModelToJson(_GenelRehberModel instance) => <String, dynamic>{
  if (instance.kodu case final value?) 'KODU': value,
  if (instance.aciklama case final value?) 'ACIKLAMA': value,
  if (instance.adi case final value?) 'ADI': value,
};

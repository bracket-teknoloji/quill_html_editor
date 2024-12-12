// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genel_rehber_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenelRehberModelImpl _$$GenelRehberModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GenelRehberModelImpl(
      kodu: json['KODU'] as String?,
      aciklama: json['ACIKLAMA'] as String?,
      adi: json['ADI'] as String?,
    );

Map<String, dynamic> _$$GenelRehberModelImplToJson(
        _$GenelRehberModelImpl instance) =>
    <String, dynamic>{
      if (instance.kodu case final value?) 'KODU': value,
      if (instance.aciklama case final value?) 'ACIKLAMA': value,
      if (instance.adi case final value?) 'ADI': value,
    };

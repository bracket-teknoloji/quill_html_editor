// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serbest_rapor_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerbestRaporResponseModel _$SerbestRaporResponseModelFromJson(
        Map<String, dynamic> json) =>
    SerbestRaporResponseModel()
      ..adi = json['ADI'] as String?
      ..bosGecilebilir = json['BOS_GECILEBILIR'] as bool?
      ..tipi = json['TIPI'] as String?
      ..deger = json['DEGER'] as String?
      ..rehberTipi = json['REHBER_TIPI'] as String?
      ..aciklama = json['ACIKLAMA'] as String?
      ..paramMap = json['PARAM_MAP'] as Map<String, dynamic>?;

Map<String, dynamic> _$SerbestRaporResponseModelToJson(
        SerbestRaporResponseModel instance) =>
    <String, dynamic>{
      if (instance.adi case final value?) 'ADI': value,
      if (instance.bosGecilebilir case final value?) 'BOS_GECILEBILIR': value,
      if (instance.tipi case final value?) 'TIPI': value,
      if (instance.deger case final value?) 'DEGER': value,
      if (instance.rehberTipi case final value?) 'REHBER_TIPI': value,
      if (instance.aciklama case final value?) 'ACIKLAMA': value,
      if (instance.paramMap case final value?) 'PARAM_MAP': value,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serbest_rapor_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerbestRaporResponseModel _$SerbestRaporResponseModelFromJson(
  Map<String, dynamic> json,
) => SerbestRaporResponseModel()
  ..adi = json['ADI'] as String?
  ..bosGecilebilir = json['BOS_GECILEBILIR'] as bool?
  ..tipi = json['TIPI'] as String?
  ..deger = json['DEGER'] as String?
  ..rehberTipi = json['REHBER_TIPI'] as String?
  ..aciklama = json['ACIKLAMA'] as String?
  ..paramMap = json['PARAM_MAP'] as Map<String, dynamic>?;

Map<String, dynamic> _$SerbestRaporResponseModelToJson(
  SerbestRaporResponseModel instance,
) => <String, dynamic>{
  'ADI': ?instance.adi,
  'BOS_GECILEBILIR': ?instance.bosGecilebilir,
  'TIPI': ?instance.tipi,
  'DEGER': ?instance.deger,
  'REHBER_TIPI': ?instance.rehberTipi,
  'ACIKLAMA': ?instance.aciklama,
  'PARAM_MAP': ?instance.paramMap,
};

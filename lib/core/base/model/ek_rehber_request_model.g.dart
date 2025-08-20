// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ek_rehber_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EkRehberRequestModel _$EkRehberRequestModelFromJson(
  Map<String, dynamic> json,
) => _EkRehberRequestModel(
  belgeNo: json['BelgeNo'] as String?,
  belgeTarihi: json['BelgeTarihi'] == null
      ? null
      : DateTime.parse(json['BelgeTarihi'] as String),
  belgeTipi: json['BelgeTipi'] as String?,
  cariKodu: json['CariKodu'] as String?,
  stokKodu: json['StokKodu'] as String?,
  id: (json['ID'] as num?)?.toInt(),
  rehberKodu: (json['RehberKodu'] as num?)?.toInt(),
  yapkod: json['Yapkod'] as String?,
  params: json['PARAMS'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$EkRehberRequestModelToJson(
  _EkRehberRequestModel instance,
) => <String, dynamic>{
  'BelgeNo': ?instance.belgeNo,
  'BelgeTarihi': ?instance.belgeTarihi?.toIso8601String(),
  'BelgeTipi': ?instance.belgeTipi,
  'CariKodu': ?instance.cariKodu,
  'StokKodu': ?instance.stokKodu,
  'ID': ?instance.id,
  'RehberKodu': ?instance.rehberKodu,
  'Yapkod': ?instance.yapkod,
  'PARAMS': ?instance.params,
};

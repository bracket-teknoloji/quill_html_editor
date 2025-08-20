// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evraklar_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EvraklarRequestModel _$EvraklarRequestModelFromJson(
  Map<String, dynamic> json,
) => _EvraklarRequestModel(
  belgeTipi: json['BelgeTipi'] as String?,
  urlGetir: json['UrlGetir'] as String?,
  belgeNo: json['BelgeNo'] as String?,
);

Map<String, dynamic> _$EvraklarRequestModelToJson(
  _EvraklarRequestModel instance,
) => <String, dynamic>{
  'BelgeTipi': ?instance.belgeTipi,
  'UrlGetir': ?instance.urlGetir,
  'BelgeNo': ?instance.belgeNo,
};

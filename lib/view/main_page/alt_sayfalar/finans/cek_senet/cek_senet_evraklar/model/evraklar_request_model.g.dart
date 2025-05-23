// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evraklar_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EvraklarRequestModelImpl _$$EvraklarRequestModelImplFromJson(Map<String, dynamic> json) => _$EvraklarRequestModelImpl(
  belgeTipi: json['BelgeTipi'] as String?,
  urlGetir: json['UrlGetir'] as String?,
  belgeNo: json['BelgeNo'] as String?,
);

Map<String, dynamic> _$$EvraklarRequestModelImplToJson(_$EvraklarRequestModelImpl instance) => <String, dynamic>{
  if (instance.belgeTipi case final value?) 'BelgeTipi': value,
  if (instance.urlGetir case final value?) 'UrlGetir': value,
  if (instance.belgeNo case final value?) 'BelgeNo': value,
};

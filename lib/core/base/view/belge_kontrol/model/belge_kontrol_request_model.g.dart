// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belge_kontrol_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BelgeKontrolRequestModel _$BelgeKontrolRequestModelFromJson(
  Map<String, dynamic> json,
) => _BelgeKontrolRequestModel(
  baslamaTarihi: json['BaslamaTarihi'] as String?,
  bitisTarihi: json['BitisTarihi'] as String?,
  durum: json['Durum'] as String?,
);

Map<String, dynamic> _$BelgeKontrolRequestModelToJson(
  _BelgeKontrolRequestModel instance,
) => <String, dynamic>{
  if (instance.baslamaTarihi case final value?) 'BaslamaTarihi': value,
  if (instance.bitisTarihi case final value?) 'BitisTarihi': value,
  if (instance.durum case final value?) 'Durum': value,
};

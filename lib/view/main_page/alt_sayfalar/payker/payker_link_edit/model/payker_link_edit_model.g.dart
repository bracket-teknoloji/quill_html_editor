// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payker_link_edit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaykerLinkEditModel _$PaykerLinkEditModelFromJson(Map<String, dynamic> json) => _PaykerLinkEditModel(
  firmaId: (json['FIRMA_ID'] as num?)?.toInt() ?? 0,
  bayiId: (json['BAYI_ID'] as num?)?.toInt(),
  tutar: (json['TUTAR'] as num?)?.toDouble(),
  email: json['EMAIL'] as String?,
  unvan: json['UNVAN'] as String?,
  bittar: json['BITTAR'] == null ? null : DateTime.parse(json['BITTAR'] as String),
  taksitlerJson: json['TAKSITLER_JSON'] as String?,
  kullanimSayisi: (json['KULLANIM_SAYISI'] as num?)?.toInt(),
  guid: json['GUID'] as String?,
  alindi: json['ALINDI'] as bool?,
);

Map<String, dynamic> _$PaykerLinkEditModelToJson(
  _PaykerLinkEditModel instance,
) => <String, dynamic>{
  'FIRMA_ID': instance.firmaId,
  if (instance.bayiId case final value?) 'BAYI_ID': value,
  if (instance.tutar case final value?) 'TUTAR': value,
  if (instance.email case final value?) 'EMAIL': value,
  if (instance.unvan case final value?) 'UNVAN': value,
  if (instance.bittar?.toIso8601String() case final value?) 'BITTAR': value,
  if (instance.taksitlerJson case final value?) 'TAKSITLER_JSON': value,
  if (instance.kullanimSayisi case final value?) 'KULLANIM_SAYISI': value,
  if (instance.guid case final value?) 'GUID': value,
  if (instance.alindi case final value?) 'ALINDI': value,
};

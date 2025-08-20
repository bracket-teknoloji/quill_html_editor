// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payker_link_edit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaykerLinkEditModel _$PaykerLinkEditModelFromJson(Map<String, dynamic> json) =>
    _PaykerLinkEditModel(
      firmaId: (json['FIRMA_ID'] as num?)?.toInt() ?? 0,
      bayiId: (json['BAYI_ID'] as num?)?.toInt(),
      tutar: (json['TUTAR'] as num?)?.toDouble(),
      email: json['EMAIL'] as String?,
      unvan: json['UNVAN'] as String?,
      bittar: json['BITTAR'] == null
          ? null
          : DateTime.parse(json['BITTAR'] as String),
      taksitlerJson: json['TAKSITLER_JSON'] as String?,
      kullanimSayisi: (json['KULLANIM_SAYISI'] as num?)?.toInt(),
      guid: json['GUID'] as String?,
      alindi: json['ALINDI'] as bool?,
    );

Map<String, dynamic> _$PaykerLinkEditModelToJson(
  _PaykerLinkEditModel instance,
) => <String, dynamic>{
  'FIRMA_ID': instance.firmaId,
  'BAYI_ID': ?instance.bayiId,
  'TUTAR': ?instance.tutar,
  'EMAIL': ?instance.email,
  'UNVAN': ?instance.unvan,
  'BITTAR': ?instance.bittar?.toIso8601String(),
  'TAKSITLER_JSON': ?instance.taksitlerJson,
  'KULLANIM_SAYISI': ?instance.kullanimSayisi,
  'GUID': ?instance.guid,
  'ALINDI': ?instance.alindi,
};

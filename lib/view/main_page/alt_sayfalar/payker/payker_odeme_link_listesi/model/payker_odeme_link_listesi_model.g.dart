// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payker_odeme_link_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaykerOdemeLinkListesiModel _$PaykerOdemeLinkListesiModelFromJson(
  Map<String, dynamic> json,
) => PaykerOdemeLinkListesiModel(
  id: (json['ID'] as num?)?.toInt(),
  guid: json['GUID'] as String?,
  firmaId: (json['FIRMA_ID'] as num?)?.toInt(),
  bayiId: (json['BAYI_ID'] as num?)?.toInt(),
  tutar: (json['TUTAR'] as num?)?.toInt(),
  email: json['EMAIL'] as String?,
  unvan: json['UNVAN'] as String?,
  alindi: json['ALINDI'] as bool?,
  bittar: json['BITTAR'] == null
      ? null
      : DateTime.parse(json['BITTAR'] as String),
  taksitlerJson: json['TAKSITLER_JSON'] as String?,
  kullanimSayisi: (json['KULLANIM_SAYISI'] as num?)?.toInt(),
  odemeler: (json['ODEMELER'] as List<dynamic>?)
      ?.map(
        (e) => PaykerOdemeLinkListesiModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  kayittarihi: json['KAYITTARIHI'] == null
      ? null
      : DateTime.parse(json['KAYITTARIHI'] as String),
  kayityapankul: json['KAYITYAPANKUL'] as String?,
  duzeltmetarihi: json['DUZELTMETARIHI'] == null
      ? null
      : DateTime.parse(json['DUZELTMETARIHI'] as String),
  duzeltmeyapankul: json['DUZELTMEYAPANKUL'] as String?,
);

Map<String, dynamic> _$PaykerOdemeLinkListesiModelToJson(
  PaykerOdemeLinkListesiModel instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'ID': value,
  if (instance.guid case final value?) 'GUID': value,
  if (instance.firmaId case final value?) 'FIRMA_ID': value,
  if (instance.bayiId case final value?) 'BAYI_ID': value,
  if (instance.tutar case final value?) 'TUTAR': value,
  if (instance.email case final value?) 'EMAIL': value,
  if (instance.unvan case final value?) 'UNVAN': value,
  if (instance.alindi case final value?) 'ALINDI': value,
  if (instance.bittar?.toIso8601String() case final value?) 'BITTAR': value,
  if (instance.taksitlerJson case final value?) 'TAKSITLER_JSON': value,
  if (instance.kullanimSayisi case final value?) 'KULLANIM_SAYISI': value,
  if (instance.odemeler?.map((e) => e.toJson()).toList() case final value?)
    'ODEMELER': value,
  if (instance.kayittarihi?.toIso8601String() case final value?)
    'KAYITTARIHI': value,
  if (instance.kayityapankul case final value?) 'KAYITYAPANKUL': value,
  if (instance.duzeltmetarihi?.toIso8601String() case final value?)
    'DUZELTMETARIHI': value,
  if (instance.duzeltmeyapankul case final value?) 'DUZELTMEYAPANKUL': value,
};

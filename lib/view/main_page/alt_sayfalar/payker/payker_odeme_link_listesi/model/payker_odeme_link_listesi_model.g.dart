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
  'ID': ?instance.id,
  'GUID': ?instance.guid,
  'FIRMA_ID': ?instance.firmaId,
  'BAYI_ID': ?instance.bayiId,
  'TUTAR': ?instance.tutar,
  'EMAIL': ?instance.email,
  'UNVAN': ?instance.unvan,
  'ALINDI': ?instance.alindi,
  'BITTAR': ?instance.bittar?.toIso8601String(),
  'TAKSITLER_JSON': ?instance.taksitlerJson,
  'KULLANIM_SAYISI': ?instance.kullanimSayisi,
  'ODEMELER': ?instance.odemeler?.map((e) => e.toJson()).toList(),
  'KAYITTARIHI': ?instance.kayittarihi?.toIso8601String(),
  'KAYITYAPANKUL': ?instance.kayityapankul,
  'DUZELTMETARIHI': ?instance.duzeltmetarihi?.toIso8601String(),
  'DUZELTMEYAPANKUL': ?instance.duzeltmeyapankul,
};

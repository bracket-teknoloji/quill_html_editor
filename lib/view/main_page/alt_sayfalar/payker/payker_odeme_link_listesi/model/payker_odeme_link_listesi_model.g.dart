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
  bayiId: json['BAYI_ID'],
  tutar: (json['TUTAR'] as num?)?.toInt(),
  email: json['EMAIL'] as String?,
  unvan: json['UNVAN'] as String?,
  alindi: json['ALINDI'] as bool?,
  bittar: json['BITTAR'] == null
      ? null
      : DateTime.parse(json['BITTAR'] as String),
  taksitlerJson: json['TAKSITLER_JSON'] as String?,
  kullanimSayisi: json['KULLANIM_SAYISI'],
  odemeler: (json['ODEMELER'] as List<dynamic>?)
      ?.map((e) => Odemeler.fromJson(e as Map<String, dynamic>))
      .toList(),
  silindi: json['SILINDI'],
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
  if (instance.silindi case final value?) 'SILINDI': value,
  if (instance.kayittarihi?.toIso8601String() case final value?)
    'KAYITTARIHI': value,
  if (instance.kayityapankul case final value?) 'KAYITYAPANKUL': value,
  if (instance.duzeltmetarihi?.toIso8601String() case final value?)
    'DUZELTMETARIHI': value,
  if (instance.duzeltmeyapankul case final value?) 'DUZELTMEYAPANKUL': value,
};

_Odemeler _$OdemelerFromJson(Map<String, dynamic> json) => _Odemeler(
  id: (json['ID'] as num?)?.toInt(),
  firmaId: (json['FIRMA_ID'] as num?)?.toInt(),
  kartIsim: json['KART_ISIM'] as String?,
  kartNo: json['KART_NO'] as String?,
  tutar: (json['TUTAR'] as num?)?.toInt(),
  aciklama: json['ACIKLAMA'],
  odemeTuru: json['ODEME_TURU'] as String?,
  ipAdres: json['IP_ADRES'] as String?,
  bankaId: (json['BANKA_ID'] as num?)?.toInt(),
  bayiId: json['BAYI_ID'],
  durum: json['DURUM'] as String?,
  durumKodu: json['DURUM_KODU'],
  durumAciklama: json['DURUM_ACIKLAMA'] as String?,
  odemelinkId: json['ODEMELINK_ID'] as String?,
  responsedata: json['RESPONSEDATA'] as String?,
  requestdata: json['REQUESTDATA'],
  belgeNo: json['BELGE_NO'] as String?,
  siparisNo: json['SIPARIS_NO'] as String?,
  banka: json['BANKA'],
  bayi: json['BAYI'],
  firma: json['FIRMA'],
  silindi: json['SILINDI'],
  kayittarihi: json['KAYITTARIHI'] == null
      ? null
      : DateTime.parse(json['KAYITTARIHI'] as String),
  kayityapankul: json['KAYITYAPANKUL'] as String?,
  duzeltmetarihi: json['DUZELTMETARIHI'] == null
      ? null
      : DateTime.parse(json['DUZELTMETARIHI'] as String),
  duzeltmeyapankul: json['DUZELTMEYAPANKUL'] as String?,
);

Map<String, dynamic> _$OdemelerToJson(_Odemeler instance) => <String, dynamic>{
  if (instance.id case final value?) 'ID': value,
  if (instance.firmaId case final value?) 'FIRMA_ID': value,
  if (instance.kartIsim case final value?) 'KART_ISIM': value,
  if (instance.kartNo case final value?) 'KART_NO': value,
  if (instance.tutar case final value?) 'TUTAR': value,
  if (instance.aciklama case final value?) 'ACIKLAMA': value,
  if (instance.odemeTuru case final value?) 'ODEME_TURU': value,
  if (instance.ipAdres case final value?) 'IP_ADRES': value,
  if (instance.bankaId case final value?) 'BANKA_ID': value,
  if (instance.bayiId case final value?) 'BAYI_ID': value,
  if (instance.durum case final value?) 'DURUM': value,
  if (instance.durumKodu case final value?) 'DURUM_KODU': value,
  if (instance.durumAciklama case final value?) 'DURUM_ACIKLAMA': value,
  if (instance.odemelinkId case final value?) 'ODEMELINK_ID': value,
  if (instance.responsedata case final value?) 'RESPONSEDATA': value,
  if (instance.requestdata case final value?) 'REQUESTDATA': value,
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.siparisNo case final value?) 'SIPARIS_NO': value,
  if (instance.banka case final value?) 'BANKA': value,
  if (instance.bayi case final value?) 'BAYI': value,
  if (instance.firma case final value?) 'FIRMA': value,
  if (instance.silindi case final value?) 'SILINDI': value,
  if (instance.kayittarihi?.toIso8601String() case final value?)
    'KAYITTARIHI': value,
  if (instance.kayityapankul case final value?) 'KAYITYAPANKUL': value,
  if (instance.duzeltmetarihi?.toIso8601String() case final value?)
    'DUZELTMETARIHI': value,
  if (instance.duzeltmeyapankul case final value?) 'DUZELTMEYAPANKUL': value,
};

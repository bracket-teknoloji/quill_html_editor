// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payker_odeme_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasePaykerOdemeListesiModel _$BasePaykerOdemeListesiModelFromJson(
  Map<String, dynamic> json,
) => BasePaykerOdemeListesiModel(
  draw: (json['DRAW'] as num?)?.toInt(),
  recordsTotal: (json['recordsTotal'] as num?)?.toInt(),
  recordsFiltered: (json['recordsFiltered'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => PaykerOdemeListesiModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BasePaykerOdemeListesiModelToJson(
  BasePaykerOdemeListesiModel instance,
) => <String, dynamic>{
  if (instance.draw case final value?) 'DRAW': value,
  if (instance.recordsTotal case final value?) 'recordsTotal': value,
  if (instance.recordsFiltered case final value?) 'recordsFiltered': value,
  if (instance.data?.map((e) => e.toJson()).toList() case final value?)
    'data': value,
};

PaykerOdemeListesiModel _$PaykerOdemeListesiModelFromJson(
  Map<String, dynamic> json,
) => PaykerOdemeListesiModel(
  id: (json['ID'] as num?)?.toInt(),
  firmaId: (json['FIRMA_ID'] as num?)?.toInt(),
  kartIsim: json['KART_ISIM'] as String?,
  kartNo: json['KART_NO'] as String?,
  enrollmentId: json['ENROLLMENT_ID'] as String?,
  transactionId: json['TRANSACTION_ID'] as String?,
  tutar: (json['TUTAR'] as num?)?.toDouble(),
  aciklama: json['ACIKLAMA'] as String?,
  odemeTuru: json['ODEME_TURU'] as String?,
  ipAdres: json['IP_ADRES'] as String?,
  bankaId: (json['BANKA_ID'] as num?)?.toInt(),
  bayiId: json['BAYI_ID'],
  durum: json['DURUM'] as String?,
  durumKodu: json['DURUM_KODU'] as String?,
  durumAciklama: json['DURUM_ACIKLAMA'] as String?,
  odemelinkId: json['ODEMELINK_ID'],
  responsedata: json['RESPONSEDATA'] as String?,
  banka: json['BANKA'] == null
      ? null
      : Banka.fromJson(json['BANKA'] as Map<String, dynamic>),
  bayi: json['BAYI'],
  firma: json['FIRMA'],
  odemeLink: json['ODEME_LINK'],
  silindi: json['SILINDI'],
  siparisNo: json['SIPARIS_NO'] as String?,
  firmaKodu: json['FIRMA_KODU'] as String?,
  kayittarihi: json['KAYITTARIHI'] == null
      ? null
      : DateTime.parse(json['KAYITTARIHI'] as String),
  kayityapankul: json['KAYITYAPANKUL'],
  duzeltmetarihi: json['DUZELTMETARIHI'] == null
      ? null
      : DateTime.parse(json['DUZELTMETARIHI'] as String),
  duzeltmeyapankul: json['DUZELTMEYAPANKUL'],
  belgeNo: json['BELGE_NO'] as String?,
  uygulama: json['UYGULAMA'] as String?,
  platform: json['PLATFORM'] as String?,
  erpSirket: json['ERP_SIRKET'] as String?,
  erpIsletmeKodu: (json['ERP_ISLETME_KODU'] as num?)?.toInt(),
  alinmaTarihi: json['ALINMA_TARIHI'] == null
      ? null
      : DateTime.parse(json['ALINMA_TARIHI'] as String),
  taksitSayisi: (json['TAKSIT_SAYISI'] as num?)?.toInt(),
);

Map<String, dynamic> _$PaykerOdemeListesiModelToJson(
  PaykerOdemeListesiModel instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'ID': value,
  if (instance.firmaId case final value?) 'FIRMA_ID': value,
  if (instance.kartIsim case final value?) 'KART_ISIM': value,
  if (instance.kartNo case final value?) 'KART_NO': value,
  if (instance.enrollmentId case final value?) 'ENROLLMENT_ID': value,
  if (instance.transactionId case final value?) 'TRANSACTION_ID': value,
  if (instance.tutar case final value?) 'TUTAR': value,
  if (instance.aciklama case final value?) 'ACIKLAMA': value,
  if (instance.odemeTuru case final value?) 'ODEME_TURU': value,
  if (instance.taksitSayisi case final value?) 'TAKSIT_SAYISI': value,
  if (instance.ipAdres case final value?) 'IP_ADRES': value,
  if (instance.bankaId case final value?) 'BANKA_ID': value,
  if (instance.bayiId case final value?) 'BAYI_ID': value,
  if (instance.durum case final value?) 'DURUM': value,
  if (instance.durumKodu case final value?) 'DURUM_KODU': value,
  if (instance.durumAciklama case final value?) 'DURUM_ACIKLAMA': value,
  if (instance.odemelinkId case final value?) 'ODEMELINK_ID': value,
  if (instance.responsedata case final value?) 'RESPONSEDATA': value,
  if (instance.banka?.toJson() case final value?) 'BANKA': value,
  if (instance.bayi case final value?) 'BAYI': value,
  if (instance.firma case final value?) 'FIRMA': value,
  if (instance.odemeLink case final value?) 'ODEME_LINK': value,
  if (instance.silindi case final value?) 'SILINDI': value,
  if (instance.kayittarihi?.toIso8601String() case final value?)
    'KAYITTARIHI': value,
  if (instance.kayityapankul case final value?) 'KAYITYAPANKUL': value,
  if (instance.duzeltmetarihi?.toIso8601String() case final value?)
    'DUZELTMETARIHI': value,
  if (instance.duzeltmeyapankul case final value?) 'DUZELTMEYAPANKUL': value,
  if (instance.siparisNo case final value?) 'SIPARIS_NO': value,
  if (instance.firmaKodu case final value?) 'FIRMA_KODU': value,
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.uygulama case final value?) 'UYGULAMA': value,
  if (instance.platform case final value?) 'PLATFORM': value,
  if (instance.erpSirket case final value?) 'ERP_SIRKET': value,
  if (instance.erpIsletmeKodu case final value?) 'ERP_ISLETME_KODU': value,
  if (instance.alinmaTarihi?.toIso8601String() case final value?)
    'ALINMA_TARIHI': value,
};

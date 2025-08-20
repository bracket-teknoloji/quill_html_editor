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
  'DRAW': ?instance.draw,
  'recordsTotal': ?instance.recordsTotal,
  'recordsFiltered': ?instance.recordsFiltered,
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
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
  'ID': ?instance.id,
  'FIRMA_ID': ?instance.firmaId,
  'KART_ISIM': ?instance.kartIsim,
  'KART_NO': ?instance.kartNo,
  'ENROLLMENT_ID': ?instance.enrollmentId,
  'TRANSACTION_ID': ?instance.transactionId,
  'TUTAR': ?instance.tutar,
  'ACIKLAMA': ?instance.aciklama,
  'TAKSIT_SAYISI': ?instance.taksitSayisi,
  'IP_ADRES': ?instance.ipAdres,
  'BANKA_ID': ?instance.bankaId,
  'BAYI_ID': ?instance.bayiId,
  'DURUM': ?instance.durum,
  'DURUM_KODU': ?instance.durumKodu,
  'DURUM_ACIKLAMA': ?instance.durumAciklama,
  'ODEMELINK_ID': ?instance.odemelinkId,
  'RESPONSEDATA': ?instance.responsedata,
  'BANKA': ?instance.banka?.toJson(),
  'BAYI': ?instance.bayi,
  'FIRMA': ?instance.firma,
  'ODEME_LINK': ?instance.odemeLink,
  'SILINDI': ?instance.silindi,
  'KAYITTARIHI': ?instance.kayittarihi?.toIso8601String(),
  'KAYITYAPANKUL': ?instance.kayityapankul,
  'DUZELTMETARIHI': ?instance.duzeltmetarihi?.toIso8601String(),
  'DUZELTMEYAPANKUL': ?instance.duzeltmeyapankul,
  'SIPARIS_NO': ?instance.siparisNo,
  'FIRMA_KODU': ?instance.firmaKodu,
  'BELGE_NO': ?instance.belgeNo,
  'UYGULAMA': ?instance.uygulama,
  'PLATFORM': ?instance.platform,
  'ERP_SIRKET': ?instance.erpSirket,
  'ERP_ISLETME_KODU': ?instance.erpIsletmeKodu,
  'ALINMA_TARIHI': ?instance.alinmaTarihi?.toIso8601String(),
};

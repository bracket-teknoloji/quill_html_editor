// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taksit_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaksitResponseModel _$TaksitResponseModelFromJson(Map<String, dynamic> json) =>
    TaksitResponseModel(
      bankaId: (json['BANKA_ID'] as num?)?.toInt(),
      bankaAdi: json['BANKA_ADI'] as String?,
      tutar: (json['TUTAR'] as num?)?.toInt(),
      taksitler: (json['TAKSITLER'] as List<dynamic>?)
          ?.map((e) => Taksitler.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TaksitResponseModelToJson(
  TaksitResponseModel instance,
) => <String, dynamic>{
  if (instance.bankaId case final value?) 'BANKA_ID': value,
  if (instance.bankaAdi case final value?) 'BANKA_ADI': value,
  if (instance.tutar case final value?) 'TUTAR': value,
  if (instance.taksitler?.map((e) => e.toJson()).toList() case final value?)
    'TAKSITLER': value,
};

Taksitler _$TaksitlerFromJson(Map<String, dynamic> json) => Taksitler(
  id: (json['ID'] as num?)?.toInt(),
  bankaId: (json['BANKA_ID'] as num?)?.toInt(),
  odemeMetni: json['ODEME_METNI'] as String?,
  taksit: (json['TAKSIT'] as num?)?.toInt(),
  ekstraTaksit: (json['EKSTRA_TAKSIT'] as num?)?.toInt(),
  altLimit: (json['ALT_LIMIT'] as num?)?.toInt(),
  vadeFarki: (json['VADE_FARKI'] as num?)?.toInt(),
  sira: (json['SIRA'] as num?)?.toInt(),
  banka: json['BANKA'] == null
      ? null
      : Banka.fromJson(json['BANKA'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TaksitlerToJson(Taksitler instance) => <String, dynamic>{
  if (instance.id case final value?) 'ID': value,
  if (instance.bankaId case final value?) 'BANKA_ID': value,
  if (instance.odemeMetni case final value?) 'ODEME_METNI': value,
  if (instance.taksit case final value?) 'TAKSIT': value,
  if (instance.ekstraTaksit case final value?) 'EKSTRA_TAKSIT': value,
  if (instance.altLimit case final value?) 'ALT_LIMIT': value,
  if (instance.vadeFarki case final value?) 'VADE_FARKI': value,
  if (instance.sira case final value?) 'SIRA': value,
  if (instance.banka?.toJson() case final value?) 'BANKA': value,
};

_Banka _$BankaFromJson(Map<String, dynamic> json) => _Banka(
  id: (json['ID'] as num?)?.toInt(),
  adi: json['ADI'] as String?,
  odemeLink: json['ODEME_LINK'] as String?,
  logoUrl: json['LOGO_URL'] as String?,
  silindi: json['SILINDI'] as String?,
  kayittarihi: json['KAYITTARIHI'] == null
      ? null
      : DateTime.parse(json['KAYITTARIHI'] as String),
  kayityapankul: json['KAYITYAPANKUL'] as String?,
  duzeltmetarihi: json['DUZELTMETARIHI'] == null
      ? null
      : DateTime.parse(json['DUZELTMETARIHI'] as String),
  duzeltmeyapankul: json['DUZELTMEYAPANKUL'] as String?,
);

Map<String, dynamic> _$BankaToJson(_Banka instance) => <String, dynamic>{
  if (instance.id case final value?) 'ID': value,
  if (instance.adi case final value?) 'ADI': value,
  if (instance.odemeLink case final value?) 'ODEME_LINK': value,
  if (instance.logoUrl case final value?) 'LOGO_URL': value,
  if (instance.silindi case final value?) 'SILINDI': value,
  if (instance.kayittarihi?.toIso8601String() case final value?)
    'KAYITTARIHI': value,
  if (instance.kayityapankul case final value?) 'KAYITYAPANKUL': value,
  if (instance.duzeltmetarihi?.toIso8601String() case final value?)
    'DUZELTMETARIHI': value,
  if (instance.duzeltmeyapankul case final value?) 'DUZELTMEYAPANKUL': value,
};

_Sanalpos _$SanalposFromJson(Map<String, dynamic> json) => _Sanalpos(
  id: (json['ID'] as num?)?.toInt(),
  bankaId: (json['BANKA_ID'] as num?)?.toInt(),
  firmaId: (json['FIRMA_ID'] as num?)?.toInt(),
  merchantId: json['MERCHANT_ID'] as String?,
  merchantUser: json['MERCHANT_USER'] as String?,
  merchantPassword: json['MERCHANT_PASSWORD'] as String?,
  terminalNo: json['TERMINAL_NO'] as String?,
  storeKey: json['STORE_KEY'] as String?,
  aktifMi: json['AKTIF_MI'] as bool?,
  testMi: json['TEST_MI'] as bool?,
  silindi: json['SILINDI'] as String?,
  kayittarihi: json['KAYITTARIHI'] == null
      ? null
      : DateTime.parse(json['KAYITTARIHI'] as String),
  kayityapankul: json['KAYITYAPANKUL'] as String?,
  duzeltmetarihi: json['DUZELTMETARIHI'] == null
      ? null
      : DateTime.parse(json['DUZELTMETARIHI'] as String),
  duzeltmeyapankul: json['DUZELTMEYAPANKUL'] as String?,
);

Map<String, dynamic> _$SanalposToJson(_Sanalpos instance) => <String, dynamic>{
  if (instance.id case final value?) 'ID': value,
  if (instance.bankaId case final value?) 'BANKA_ID': value,
  if (instance.firmaId case final value?) 'FIRMA_ID': value,
  if (instance.merchantId case final value?) 'MERCHANT_ID': value,
  if (instance.merchantUser case final value?) 'MERCHANT_USER': value,
  if (instance.merchantPassword case final value?) 'MERCHANT_PASSWORD': value,
  if (instance.terminalNo case final value?) 'TERMINAL_NO': value,
  if (instance.storeKey case final value?) 'STORE_KEY': value,
  if (instance.aktifMi case final value?) 'AKTIF_MI': value,
  if (instance.testMi case final value?) 'TEST_MI': value,
  if (instance.silindi case final value?) 'SILINDI': value,
  if (instance.kayittarihi?.toIso8601String() case final value?)
    'KAYITTARIHI': value,
  if (instance.kayityapankul case final value?) 'KAYITYAPANKUL': value,
  if (instance.duzeltmetarihi?.toIso8601String() case final value?)
    'DUZELTMETARIHI': value,
  if (instance.duzeltmeyapankul case final value?) 'DUZELTMEYAPANKUL': value,
};

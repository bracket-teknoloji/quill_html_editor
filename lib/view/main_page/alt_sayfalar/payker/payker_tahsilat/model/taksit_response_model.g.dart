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
  'BANKA_ID': ?instance.bankaId,
  'BANKA_ADI': ?instance.bankaAdi,
  'TUTAR': ?instance.tutar,
  'TAKSITLER': ?instance.taksitler?.map((e) => e.toJson()).toList(),
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
  'ID': ?instance.id,
  'BANKA_ID': ?instance.bankaId,
  'ODEME_METNI': ?instance.odemeMetni,
  'TAKSIT': ?instance.taksit,
  'EKSTRA_TAKSIT': ?instance.ekstraTaksit,
  'ALT_LIMIT': ?instance.altLimit,
  'VADE_FARKI': ?instance.vadeFarki,
  'SIRA': ?instance.sira,
  'BANKA': ?instance.banka?.toJson(),
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
  'ID': ?instance.id,
  'ADI': ?instance.adi,
  'ODEME_LINK': ?instance.odemeLink,
  'LOGO_URL': ?instance.logoUrl,
  'SILINDI': ?instance.silindi,
  'KAYITTARIHI': ?instance.kayittarihi?.toIso8601String(),
  'KAYITYAPANKUL': ?instance.kayityapankul,
  'DUZELTMETARIHI': ?instance.duzeltmetarihi?.toIso8601String(),
  'DUZELTMEYAPANKUL': ?instance.duzeltmeyapankul,
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
  'ID': ?instance.id,
  'BANKA_ID': ?instance.bankaId,
  'FIRMA_ID': ?instance.firmaId,
  'MERCHANT_ID': ?instance.merchantId,
  'MERCHANT_USER': ?instance.merchantUser,
  'MERCHANT_PASSWORD': ?instance.merchantPassword,
  'TERMINAL_NO': ?instance.terminalNo,
  'STORE_KEY': ?instance.storeKey,
  'AKTIF_MI': ?instance.aktifMi,
  'TEST_MI': ?instance.testMi,
  'SILINDI': ?instance.silindi,
  'KAYITTARIHI': ?instance.kayittarihi?.toIso8601String(),
  'KAYITYAPANKUL': ?instance.kayityapankul,
  'DUZELTMETARIHI': ?instance.duzeltmetarihi?.toIso8601String(),
  'DUZELTMEYAPANKUL': ?instance.duzeltmeyapankul,
};

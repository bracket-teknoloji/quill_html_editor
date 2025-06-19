// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payker_odeme_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaykerOdemeListesiModel _$PaykerOdemeListesiModelFromJson(
  Map<String, dynamic> json,
) =>
    PaykerOdemeListesiModel(
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
      )
      ..silindi = json['SILINDI']
      ..kayittarihi = json['KAYITTARIHI'] == null
          ? null
          : DateTime.parse(json['KAYITTARIHI'] as String)
      ..kayityapankul = json['KAYITYAPANKUL']
      ..duzeltmetarihi = json['DUZELTMETARIHI'] == null
          ? null
          : DateTime.parse(json['DUZELTMETARIHI'] as String)
      ..duzeltmeyapankul = json['DUZELTMEYAPANKUL'];

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
};

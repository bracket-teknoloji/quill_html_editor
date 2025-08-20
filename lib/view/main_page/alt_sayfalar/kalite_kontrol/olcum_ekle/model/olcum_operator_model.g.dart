// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_operator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OlcumOperatorModel _$OlcumOperatorModelFromJson(Map<String, dynamic> json) =>
    _OlcumOperatorModel(
      id: (json['ID'] as num?)?.toInt(),
      isyeri: json['ISYERI'] as String?,
      adi: json['ADI'] as String?,
      istasyonKodu: json['ISTASYON_KODU'] as String?,
      istasyonTanimi: json['ISTASYON_TANIMI'] as String?,
      durum: json['DURUM'] as String?,
      sicilno: json['SICILNO'] as String?,
      adiSoyadi: json['ADI_SOYADI'] as String?,
      soyadi: json['SOYADI'] as String?,
      isletmeKodu: (json['ISLETME_KODU'] as num?)?.toInt(),
      kartid: json['KARTID'] as String?,
      resim: json['RESIM'] as String?,
    );

Map<String, dynamic> _$OlcumOperatorModelToJson(_OlcumOperatorModel instance) =>
    <String, dynamic>{
      'ID': ?instance.id,
      'ISYERI': ?instance.isyeri,
      'ADI': ?instance.adi,
      'ISTASYON_KODU': ?instance.istasyonKodu,
      'ISTASYON_TANIMI': ?instance.istasyonTanimi,
      'DURUM': ?instance.durum,
      'SICILNO': ?instance.sicilno,
      'ADI_SOYADI': ?instance.adiSoyadi,
      'SOYADI': ?instance.soyadi,
      'ISLETME_KODU': ?instance.isletmeKodu,
      'KARTID': ?instance.kartid,
      'RESIM': ?instance.resim,
    };

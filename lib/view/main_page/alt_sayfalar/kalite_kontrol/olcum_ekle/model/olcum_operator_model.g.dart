// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_operator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OlcumOperatorModelImpl _$$OlcumOperatorModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OlcumOperatorModelImpl(
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

Map<String, dynamic> _$$OlcumOperatorModelImplToJson(
        _$OlcumOperatorModelImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'ID': value,
      if (instance.isyeri case final value?) 'ISYERI': value,
      if (instance.adi case final value?) 'ADI': value,
      if (instance.istasyonKodu case final value?) 'ISTASYON_KODU': value,
      if (instance.istasyonTanimi case final value?) 'ISTASYON_TANIMI': value,
      if (instance.durum case final value?) 'DURUM': value,
      if (instance.sicilno case final value?) 'SICILNO': value,
      if (instance.adiSoyadi case final value?) 'ADI_SOYADI': value,
      if (instance.soyadi case final value?) 'SOYADI': value,
      if (instance.isletmeKodu case final value?) 'ISLETME_KODU': value,
      if (instance.kartid case final value?) 'KARTID': value,
      if (instance.resim case final value?) 'RESIM': value,
    };

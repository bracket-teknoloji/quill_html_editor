// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'isletme_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IsletmeModel _$IsletmeModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'IsletmeModel',
      json,
      ($checkedConvert) {
        final val = IsletmeModel();
        $checkedConvert('SIRKET', (v) => val.sirket = v as String?);
        $checkedConvert('ISLETME_KODU', (v) => val.isletmeKodu = v as int?);
        $checkedConvert('SUBE_KODU', (v) => val.subeKodu = v as int?);
        $checkedConvert('SUBE_ADI', (v) => val.subeAdi = v as String?);
        $checkedConvert('ISLETME_ADI', (v) => val.isletmeAdi = v as String?);
        $checkedConvert(
            'LOKAL_DEPO_AKTIF', (v) => val.lokalDepoAktif = v as bool?);
        $checkedConvert('MERKEZMI', (v) => val.merkezmi = v as String?);
        $checkedConvert('ADRES', (v) => val.adres = v as String?);
        $checkedConvert('TELEFON', (v) => val.telefon = v as String?);
        $checkedConvert('FAKS', (v) => val.faks = v as String?);
        $checkedConvert('EMAIL', (v) => val.email = v as String?);
        $checkedConvert('IL_ADI', (v) => val.ilAdi = v as String?);
        $checkedConvert('ILCE', (v) => val.ilce = v as String?);
        $checkedConvert(
            'VERGI_NUMARASI', (v) => val.vergiNumarasi = v as String?);
        $checkedConvert(
            'VERGI_DAIRESI', (v) => val.vergiDairesi = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'sirket': 'SIRKET',
        'isletmeKodu': 'ISLETME_KODU',
        'subeKodu': 'SUBE_KODU',
        'subeAdi': 'SUBE_ADI',
        'isletmeAdi': 'ISLETME_ADI',
        'lokalDepoAktif': 'LOKAL_DEPO_AKTIF',
        'merkezmi': 'MERKEZMI',
        'adres': 'ADRES',
        'telefon': 'TELEFON',
        'faks': 'FAKS',
        'email': 'EMAIL',
        'ilAdi': 'IL_ADI',
        'ilce': 'ILCE',
        'vergiNumarasi': 'VERGI_NUMARASI',
        'vergiDairesi': 'VERGI_DAIRESI'
      },
    );

Map<String, dynamic> _$IsletmeModelToJson(IsletmeModel instance) =>
    <String, dynamic>{
      'SIRKET': instance.sirket,
      'ISLETME_KODU': instance.isletmeKodu,
      'SUBE_KODU': instance.subeKodu,
      'SUBE_ADI': instance.subeAdi,
      'ISLETME_ADI': instance.isletmeAdi,
      'LOKAL_DEPO_AKTIF': instance.lokalDepoAktif,
      'MERKEZMI': instance.merkezmi,
      'ADRES': instance.adres,
      'TELEFON': instance.telefon,
      'FAKS': instance.faks,
      'EMAIL': instance.email,
      'IL_ADI': instance.ilAdi,
      'ILCE': instance.ilce,
      'VERGI_NUMARASI': instance.vergiNumarasi,
      'VERGI_DAIRESI': instance.vergiDairesi,
    };

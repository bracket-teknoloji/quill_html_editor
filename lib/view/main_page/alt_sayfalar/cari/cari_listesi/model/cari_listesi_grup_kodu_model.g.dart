// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'cari_listesi_grup_kodu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariGrupKoduModel _$CariGrupKoduModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CariGrupKoduModel',
      json,
      ($checkedConvert) {
        final val = CariGrupKoduModel();
        $checkedConvert('MODUL', (v) => val.modul = v as String?);
        $checkedConvert('GRUP_NO', (v) => val.grupNo = v as int?);
        $checkedConvert('GRUP_KODU', (v) => val.grupKodu = v as String?);
        $checkedConvert('GRUP_ADI', (v) => val.grupAdi = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'modul': 'MODUL',
        'grupNo': 'GRUP_NO',
        'grupKodu': 'GRUP_KODU',
        'grupAdi': 'GRUP_ADI'
      },
    );

Map<String, dynamic> _$CariGrupKoduModelToJson(CariGrupKoduModel instance) =>
    <String, dynamic>{
      'MODUL': instance.modul,
      'GRUP_NO': instance.grupNo,
      'GRUP_KODU': instance.grupKodu,
      'GRUP_ADI': instance.grupAdi,
    };

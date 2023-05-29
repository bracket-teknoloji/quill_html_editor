// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'base_grup_kodu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseGrupKoduModel _$BaseGrupKoduModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BaseGrupKoduModel',
      json,
      ($checkedConvert) {
        final val = BaseGrupKoduModel();
        $checkedConvert('MODUL', (v) => val.modul = v as String?);
        $checkedConvert('GRUP_NO', (v) => val.grupNo = v as int?);
        $checkedConvert('GRUP_KODU', (v) => val.grupKodu = v as String?);
        $checkedConvert('GRUP_ADI', (v) => val.grupAdi = v as String?);
        $checkedConvert('TIP', (v) => val.tip = v as String?);
        $checkedConvert('KOD1', (v) => val.kod1 = v as String?);
        $checkedConvert('KOD2', (v) => val.kod2 = v as String?);
        $checkedConvert('KOD3', (v) => val.kod3 = v as String?);
        $checkedConvert('KOD4', (v) => val.kod4 = v as String?);
        $checkedConvert('KOD5', (v) => val.kod5 = v as String?);
        $checkedConvert('KOD1_ADI', (v) => val.kod1Adi = v as String?);
        $checkedConvert('KOD2_ADI', (v) => val.kod2Adi = v as String?);
        $checkedConvert('KOD3_ADI', (v) => val.kod3Adi = v as String?);
        $checkedConvert('KOD4_ADI', (v) => val.kod4Adi = v as String?);
        $checkedConvert('KOD5_ADI', (v) => val.kod5Adi = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'modul': 'MODUL',
        'grupNo': 'GRUP_NO',
        'grupKodu': 'GRUP_KODU',
        'grupAdi': 'GRUP_ADI',
        'tip': 'TIP',
        'kod1': 'KOD1',
        'kod2': 'KOD2',
        'kod3': 'KOD3',
        'kod4': 'KOD4',
        'kod5': 'KOD5',
        'kod1Adi': 'KOD1_ADI',
        'kod2Adi': 'KOD2_ADI',
        'kod3Adi': 'KOD3_ADI',
        'kod4Adi': 'KOD4_ADI',
        'kod5Adi': 'KOD5_ADI'
      },
    );

Map<String, dynamic> _$BaseGrupKoduModelToJson(BaseGrupKoduModel instance) =>
    <String, dynamic>{
      'MODUL': instance.modul,
      'GRUP_NO': instance.grupNo,
      'GRUP_KODU': instance.grupKodu,
      'GRUP_ADI': instance.grupAdi,
      'TIP': instance.tip,
      'KOD1': instance.kod1,
      'KOD2': instance.kod2,
      'KOD3': instance.kod3,
      'KOD4': instance.kod4,
      'KOD5': instance.kod5,
      'KOD1_ADI': instance.kod1Adi,
      'KOD2_ADI': instance.kod2Adi,
      'KOD3_ADI': instance.kod3Adi,
      'KOD4_ADI': instance.kod4Adi,
      'KOD5_ADI': instance.kod5Adi,
    };

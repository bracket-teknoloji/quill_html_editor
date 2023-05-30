// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'ulke_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UlkeModel _$UlkeModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UlkeModel',
      json,
      ($checkedConvert) {
        final val = UlkeModel();
        $checkedConvert('ULKE_KODU', (v) => val.ulkeKodu = v as String?);
        $checkedConvert('ULKE_ADI', (v) => val.ulkeAdi = v as String?);
        return val;
      },
      fieldKeyMap: const {'ulkeKodu': 'ULKE_KODU', 'ulkeAdi': 'ULKE_ADI'},
    );

Map<String, dynamic> _$UlkeModelToJson(UlkeModel instance) => <String, dynamic>{
      'ULKE_KODU': instance.ulkeKodu,
      'ULKE_ADI': instance.ulkeAdi,
    };

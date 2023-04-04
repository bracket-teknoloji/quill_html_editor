// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'sirket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SirketModel _$SirketModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'SirketModel',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['isDevredilmis'],
        );
        final val = SirketModel();
        $checkedConvert('SIRKET', (v) => val.sirket = v as String?);
        $checkedConvert('DEVSIRKET', (v) => val.devsirket = v as String?);
        $checkedConvert('YIL', (v) => val.yil = v as int?);
        $checkedConvert('isDevredilmis', (v) => val.isDevredilmis = v as bool?);
        return val;
      },
      fieldKeyMap: const {
        'sirket': 'SIRKET',
        'devsirket': 'DEVSIRKET',
        'yil': 'YIL'
      },
    );

Map<String, dynamic> _$SirketModelToJson(SirketModel instance) =>
    <String, dynamic>{
      'SIRKET': instance.sirket,
      'DEVSIRKET': instance.devsirket,
      'YIL': instance.yil,
      'isDevredilmis': instance.isDevredilmis,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'companies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CompanyModel',
      json,
      ($checkedConvert) {
        final val = CompanyModel();
        $checkedConvert('SIRKET', (v) => val.company = v as String?);
        $checkedConvert('YIL', (v) => val.year = v as int?);
        return val;
      },
      fieldKeyMap: const {'company': 'SIRKET', 'year': 'YIL'},
    );

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) =>
    <String, dynamic>{
      'SIRKET': instance.company,
      'YIL': instance.year,
    };

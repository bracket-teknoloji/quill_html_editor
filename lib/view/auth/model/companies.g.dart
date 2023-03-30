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
        final val = CompanyModel(
          companyModel: $checkedConvert('SIRKET', (v) => v as String?),
          year: $checkedConvert('YIL', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {'companyModel': 'SIRKET', 'year': 'YIL'},
    );

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) =>
    <String, dynamic>{
      'SIRKET': instance.companyModel,
      'YIL': instance.year,
    };

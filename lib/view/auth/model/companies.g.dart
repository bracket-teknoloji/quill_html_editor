// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'companies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Company',
      json,
      ($checkedConvert) {
        final val = Company(
          company: $checkedConvert('SIRKET', (v) => v as String?),
          year: $checkedConvert('YIL', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {'company': 'SIRKET', 'year': 'YIL'},
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'SIRKET': instance.company,
      'YIL': instance.year,
    };

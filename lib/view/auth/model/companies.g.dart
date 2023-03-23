// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Companies _$CompaniesFromJson(Map<String, dynamic> json) => Companies()
  ..sirket = json['SIRKET'] as String?
  ..year = json['YIL'] as int?;

Map<String, dynamic> _$CompaniesToJson(Companies instance) => <String, dynamic>{
      'SIRKET': instance.sirket,
      'YIL': instance.year,
    };

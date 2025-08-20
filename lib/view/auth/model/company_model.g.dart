// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) => CompanyModel()
  ..company = json['SIRKET'] as String?
  ..year = (json['YIL'] as num?)?.toInt()
  ..devSirket = json['DEVSIRKET'] as String?
  ..isDevredilmis = json['isDevredilmis'] as bool?;

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) =>
    <String, dynamic>{
      'SIRKET': ?instance.company,
      'YIL': ?instance.year,
      'DEVSIRKET': ?instance.devSirket,
      'isDevredilmis': ?instance.isDevredilmis,
    };

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

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SIRKET', instance.company);
  writeNotNull('YIL', instance.year);
  writeNotNull('DEVSIRKET', instance.devSirket);
  writeNotNull('isDevredilmis', instance.isDevredilmis);
  return val;
}

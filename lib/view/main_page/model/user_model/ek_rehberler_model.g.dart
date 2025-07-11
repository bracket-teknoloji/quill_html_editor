// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ek_rehberler_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EkRehberlerModel _$EkRehberlerModelFromJson(Map<String, dynamic> json) => _EkRehberlerModel(
  id: (json['ID'] as num?)?.toInt(),
  baslik: json['BASLIK'] as String?,
  ekran: json['EKRAN'] as String?,
  alan: json['ALAN'] as String?,
);

Map<String, dynamic> _$EkRehberlerModelToJson(_EkRehberlerModel instance) => <String, dynamic>{
  if (instance.id case final value?) 'ID': value,
  if (instance.baslik case final value?) 'BASLIK': value,
  if (instance.ekran case final value?) 'EKRAN': value,
  if (instance.alan case final value?) 'ALAN': value,
};

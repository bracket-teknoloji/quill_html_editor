// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ek_rehberler_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EkRehberlerModelImpl _$$EkRehberlerModelImplFromJson(Map<String, dynamic> json) => _$EkRehberlerModelImpl(
  id: (json['ID'] as num?)?.toInt(),
  baslik: json['BASLIK'] as String?,
  ekran: json['EKRAN'] as String?,
  alan: json['ALAN'] as String?,
);

Map<String, dynamic> _$$EkRehberlerModelImplToJson(_$EkRehberlerModelImpl instance) => <String, dynamic>{
  if (instance.id case final value?) 'ID': value,
  if (instance.baslik case final value?) 'BASLIK': value,
  if (instance.ekran case final value?) 'EKRAN': value,
  if (instance.alan case final value?) 'ALAN': value,
};

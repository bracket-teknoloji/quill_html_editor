// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ek_rehberler_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EkRehberlerModel _$EkRehberlerModelFromJson(Map<String, dynamic> json) =>
    _EkRehberlerModel(
      id: (json['ID'] as num?)?.toInt(),
      baslik: json['BASLIK'] as String?,
      ekran: json['EKRAN'] as String?,
      alan: json['ALAN'] as String?,
    );

Map<String, dynamic> _$EkRehberlerModelToJson(_EkRehberlerModel instance) =>
    <String, dynamic>{
      'ID': ?instance.id,
      'BASLIK': ?instance.baslik,
      'EKRAN': ?instance.ekran,
      'ALAN': ?instance.alan,
    };

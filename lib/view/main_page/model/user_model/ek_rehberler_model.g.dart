// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ek_rehberler_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EkRehberlerModelImpl _$$EkRehberlerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EkRehberlerModelImpl(
      id: (json['ID'] as num?)?.toInt(),
      baslik: json['BASLIK'] as String?,
      ekran: json['EKRAN'] as String?,
      alan: json['ALAN'] as String?,
    );

Map<String, dynamic> _$$EkRehberlerModelImplToJson(
    _$EkRehberlerModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.id);
  writeNotNull('BASLIK', instance.baslik);
  writeNotNull('EKRAN', instance.ekran);
  writeNotNull('ALAN', instance.alan);
  return val;
}

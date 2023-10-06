// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SeriModel _$$_SeriModelFromJson(Map<String, dynamic> json) => _$_SeriModel(
      seriNo: json['SERI_NO'] as String?,
      aciklama: json['ACIKLAMA'] as String?,
    );

Map<String, dynamic> _$$_SeriModelToJson(_$_SeriModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SERI_NO', instance.seriNo);
  writeNotNull('ACIKLAMA', instance.aciklama);
  return val;
}

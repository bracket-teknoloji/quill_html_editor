// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genel_rehber_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenelRehberModelImpl _$$GenelRehberModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GenelRehberModelImpl(
      kodu: json['KODU'] as String?,
      aciklama: json['ACIKLAMA'] as String?,
      adi: json['ADI'] as String?,
    );

Map<String, dynamic> _$$GenelRehberModelImplToJson(
    _$GenelRehberModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KODU', instance.kodu);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('ADI', instance.adi);
  return val;
}

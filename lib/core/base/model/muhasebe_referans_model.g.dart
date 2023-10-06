// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muhasebe_referans_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MuhasebeReferansModel _$$_MuhasebeReferansModelFromJson(
        Map<String, dynamic> json) =>
    _$_MuhasebeReferansModel(
      kodu: json['KODU'] as String?,
      tanimi: json['TANIMI'] as String?,
    );

Map<String, dynamic> _$$_MuhasebeReferansModelToJson(
    _$_MuhasebeReferansModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KODU', instance.kodu);
  writeNotNull('TANIMI', instance.tanimi);
  return val;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muhasebe_referans_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MuhasebeReferansModelImpl _$$MuhasebeReferansModelImplFromJson(Map<String, dynamic> json) => _$MuhasebeReferansModelImpl(
      kodu: json['KODU'] as String?,
      tanimi: json['TANIMI'] as String?,
    );

Map<String, dynamic> _$$MuhasebeReferansModelImplToJson(_$MuhasebeReferansModelImpl instance) {
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

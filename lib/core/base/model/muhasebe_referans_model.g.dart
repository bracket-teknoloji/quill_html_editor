// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muhasebe_referans_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MuhasebeReferansModel _$MuhasebeReferansModelFromJson(
  Map<String, dynamic> json,
) => _MuhasebeReferansModel(
  kodu: json['KODU'] as String?,
  tanimi: json['TANIMI'] as String?,
);

Map<String, dynamic> _$MuhasebeReferansModelToJson(
  _MuhasebeReferansModel instance,
) => <String, dynamic>{
  if (instance.kodu case final value?) 'KODU': value,
  if (instance.tanimi case final value?) 'TANIMI': value,
};

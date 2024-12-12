// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muhasebe_referans_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MuhasebeReferansModelImpl _$$MuhasebeReferansModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MuhasebeReferansModelImpl(
      kodu: json['KODU'] as String?,
      tanimi: json['TANIMI'] as String?,
    );

Map<String, dynamic> _$$MuhasebeReferansModelImplToJson(
        _$MuhasebeReferansModelImpl instance) =>
    <String, dynamic>{
      if (instance.kodu case final value?) 'KODU': value,
      if (instance.tanimi case final value?) 'TANIMI': value,
    };

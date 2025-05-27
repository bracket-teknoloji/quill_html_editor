// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ortalama_vade_tarihi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrtalamaVadeTarihiModelImpl _$$OrtalamaVadeTarihiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrtalamaVadeTarihiModelImpl(
      vadeTarihi: json['VADE_TARIHI'] == null
          ? null
          : DateTime.parse(json['VADE_TARIHI'] as String),
      tutar: (json['TUTAR'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$OrtalamaVadeTarihiModelImplToJson(
        _$OrtalamaVadeTarihiModelImpl instance) =>
    <String, dynamic>{
      if (instance.vadeTarihi?.toIso8601String() case final value?)
        'VADE_TARIHI': value,
      if (instance.tutar case final value?) 'TUTAR': value,
    };

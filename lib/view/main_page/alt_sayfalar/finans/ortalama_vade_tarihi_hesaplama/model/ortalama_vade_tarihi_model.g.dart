// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ortalama_vade_tarihi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrtalamaVadeTarihiModel _$OrtalamaVadeTarihiModelFromJson(
  Map<String, dynamic> json,
) => _OrtalamaVadeTarihiModel(
  vadeTarihi: json['VADE_TARIHI'] == null
      ? null
      : DateTime.parse(json['VADE_TARIHI'] as String),
  tutar: (json['TUTAR'] as num?)?.toDouble(),
);

Map<String, dynamic> _$OrtalamaVadeTarihiModelToJson(
  _OrtalamaVadeTarihiModel instance,
) => <String, dynamic>{
  'VADE_TARIHI': ?instance.vadeTarihi?.toIso8601String(),
  'TUTAR': ?instance.tutar,
};

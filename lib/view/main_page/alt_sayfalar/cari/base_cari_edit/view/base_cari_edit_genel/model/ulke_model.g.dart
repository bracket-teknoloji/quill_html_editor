// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ulke_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UlkeModel _$UlkeModelFromJson(Map<String, dynamic> json) =>
    UlkeModel()
      ..ulkeKodu = json['ULKE_KODU'] as String?
      ..ulkeAdi = json['ULKE_ADI'] as String?;

Map<String, dynamic> _$UlkeModelToJson(UlkeModel instance) => <String, dynamic>{
  if (instance.ulkeKodu case final value?) 'ULKE_KODU': value,
  if (instance.ulkeAdi case final value?) 'ULKE_ADI': value,
};

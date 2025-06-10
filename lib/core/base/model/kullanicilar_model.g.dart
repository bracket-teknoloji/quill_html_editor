// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kullanicilar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KullanicilarModel _$KullanicilarModelFromJson(Map<String, dynamic> json) =>
    _KullanicilarModel(
      kodu: json['KODU'] as String?,
      adi: json['ADI'] as String?,
    );

Map<String, dynamic> _$KullanicilarModelToJson(_KullanicilarModel instance) =>
    <String, dynamic>{
      if (instance.kodu case final value?) 'KODU': value,
      if (instance.adi case final value?) 'ADI': value,
    };

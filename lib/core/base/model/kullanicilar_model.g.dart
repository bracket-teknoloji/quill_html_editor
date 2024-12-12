// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kullanicilar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KullanicilarModelImpl _$$KullanicilarModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KullanicilarModelImpl(
      kodu: json['KODU'] as String?,
      adi: json['ADI'] as String?,
    );

Map<String, dynamic> _$$KullanicilarModelImplToJson(
        _$KullanicilarModelImpl instance) =>
    <String, dynamic>{
      if (instance.kodu case final value?) 'KODU': value,
      if (instance.adi case final value?) 'ADI': value,
    };

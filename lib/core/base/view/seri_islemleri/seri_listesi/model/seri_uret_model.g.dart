// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_uret_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeriUretModelImpl _$$SeriUretModelImplFromJson(Map<String, dynamic> json) =>
    _$SeriUretModelImpl(
      seriNo: json['SERI_NO'] as String?,
      stokKodu: json['STOK_KODU'] as String?,
      sonNo: (json['SON_NO'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SeriUretModelImplToJson(_$SeriUretModelImpl instance) =>
    <String, dynamic>{
      if (instance.seriNo case final value?) 'SERI_NO': value,
      if (instance.stokKodu case final value?) 'STOK_KODU': value,
      if (instance.sonNo case final value?) 'SON_NO': value,
    };

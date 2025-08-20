// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_uret_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeriUretModel _$SeriUretModelFromJson(Map<String, dynamic> json) =>
    _SeriUretModel(
      seriNo: json['SERI_NO'] as String?,
      stokKodu: json['STOK_KODU'] as String?,
      sonNo: (json['SON_NO'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SeriUretModelToJson(_SeriUretModel instance) =>
    <String, dynamic>{
      'SERI_NO': ?instance.seriNo,
      'STOK_KODU': ?instance.stokKodu,
      'SON_NO': ?instance.sonNo,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_hareketleri_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeriHareketleriRequestModelImpl _$$SeriHareketleriRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SeriHareketleriRequestModelImpl(
      stokKodu: json['StokKodu'] as String?,
      seriNo: json['SeriNo'] as String?,
      sirala: json['Sirala'] as String?,
    );

Map<String, dynamic> _$$SeriHareketleriRequestModelImplToJson(
        _$SeriHareketleriRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.stokKodu case final value?) 'StokKodu': value,
      if (instance.seriNo case final value?) 'SeriNo': value,
      if (instance.sirala case final value?) 'Sirala': value,
    };

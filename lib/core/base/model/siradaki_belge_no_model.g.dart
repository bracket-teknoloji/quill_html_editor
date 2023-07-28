// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siradaki_belge_no_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiradakiBelgeNoModel _$SiradakiBelgeNoModelFromJson(
        Map<String, dynamic> json) =>
    SiradakiBelgeNoModel(
      seri: json['Seri'] as String?,
      belgeTipi: json['BelgeTipi'] as String?,
      eIrsaliye: json['EIrsaliye'] as String?,
      cariKodu: json['CariKodu'] as String?,
      belgeNo: json['BelgeNo'] as String?,
    );

Map<String, dynamic> _$SiradakiBelgeNoModelToJson(
        SiradakiBelgeNoModel instance) =>
    <String, dynamic>{
      'Seri': instance.seri,
      'BelgeTipi': instance.belgeTipi,
      'EIrsaliye': instance.eIrsaliye,
      'CariKodu': instance.cariKodu,
      'BelgeNo': instance.belgeNo,
    };

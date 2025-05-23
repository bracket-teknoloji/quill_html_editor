// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siradaki_belge_no_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiradakiBelgeNoModel _$SiradakiBelgeNoModelFromJson(Map<String, dynamic> json) => SiradakiBelgeNoModel(
  seri: json['Seri'] as String?,
  belgeTipi: json['BelgeTipi'] as String?,
  eIrsaliye: json['EIrsaliye'] as String?,
  cariKodu: json['CariKodu'] as String?,
  belgeNo: json['BelgeNo'] as String?,
);

Map<String, dynamic> _$SiradakiBelgeNoModelToJson(SiradakiBelgeNoModel instance) => <String, dynamic>{
  if (instance.seri case final value?) 'Seri': value,
  if (instance.belgeTipi case final value?) 'BelgeTipi': value,
  if (instance.eIrsaliye case final value?) 'EIrsaliye': value,
  if (instance.cariKodu case final value?) 'CariKodu': value,
  if (instance.belgeNo case final value?) 'BelgeNo': value,
};

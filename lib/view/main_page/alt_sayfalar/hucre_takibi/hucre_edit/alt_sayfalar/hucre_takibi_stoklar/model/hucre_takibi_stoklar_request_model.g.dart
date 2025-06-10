// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_takibi_stoklar_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HucreTakibiStoklarRequestModel _$HucreTakibiStoklarRequestModelFromJson(
  Map<String, dynamic> json,
) => _HucreTakibiStoklarRequestModel(
  depoKodu: (json['DepoKodu'] as num?)?.toInt(),
  islemTuru: json['IslemTuru'] as String?,
  cariKodu: json['CariKodu'] as String?,
  pickerBelgeTuru: json['PickerBelgeTuru'] as String?,
  stokKodu: json['StokKodu'] as String?,
  belgeNo: json['BelgeNo'] as String?,
);

Map<String, dynamic> _$HucreTakibiStoklarRequestModelToJson(
  _HucreTakibiStoklarRequestModel instance,
) => <String, dynamic>{
  if (instance.depoKodu case final value?) 'DepoKodu': value,
  if (instance.islemTuru case final value?) 'IslemTuru': value,
  if (instance.cariKodu case final value?) 'CariKodu': value,
  if (instance.pickerBelgeTuru case final value?) 'PickerBelgeTuru': value,
  if (instance.stokKodu case final value?) 'StokKodu': value,
  if (instance.belgeNo case final value?) 'BelgeNo': value,
};

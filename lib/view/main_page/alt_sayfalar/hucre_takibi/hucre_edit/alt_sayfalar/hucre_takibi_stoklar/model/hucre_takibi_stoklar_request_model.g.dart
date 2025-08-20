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
  'DepoKodu': ?instance.depoKodu,
  'IslemTuru': ?instance.islemTuru,
  'CariKodu': ?instance.cariKodu,
  'PickerBelgeTuru': ?instance.pickerBelgeTuru,
  'StokKodu': ?instance.stokKodu,
  'BelgeNo': ?instance.belgeNo,
};

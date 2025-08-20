// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belge_rehberi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BelgeRehberiRequestModel _$BelgeRehberiRequestModelFromJson(
  Map<String, dynamic> json,
) => _BelgeRehberiRequestModel(
  depoKodu: (json['DepoKodu'] as num?)?.toInt(),
  islemTuru: json['IslemTuru'] as String?,
  pickerBelgeTuru: json['PickerBelgeTuru'] as String?,
  searchText: json['SearchText'] as String?,
);

Map<String, dynamic> _$BelgeRehberiRequestModelToJson(
  _BelgeRehberiRequestModel instance,
) => <String, dynamic>{
  'DepoKodu': ?instance.depoKodu,
  'IslemTuru': ?instance.islemTuru,
  'PickerBelgeTuru': ?instance.pickerBelgeTuru,
  'SearchText': ?instance.searchText,
};

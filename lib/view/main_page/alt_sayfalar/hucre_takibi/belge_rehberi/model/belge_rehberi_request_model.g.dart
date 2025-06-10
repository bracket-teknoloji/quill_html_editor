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
  if (instance.depoKodu case final value?) 'DepoKodu': value,
  if (instance.islemTuru case final value?) 'IslemTuru': value,
  if (instance.pickerBelgeTuru case final value?) 'PickerBelgeTuru': value,
  if (instance.searchText case final value?) 'SearchText': value,
};

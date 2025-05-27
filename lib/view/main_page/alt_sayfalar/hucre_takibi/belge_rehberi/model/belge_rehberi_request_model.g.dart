// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belge_rehberi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BelgeRehberiRequestModelImpl _$$BelgeRehberiRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BelgeRehberiRequestModelImpl(
      depoKodu: (json['DepoKodu'] as num?)?.toInt(),
      islemTuru: json['IslemTuru'] as String?,
      pickerBelgeTuru: json['PickerBelgeTuru'] as String?,
      searchText: json['SearchText'] as String?,
    );

Map<String, dynamic> _$$BelgeRehberiRequestModelImplToJson(
        _$BelgeRehberiRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.depoKodu case final value?) 'DepoKodu': value,
      if (instance.islemTuru case final value?) 'IslemTuru': value,
      if (instance.pickerBelgeTuru case final value?) 'PickerBelgeTuru': value,
      if (instance.searchText case final value?) 'SearchText': value,
    };

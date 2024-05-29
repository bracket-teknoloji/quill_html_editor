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
    _$BelgeRehberiRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DepoKodu', instance.depoKodu);
  writeNotNull('IslemTuru', instance.islemTuru);
  writeNotNull('PickerBelgeTuru', instance.pickerBelgeTuru);
  writeNotNull('SearchText', instance.searchText);
  return val;
}

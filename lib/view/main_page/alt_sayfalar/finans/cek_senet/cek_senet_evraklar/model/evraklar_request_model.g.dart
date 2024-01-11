// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evraklar_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EvraklarRequestModelImpl _$$EvraklarRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EvraklarRequestModelImpl(
      belgeTipi: json['BelgeTipi'] as String?,
      urlGetir: json['UrlGetir'] as String?,
      belgeNo: json['BelgeNo'] as String?,
    );

Map<String, dynamic> _$$EvraklarRequestModelImplToJson(
    _$EvraklarRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BelgeTipi', instance.belgeTipi);
  writeNotNull('UrlGetir', instance.urlGetir);
  writeNotNull('BelgeNo', instance.belgeNo);
  return val;
}

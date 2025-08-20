// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sayim_kalem_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SayimKalemRequestModel _$SayimKalemRequestModelFromJson(
  Map<String, dynamic> json,
) => _SayimKalemRequestModel(
  id: (json['ID'] as num?)?.toInt(),
  depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
  belgeNo: json['BELGE_NO'] as String?,
);

Map<String, dynamic> _$SayimKalemRequestModelToJson(
  _SayimKalemRequestModel instance,
) => <String, dynamic>{
  'ID': ?instance.id,
  'DEPO_KODU': ?instance.depoKodu,
  'BELGE_NO': ?instance.belgeNo,
};

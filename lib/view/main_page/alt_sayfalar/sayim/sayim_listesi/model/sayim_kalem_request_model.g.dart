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
  if (instance.id case final value?) 'ID': value,
  if (instance.depoKodu case final value?) 'DEPO_KODU': value,
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
};

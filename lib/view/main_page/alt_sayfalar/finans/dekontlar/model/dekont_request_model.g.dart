// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dekont_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DekontRequestModel _$DekontRequestModelFromJson(Map<String, dynamic> json) => _DekontRequestModel(
  sayfa: (json['Sayfa'] as num?)?.toInt(),
  ekranTipi: json['EkranTipi'] as String? ?? "L",
  searchText: json['SearchText'] as String?,
);

Map<String, dynamic> _$DekontRequestModelToJson(_DekontRequestModel instance) => <String, dynamic>{
  if (instance.sayfa case final value?) 'Sayfa': value,
  if (instance.ekranTipi case final value?) 'EkranTipi': value,
  if (instance.searchText case final value?) 'SearchText': value,
};

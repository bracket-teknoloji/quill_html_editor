// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dekont_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DekontRequestModel _$DekontRequestModelFromJson(Map<String, dynamic> json) =>
    _DekontRequestModel(
      sayfa: (json['Sayfa'] as num?)?.toInt(),
      ekranTipi: json['EkranTipi'] as String? ?? "L",
      searchText: json['SearchText'] as String?,
    );

Map<String, dynamic> _$DekontRequestModelToJson(_DekontRequestModel instance) =>
    <String, dynamic>{
      'Sayfa': ?instance.sayfa,
      'EkranTipi': ?instance.ekranTipi,
      'SearchText': ?instance.searchText,
    };

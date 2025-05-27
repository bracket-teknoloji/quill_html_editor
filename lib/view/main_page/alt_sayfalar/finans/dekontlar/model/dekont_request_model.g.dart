// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dekont_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DekontRequestModelImpl _$$DekontRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DekontRequestModelImpl(
      sayfa: (json['Sayfa'] as num?)?.toInt(),
      ekranTipi: json['EkranTipi'] as String? ?? "L",
      searchText: json['SearchText'] as String?,
    );

Map<String, dynamic> _$$DekontRequestModelImplToJson(
        _$DekontRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.sayfa case final value?) 'Sayfa': value,
      if (instance.ekranTipi case final value?) 'EkranTipi': value,
      if (instance.searchText case final value?) 'SearchText': value,
    };

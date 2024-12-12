// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ek_rehber_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EkRehberRequestModelImpl _$$EkRehberRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EkRehberRequestModelImpl(
      belgeNo: json['BelgeNo'] as String?,
      belgeTarihi: json['BelgeTarihi'] == null
          ? null
          : DateTime.parse(json['BelgeTarihi'] as String),
      belgeTipi: json['BelgeTipi'] as String?,
      cariKodu: json['CariKodu'] as String?,
      stokKodu: json['StokKodu'] as String?,
      id: (json['ID'] as num?)?.toInt(),
      rehberKodu: (json['RehberKodu'] as num?)?.toInt(),
      yapkod: json['Yapkod'] as String?,
      params: json['PARAMS'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$EkRehberRequestModelImplToJson(
        _$EkRehberRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.belgeNo case final value?) 'BelgeNo': value,
      if (instance.belgeTarihi?.toIso8601String() case final value?)
        'BelgeTarihi': value,
      if (instance.belgeTipi case final value?) 'BelgeTipi': value,
      if (instance.cariKodu case final value?) 'CariKodu': value,
      if (instance.stokKodu case final value?) 'StokKodu': value,
      if (instance.id case final value?) 'ID': value,
      if (instance.rehberKodu case final value?) 'RehberKodu': value,
      if (instance.yapkod case final value?) 'Yapkod': value,
      if (instance.params case final value?) 'PARAMS': value,
    };

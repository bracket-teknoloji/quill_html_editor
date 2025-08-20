// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_belge_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EBelgeRequestModel _$EBelgeRequestModelFromJson(Map<String, dynamic> json) =>
    _EBelgeRequestModel(
      basimDurumu: json['BasimDurumu'] as String?,
      baslamaTarihi: json['BaslamaTarihi'] as String?,
      bitisTarihi: json['BitisTarihi'] as String?,
      eBelgeTuru: json['EBelgeTuru'] as String?,
      islendi: json['Islendi'] as String?,
      kayitTarihineGore: json['KayitTarihineGore'] as bool?,
      kontrolEdildi: json['KontrolEdildi'] as String?,
      faturaYonu: json['FaturaYonu'] as String?,
      onayDurumu: json['OnayDurumu'] as String?,
      sayfa: (json['Sayfa'] as num?)?.toInt(),
      senaryo: json['Senaryo'] as String?,
      sirala: json['Sirala'] as String?,
      sorgulanmasin: json['Sorgulanmasin'] as bool?,
      searchText: json['SearchText'] as String?,
      taslak: json['Taslak'] as String?,
      resmiBelgeNo: json['ResmiBelgeNo'] as String?,
    );

Map<String, dynamic> _$EBelgeRequestModelToJson(_EBelgeRequestModel instance) =>
    <String, dynamic>{
      'BasimDurumu': ?instance.basimDurumu,
      'BaslamaTarihi': ?instance.baslamaTarihi,
      'BitisTarihi': ?instance.bitisTarihi,
      'EBelgeTuru': ?instance.eBelgeTuru,
      'Islendi': ?instance.islendi,
      'KayitTarihineGore': ?instance.kayitTarihineGore,
      'KontrolEdildi': ?instance.kontrolEdildi,
      'FaturaYonu': ?instance.faturaYonu,
      'OnayDurumu': ?instance.onayDurumu,
      'Sayfa': ?instance.sayfa,
      'Senaryo': ?instance.senaryo,
      'Sirala': ?instance.sirala,
      'Sorgulanmasin': ?instance.sorgulanmasin,
      'SearchText': ?instance.searchText,
      'Taslak': ?instance.taslak,
      'ResmiBelgeNo': ?instance.resmiBelgeNo,
    };

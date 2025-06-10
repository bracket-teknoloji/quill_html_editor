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

Map<String, dynamic> _$EBelgeRequestModelToJson(
  _EBelgeRequestModel instance,
) => <String, dynamic>{
  if (instance.basimDurumu case final value?) 'BasimDurumu': value,
  if (instance.baslamaTarihi case final value?) 'BaslamaTarihi': value,
  if (instance.bitisTarihi case final value?) 'BitisTarihi': value,
  if (instance.eBelgeTuru case final value?) 'EBelgeTuru': value,
  if (instance.islendi case final value?) 'Islendi': value,
  if (instance.kayitTarihineGore case final value?) 'KayitTarihineGore': value,
  if (instance.kontrolEdildi case final value?) 'KontrolEdildi': value,
  if (instance.faturaYonu case final value?) 'FaturaYonu': value,
  if (instance.onayDurumu case final value?) 'OnayDurumu': value,
  if (instance.sayfa case final value?) 'Sayfa': value,
  if (instance.senaryo case final value?) 'Senaryo': value,
  if (instance.sirala case final value?) 'Sirala': value,
  if (instance.sorgulanmasin case final value?) 'Sorgulanmasin': value,
  if (instance.searchText case final value?) 'SearchText': value,
  if (instance.taslak case final value?) 'Taslak': value,
  if (instance.resmiBelgeNo case final value?) 'ResmiBelgeNo': value,
};

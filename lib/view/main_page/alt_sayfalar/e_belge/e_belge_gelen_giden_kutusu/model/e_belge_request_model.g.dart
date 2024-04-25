// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_belge_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EBelgeRequestModelImpl _$$EBelgeRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EBelgeRequestModelImpl(
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

Map<String, dynamic> _$$EBelgeRequestModelImplToJson(
    _$EBelgeRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BasimDurumu', instance.basimDurumu);
  writeNotNull('BaslamaTarihi', instance.baslamaTarihi);
  writeNotNull('BitisTarihi', instance.bitisTarihi);
  writeNotNull('EBelgeTuru', instance.eBelgeTuru);
  writeNotNull('Islendi', instance.islendi);
  writeNotNull('KayitTarihineGore', instance.kayitTarihineGore);
  writeNotNull('KontrolEdildi', instance.kontrolEdildi);
  writeNotNull('FaturaYonu', instance.faturaYonu);
  writeNotNull('OnayDurumu', instance.onayDurumu);
  writeNotNull('Sayfa', instance.sayfa);
  writeNotNull('Senaryo', instance.senaryo);
  writeNotNull('Sirala', instance.sirala);
  writeNotNull('Sorgulanmasin', instance.sorgulanmasin);
  writeNotNull('SearchText', instance.searchText);
  writeNotNull('Taslak', instance.taslak);
  writeNotNull('ResmiBelgeNo', instance.resmiBelgeNo);
  return val;
}

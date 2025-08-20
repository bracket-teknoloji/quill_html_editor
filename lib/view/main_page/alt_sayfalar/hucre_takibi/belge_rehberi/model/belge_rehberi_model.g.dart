// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belge_rehberi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BelgeRehberiModel _$BelgeRehberiModelFromJson(Map<String, dynamic> json) =>
    _BelgeRehberiModel(
      belgeNo: json['BELGE_NO'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
      cariAdi: json['CARI_ADI'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      depoTanimi: json['DEPO_TANIMI'] as String?,
      kalemSayisi: (json['KALEM_SAYISI'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BelgeRehberiModelToJson(_BelgeRehberiModel instance) =>
    <String, dynamic>{
      'BELGE_NO': ?instance.belgeNo,
      'BELGE_TIPI': ?instance.belgeTipi,
      'CARI_KODU': ?instance.cariKodu,
      'CARI_ADI': ?instance.cariAdi,
      'TARIH': ?instance.tarih?.toIso8601String(),
      'DEPO_KODU': ?instance.depoKodu,
      'DEPO_TANIMI': ?instance.depoTanimi,
      'KALEM_SAYISI': ?instance.kalemSayisi,
    };

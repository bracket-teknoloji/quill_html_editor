// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belge_rehberi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BelgeRehberiModelImpl _$$BelgeRehberiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BelgeRehberiModelImpl(
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

Map<String, dynamic> _$$BelgeRehberiModelImplToJson(
        _$BelgeRehberiModelImpl instance) =>
    <String, dynamic>{
      if (instance.belgeNo case final value?) 'BELGE_NO': value,
      if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
      if (instance.cariKodu case final value?) 'CARI_KODU': value,
      if (instance.cariAdi case final value?) 'CARI_ADI': value,
      if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
      if (instance.depoKodu case final value?) 'DEPO_KODU': value,
      if (instance.depoTanimi case final value?) 'DEPO_TANIMI': value,
      if (instance.kalemSayisi case final value?) 'KALEM_SAYISI': value,
    };

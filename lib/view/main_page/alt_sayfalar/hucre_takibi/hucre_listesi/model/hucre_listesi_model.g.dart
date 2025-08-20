// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HucreListesiModel _$HucreListesiModelFromJson(Map<String, dynamic> json) =>
    _HucreListesiModel(
      hucreKodu: json['HUCRE_KODU'] as String?,
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      depoTanimi: json['DEPO_TANIMI'] as String?,
      seriList: json['SeriList'] as List<dynamic>?,
      eksiyeDusebilir: json['EKSIYE_DUSEBILIR'] as bool?,
      netMiktar: (json['NET_MIKTAR'] as num?)?.toInt(),
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
    );

Map<String, dynamic> _$HucreListesiModelToJson(_HucreListesiModel instance) =>
    <String, dynamic>{
      'HUCRE_KODU': ?instance.hucreKodu,
      'DEPO_KODU': ?instance.depoKodu,
      'DEPO_TANIMI': ?instance.depoTanimi,
      'SeriList': ?instance.seriList,
      'EKSIYE_DUSEBILIR': ?instance.eksiyeDusebilir,
      'NET_MIKTAR': ?instance.netMiktar,
      'STOK_KODU': ?instance.stokKodu,
      'STOK_ADI': ?instance.stokAdi,
    };

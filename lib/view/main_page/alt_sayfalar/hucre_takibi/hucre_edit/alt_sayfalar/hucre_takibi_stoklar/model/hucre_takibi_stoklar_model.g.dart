// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_takibi_stoklar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HucreTakibiStoklarModel _$HucreTakibiStoklarModelFromJson(
  Map<String, dynamic> json,
) => _HucreTakibiStoklarModel(
  stokKodu: json['STOK_KODU'] as String?,
  stokAdi: json['STOK_ADI'] as String?,
  miktar: (json['MIKTAR'] as num?)?.toDouble(),
  netMiktar: (json['NET_MIKTAR'] as num?)?.toDouble(),
  bakiye: (json['BAKIYE'] as num?)?.toDouble(),
  belgeOlcuBirimKodu: (json['BELGE_OLCU_BIRIM_KODU'] as num?)?.toInt(),
  belgeOlcuBirimAdi: json['BELGE_OLCU_BIRIM_ADI'] as String?,
  stokOlcuBirimi1: json['STOK_OLCU_BIRIMI1'] as String?,
  kalemSayisi: (json['KALEM_SAYISI'] as num?)?.toInt(),
  hucreKodu: json['HUCRE_KODU'] as String?,
  depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
  yapkod: json['YAPKOD'] as String?,
  yapacik: json['YAPACIK'] as String?,
  olcuBirimi: json['OLCU_BIRIMI'] as String?,
  depoTanimi: json['DEPO_TANIMI'] as String?,
  seriList: (json['SERI_LIST'] as List<dynamic>?)
      ?.map((e) => SeriList.fromJson(e as Map<String, dynamic>))
      .toList(),
  eksiyeDusebilir: json['EKSIYE_DUSEBILIR'] as bool?,
  paketKodu: json['PAKET_KODU'] as String?,
);

Map<String, dynamic> _$HucreTakibiStoklarModelToJson(
  _HucreTakibiStoklarModel instance,
) => <String, dynamic>{
  'STOK_KODU': ?instance.stokKodu,
  'STOK_ADI': ?instance.stokAdi,
  'MIKTAR': ?instance.miktar,
  'NET_MIKTAR': ?instance.netMiktar,
  'BAKIYE': ?instance.bakiye,
  'BELGE_OLCU_BIRIM_KODU': ?instance.belgeOlcuBirimKodu,
  'BELGE_OLCU_BIRIM_ADI': ?instance.belgeOlcuBirimAdi,
  'STOK_OLCU_BIRIMI1': ?instance.stokOlcuBirimi1,
  'KALEM_SAYISI': ?instance.kalemSayisi,
  'HUCRE_KODU': ?instance.hucreKodu,
  'DEPO_KODU': ?instance.depoKodu,
  'YAPKOD': ?instance.yapkod,
  'YAPACIK': ?instance.yapacik,
  'OLCU_BIRIMI': ?instance.olcuBirimi,
  'DEPO_TANIMI': ?instance.depoTanimi,
  'SERI_LIST': ?instance.seriList?.map((e) => e.toJson()).toList(),
  'EKSIYE_DUSEBILIR': ?instance.eksiyeDusebilir,
  'PAKET_KODU': ?instance.paketKodu,
};

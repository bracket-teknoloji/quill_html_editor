// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucredeki_stoklar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HucredekiStoklarModel _$HucredekiStoklarModelFromJson(
  Map<String, dynamic> json,
) => _HucredekiStoklarModel(
  hucreKodu: json['HUCRE_KODU'] as String?,
  depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
  stokKodu: json['STOK_KODU'] as String?,
  stokAdi: json['STOK_ADI'] as String?,
  netMiktar: (json['NET_MIKTAR'] as num?)?.toDouble(),
  yapkod: json['YAPKOD'] as String?,
  yapacik: json['YAPACIK'] as String?,
  bakiye: (json['BAKIYE'] as num?)?.toDouble(),
  miktar: (json['MIKTAR'] as num?)?.toDouble(),
  olcuBirimi: json['OLCU_BIRIMI'] as String?,
);

Map<String, dynamic> _$HucredekiStoklarModelToJson(
  _HucredekiStoklarModel instance,
) => <String, dynamic>{
  'HUCRE_KODU': ?instance.hucreKodu,
  'DEPO_KODU': ?instance.depoKodu,
  'STOK_KODU': ?instance.stokKodu,
  'STOK_ADI': ?instance.stokAdi,
  'NET_MIKTAR': ?instance.netMiktar,
  'YAPKOD': ?instance.yapkod,
  'YAPACIK': ?instance.yapacik,
  'BAKIYE': ?instance.bakiye,
  'MIKTAR': ?instance.miktar,
  'OLCU_BIRIMI': ?instance.olcuBirimi,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_stok_satis_ozeti_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariStokSatisOzetiModel _$CariStokSatisOzetiModelFromJson(
  Map<String, dynamic> json,
) => CariStokSatisOzetiModel()
  ..stokKodu = json['STOK_KODU'] as String?
  ..miktar = (json['MIKTAR'] as num?)?.toDouble()
  ..tarih = json['TARIH'] == null
      ? null
      : DateTime.parse(json['TARIH'] as String)
  ..stokAdi = json['STOK_ADI'] as String?
  ..olcuBirimAdi = json['OLCU_BIRIM_ADI'] as String?
  ..netTutar = (json['NET_TUTAR'] as num?)?.toDouble()
  ..belgeTipi = json['BELGE_TIPI'] as String?
  ..dovizTipi = (json['DOVIZ_TIPI'] as num?)?.toInt()
  ..dovNetTutar = (json['DOV_NET_TUTAR'] as num?)?.toDouble()
  ..dovBrutTutar = (json['DOV_BRUT_TUTAR'] as num?)?.toDouble()
  ..dovizKuru = (json['DOVIZ_KURU'] as num?)?.toDouble()
  ..dovizAdi = json['DOVIZ_ADI'] as String?
  ..dovizSimge = json['DOVIZ_SIMGE'] as String?;

Map<String, dynamic> _$CariStokSatisOzetiModelToJson(
  CariStokSatisOzetiModel instance,
) => <String, dynamic>{
  'STOK_KODU': ?instance.stokKodu,
  'MIKTAR': ?instance.miktar,
  'TARIH': ?instance.tarih?.toIso8601String(),
  'STOK_ADI': ?instance.stokAdi,
  'OLCU_BIRIM_ADI': ?instance.olcuBirimAdi,
  'NET_TUTAR': ?instance.netTutar,
  'BELGE_TIPI': ?instance.belgeTipi,
  'DOVIZ_TIPI': ?instance.dovizTipi,
  'DOV_NET_TUTAR': ?instance.dovNetTutar,
  'DOV_BRUT_TUTAR': ?instance.dovBrutTutar,
  'DOVIZ_KURU': ?instance.dovizKuru,
  'DOVIZ_ADI': ?instance.dovizAdi,
  'DOVIZ_SIMGE': ?instance.dovizSimge,
};

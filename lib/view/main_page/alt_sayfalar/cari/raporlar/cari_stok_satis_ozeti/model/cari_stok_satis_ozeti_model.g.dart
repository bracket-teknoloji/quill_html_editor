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
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
  if (instance.miktar case final value?) 'MIKTAR': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
  if (instance.stokAdi case final value?) 'STOK_ADI': value,
  if (instance.olcuBirimAdi case final value?) 'OLCU_BIRIM_ADI': value,
  if (instance.netTutar case final value?) 'NET_TUTAR': value,
  if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
  if (instance.dovizTipi case final value?) 'DOVIZ_TIPI': value,
  if (instance.dovNetTutar case final value?) 'DOV_NET_TUTAR': value,
  if (instance.dovBrutTutar case final value?) 'DOV_BRUT_TUTAR': value,
  if (instance.dovizKuru case final value?) 'DOVIZ_KURU': value,
  if (instance.dovizAdi case final value?) 'DOVIZ_ADI': value,
  if (instance.dovizSimge case final value?) 'DOVIZ_SIMGE': value,
};

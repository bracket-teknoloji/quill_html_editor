// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barkod_tanimla_kayitlari_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BarkodTanimlaKayitlariModel _$BarkodTanimlaKayitlariModelFromJson(
  Map<String, dynamic> json,
) => _BarkodTanimlaKayitlariModel(
  stokKodu: json['STOK_KODU'] as String?,
  barkod: json['BARKOD'] as String?,
  birim: (json['BIRIM'] as num?)?.toInt(),
  kilit: json['KILIT'] as String?,
  aciklama: json['ACIKLAMA'] as String?,
  birimAdi: json['BIRIM_ADI'] as String?,
  barkodTipi: json['BARKOD_TIPI'] as String?,
  barkodTipiAdi: json['BARKOD_TIPI_ADI'] as String?,
  birimPay: (json['BIRIM_PAY'] as num?)?.toDouble(),
  birimPayda: (json['BIRIM_PAYDA'] as num?)?.toDouble(),
  stokBirim1Adi: json['STOK_BIRIM1_ADI'] as String?,
);

Map<String, dynamic> _$BarkodTanimlaKayitlariModelToJson(
  _BarkodTanimlaKayitlariModel instance,
) => <String, dynamic>{
  'STOK_KODU': ?instance.stokKodu,
  'BARKOD': ?instance.barkod,
  'BIRIM': ?instance.birim,
  'KILIT': ?instance.kilit,
  'ACIKLAMA': ?instance.aciklama,
  'BIRIM_ADI': ?instance.birimAdi,
  'BARKOD_TIPI': ?instance.barkodTipi,
  'BARKOD_TIPI_ADI': ?instance.barkodTipiAdi,
  'BIRIM_PAY': ?instance.birimPay,
  'BIRIM_PAYDA': ?instance.birimPayda,
  'STOK_BIRIM1_ADI': ?instance.stokBirim1Adi,
};

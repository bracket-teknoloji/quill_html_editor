// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_fiyat_ozeti_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StokFiyatOzetiModel _$StokFiyatOzetiModelFromJson(Map<String, dynamic> json) =>
    _StokFiyatOzetiModel(
      sira: (json['SIRA'] as num?)?.toInt(),
      grup: json['GRUP'] as String?,
      tip: json['TIP'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
      cariAdi: json['CARI_ADI'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      fiyat: (json['FIYAT'] as num?)?.toDouble(),
      dovizFiyati: (json['DOVIZ_FIYATI'] as num?)?.toDouble(),
      dovizAdi: json['DOVIZ_ADI'] as String?,
      dovizTipi: (json['DOVIZ_TIPI'] as num?)?.toInt(),
      brutFiyat: (json['BRUT_FIYAT'] as num?)?.toDouble(),
      brutDovizFiyati: (json['BRUT_DOVIZ_FIYATI'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StokFiyatOzetiModelToJson(
  _StokFiyatOzetiModel instance,
) => <String, dynamic>{
  'SIRA': ?instance.sira,
  'GRUP': ?instance.grup,
  'TIP': ?instance.tip,
  'CARI_KODU': ?instance.cariKodu,
  'CARI_ADI': ?instance.cariAdi,
  'TARIH': ?instance.tarih?.toIso8601String(),
  'FIYAT': ?instance.fiyat,
  'DOVIZ_FIYATI': ?instance.dovizFiyati,
  'DOVIZ_ADI': ?instance.dovizAdi,
  'DOVIZ_TIPI': ?instance.dovizTipi,
  'BRUT_FIYAT': ?instance.brutFiyat,
  'BRUT_DOVIZ_FIYATI': ?instance.brutDovizFiyati,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_fiyati_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StokFiyatiModel _$StokFiyatiModelFromJson(Map<String, dynamic> json) =>
    _StokFiyatiModel(
      fiyat: (json['FIYAT'] as num?)?.toDouble(),
      yer: json['YER'] as String?,
      fiyatSirasi: (json['FIYAT_SIRASI'] as num?)?.toInt(),
      stokKodu: json['STOK_KODU'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
    );

Map<String, dynamic> _$StokFiyatiModelToJson(_StokFiyatiModel instance) =>
    <String, dynamic>{
      'FIYAT': ?instance.fiyat,
      'YER': ?instance.yer,
      'FIYAT_SIRASI': ?instance.fiyatSirasi,
      'STOK_KODU': ?instance.stokKodu,
      'CARI_KODU': ?instance.cariKodu,
      'TARIH': ?instance.tarih?.toIso8601String(),
    };

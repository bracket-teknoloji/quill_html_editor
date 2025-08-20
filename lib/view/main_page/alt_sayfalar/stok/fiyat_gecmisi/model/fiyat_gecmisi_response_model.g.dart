// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fiyat_gecmisi_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FiyatGecmisiResponseModel _$FiyatGecmisiResponseModelFromJson(
  Map<String, dynamic> json,
) => FiyatGecmisiResponseModel()
  ..id = (json['ID'] as num?)?.toInt()
  ..subeKodu = (json['SUBE_KODU'] as num?)?.toInt()
  ..stokKodu = json['STOK_KODU'] as String?
  ..stokAdi = json['STOK_ADI'] as String?
  ..yer = json['YER'] as String?
  ..aS = json['A_S'] as String?
  ..fiyat = (json['FIYAT'] as num?)?.toDouble()
  ..dovizFiyati = (json['DOVIZ_FIYATI'] as num?)?.toDouble()
  ..dovizTipi = (json['DOVIZ_TIPI'] as num?)?.toInt()
  ..fiyatSirasi = (json['FIYAT_SIRASI'] as num?)?.toInt()
  ..tarih = json['TARIH'] == null
      ? null
      : DateTime.parse(json['TARIH'] as String)
  ..fiyatTipi = json['FIYAT_TIPI'] as String?
  ..dovizAdi = json['DOVIZ_ADI'] as String?
  ..yapkod = json['YAPKOD'] as String?
  ..yazdirankul = json['YAZDIRANKUL'] as String?
  ..yazdirmatarihi = json['YAZDIRMATARIHI'] == null
      ? null
      : DateTime.parse(json['YAZDIRMATARIHI'] as String)
  ..yazdirildi = json['YAZDIRILDI'] as String?;

Map<String, dynamic> _$FiyatGecmisiResponseModelToJson(
  FiyatGecmisiResponseModel instance,
) => <String, dynamic>{
  'ID': ?instance.id,
  'SUBE_KODU': ?instance.subeKodu,
  'STOK_KODU': ?instance.stokKodu,
  'STOK_ADI': ?instance.stokAdi,
  'YER': ?instance.yer,
  'A_S': ?instance.aS,
  'FIYAT': ?instance.fiyat,
  'DOVIZ_FIYATI': ?instance.dovizFiyati,
  'DOVIZ_TIPI': ?instance.dovizTipi,
  'FIYAT_SIRASI': ?instance.fiyatSirasi,
  'TARIH': ?instance.tarih?.toIso8601String(),
  'FIYAT_TIPI': ?instance.fiyatTipi,
  'DOVIZ_ADI': ?instance.dovizAdi,
  'YAPKOD': ?instance.yapkod,
  'YAZDIRANKUL': ?instance.yazdirankul,
  'YAZDIRMATARIHI': ?instance.yazdirmatarihi?.toIso8601String(),
  'YAZDIRILDI': ?instance.yazdirildi,
};

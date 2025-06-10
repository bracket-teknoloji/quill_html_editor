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
  if (instance.id case final value?) 'ID': value,
  if (instance.subeKodu case final value?) 'SUBE_KODU': value,
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
  if (instance.stokAdi case final value?) 'STOK_ADI': value,
  if (instance.yer case final value?) 'YER': value,
  if (instance.aS case final value?) 'A_S': value,
  if (instance.fiyat case final value?) 'FIYAT': value,
  if (instance.dovizFiyati case final value?) 'DOVIZ_FIYATI': value,
  if (instance.dovizTipi case final value?) 'DOVIZ_TIPI': value,
  if (instance.fiyatSirasi case final value?) 'FIYAT_SIRASI': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
  if (instance.fiyatTipi case final value?) 'FIYAT_TIPI': value,
  if (instance.dovizAdi case final value?) 'DOVIZ_ADI': value,
  if (instance.yapkod case final value?) 'YAPKOD': value,
  if (instance.yazdirankul case final value?) 'YAZDIRANKUL': value,
  if (instance.yazdirmatarihi?.toIso8601String() case final value?)
    'YAZDIRMATARIHI': value,
  if (instance.yazdirildi case final value?) 'YAZDIRILDI': value,
};

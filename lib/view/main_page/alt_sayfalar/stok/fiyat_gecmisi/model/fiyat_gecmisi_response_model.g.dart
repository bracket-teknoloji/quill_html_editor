// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fiyat_gecmisi_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FiyatGecmisiResponseModel _$FiyatGecmisiResponseModelFromJson(
        Map<String, dynamic> json) =>
    FiyatGecmisiResponseModel()
      ..id = json['ID'] as int?
      ..subeKodu = json['SUBE_KODU'] as int?
      ..stokKodu = json['STOK_KODU'] as String?
      ..stokAdi = json['STOK_ADI'] as String?
      ..yer = json['YER'] as String?
      ..aS = json['A_S'] as String?
      ..fiyat = (json['FIYAT'] as num?)?.toDouble()
      ..dovizFiyati = (json['DOVIZ_FIYATI'] as num?)?.toDouble()
      ..dovizTipi = json['DOVIZ_TIPI'] as int?
      ..fiyatSirasi = json['FIYAT_SIRASI'] as int?
      ..tarih =
          json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String)
      ..fiyatTipi = json['FIYAT_TIPI'] as String?
      ..dovizAdi = json['DOVIZ_ADI'] as String?
      ..yapkod = json['YAPKOD'] as String?;

Map<String, dynamic> _$FiyatGecmisiResponseModelToJson(
    FiyatGecmisiResponseModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.id);
  writeNotNull('SUBE_KODU', instance.subeKodu);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('YER', instance.yer);
  writeNotNull('A_S', instance.aS);
  writeNotNull('FIYAT', instance.fiyat);
  writeNotNull('DOVIZ_FIYATI', instance.dovizFiyati);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('FIYAT_SIRASI', instance.fiyatSirasi);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('FIYAT_TIPI', instance.fiyatTipi);
  writeNotNull('DOVIZ_ADI', instance.dovizAdi);
  writeNotNull('YAPKOD', instance.yapkod);
  return val;
}

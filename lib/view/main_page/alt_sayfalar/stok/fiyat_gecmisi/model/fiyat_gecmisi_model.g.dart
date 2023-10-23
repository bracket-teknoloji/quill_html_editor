// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fiyat_gecmisi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FiyatGecmisiModel _$FiyatGecmisiModelFromJson(Map<String, dynamic> json) => FiyatGecmisiModel()
  ..alisSatis = json['AlisSatis'] as String?
  ..baslamaTarihi = json['BaslamaTarihi'] as String?
  ..bitisTarihi = json['BitisTarihi'] as String?
  ..ekranTipi = json['EkranTipi'] as String?
  ..sirala = json['Sirala'] as String?
  ..yazdirildi = json['Yazdirildi'] as String?
  ..fiyatTipi = json['FiyatTipi'] as String?;

Map<String, dynamic> _$FiyatGecmisiModelToJson(FiyatGecmisiModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AlisSatis', instance.alisSatis);
  writeNotNull('BaslamaTarihi', instance.baslamaTarihi);
  writeNotNull('BitisTarihi', instance.bitisTarihi);
  writeNotNull('EkranTipi', instance.ekranTipi);
  writeNotNull('Sirala', instance.sirala);
  writeNotNull('Yazdirildi', instance.yazdirildi);
  writeNotNull('FiyatTipi', instance.fiyatTipi);
  return val;
}

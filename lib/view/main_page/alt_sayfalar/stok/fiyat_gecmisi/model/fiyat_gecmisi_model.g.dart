// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fiyat_gecmisi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FiyatGecmisiModel _$FiyatGecmisiModelFromJson(Map<String, dynamic> json) =>
    FiyatGecmisiModel()
      ..alisSatis = json['AlisSatis'] as String?
      ..baslamaTarihi = json['BaslamaTarihi'] as String?
      ..bitisTarihi = json['BitisTarihi'] as String?
      ..ekranTipi = json['EkranTipi'] as String?
      ..sirala = json['Sirala'] as String?
      ..yazdirildi = json['Yazdirildi'] as String?
      ..fiyatTipi = json['FiyatTipi'] as String?;

Map<String, dynamic> _$FiyatGecmisiModelToJson(FiyatGecmisiModel instance) =>
    <String, dynamic>{
      'AlisSatis': ?instance.alisSatis,
      'BaslamaTarihi': ?instance.baslamaTarihi,
      'BitisTarihi': ?instance.bitisTarihi,
      'EkranTipi': ?instance.ekranTipi,
      'Sirala': ?instance.sirala,
      'Yazdirildi': ?instance.yazdirildi,
      'FiyatTipi': ?instance.fiyatTipi,
    };

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
      if (instance.alisSatis case final value?) 'AlisSatis': value,
      if (instance.baslamaTarihi case final value?) 'BaslamaTarihi': value,
      if (instance.bitisTarihi case final value?) 'BitisTarihi': value,
      if (instance.ekranTipi case final value?) 'EkranTipi': value,
      if (instance.sirala case final value?) 'Sirala': value,
      if (instance.yazdirildi case final value?) 'Yazdirildi': value,
      if (instance.fiyatTipi case final value?) 'FiyatTipi': value,
    };

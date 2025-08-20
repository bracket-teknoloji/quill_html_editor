// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fiyat_gor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FiyatGorModel _$FiyatGorModelFromJson(Map<String, dynamic> json) =>
    FiyatGorModel()
      ..stokKodu = json['STOK_KODU'] as String?
      ..aS = json['A_S'] as String?
      ..dovizTipi = (json['DOVIZ_TIPI'] as num?)?.toInt()
      ..fiyat1 = (json['FIYAT1'] as num?)?.toDouble()
      ..fiyat2 = (json['FIYAT2'] as num?)?.toDouble()
      ..fiyat3 = (json['FIYAT3'] as num?)?.toDouble()
      ..fiyat4 = (json['FIYAT4'] as num?)?.toDouble()
      ..kdvOrani = (json['KDV_ORANI'] as num?)?.toDouble();

Map<String, dynamic> _$FiyatGorModelToJson(FiyatGorModel instance) =>
    <String, dynamic>{
      'STOK_KODU': ?instance.stokKodu,
      'A_S': ?instance.aS,
      'DOVIZ_TIPI': ?instance.dovizTipi,
      'FIYAT1': ?instance.fiyat1,
      'FIYAT2': ?instance.fiyat2,
      'FIYAT3': ?instance.fiyat3,
      'FIYAT4': ?instance.fiyat4,
      'KDV_ORANI': ?instance.kdvOrani,
    };

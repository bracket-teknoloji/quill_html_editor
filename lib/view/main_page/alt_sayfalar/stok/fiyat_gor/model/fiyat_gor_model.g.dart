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
      if (instance.stokKodu case final value?) 'STOK_KODU': value,
      if (instance.aS case final value?) 'A_S': value,
      if (instance.dovizTipi case final value?) 'DOVIZ_TIPI': value,
      if (instance.fiyat1 case final value?) 'FIYAT1': value,
      if (instance.fiyat2 case final value?) 'FIYAT2': value,
      if (instance.fiyat3 case final value?) 'FIYAT3': value,
      if (instance.fiyat4 case final value?) 'FIYAT4': value,
      if (instance.kdvOrani case final value?) 'KDV_ORANI': value,
    };

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

Map<String, dynamic> _$FiyatGorModelToJson(FiyatGorModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('A_S', instance.aS);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('FIYAT1', instance.fiyat1);
  writeNotNull('FIYAT2', instance.fiyat2);
  writeNotNull('FIYAT3', instance.fiyat3);
  writeNotNull('FIYAT4', instance.fiyat4);
  writeNotNull('KDV_ORANI', instance.kdvOrani);
  return val;
}

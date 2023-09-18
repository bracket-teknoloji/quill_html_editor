// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ulke_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UlkeModel _$UlkeModelFromJson(Map<String, dynamic> json) => UlkeModel()
  ..ulkeKodu = json['ULKE_KODU'] as String?
  ..ulkeAdi = json['ULKE_ADI'] as String?;

Map<String, dynamic> _$UlkeModelToJson(UlkeModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ULKE_KODU', instance.ulkeKodu);
  writeNotNull('ULKE_ADI', instance.ulkeAdi);
  return val;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'stok_muhasebe_kodu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokMuhasebeKoduModel _$StokMuhasebeKoduModelFromJson(
        Map<String, dynamic> json) =>
    StokMuhasebeKoduModel()
      ..muhKodu = json['MUH_KODU'] as int?
      ..adi = json['ADI'] as String?
      ..alisHesabi = json['ALIS_HESABI'] as String?
      ..satisHesabi = json['SATIS_HESABI'] as String?;

Map<String, dynamic> _$StokMuhasebeKoduModelToJson(
    StokMuhasebeKoduModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MUH_KODU', instance.muhKodu);
  writeNotNull('ADI', instance.adi);
  writeNotNull('ALIS_HESABI', instance.alisHesabi);
  writeNotNull('SATIS_HESABI', instance.satisHesabi);
  return val;
}

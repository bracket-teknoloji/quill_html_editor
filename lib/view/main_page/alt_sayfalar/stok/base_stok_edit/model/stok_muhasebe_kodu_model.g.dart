// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'stok_muhasebe_kodu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokMuhasebeKoduModel _$StokMuhasebeKoduModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'StokMuhasebeKoduModel',
      json,
      ($checkedConvert) {
        final val = StokMuhasebeKoduModel();
        $checkedConvert('MUH_KODU', (v) => val.muhKodu = v as int?);
        $checkedConvert('ADI', (v) => val.adi = v as String?);
        $checkedConvert('ALIS_HESABI', (v) => val.alisHesabi = v as String?);
        $checkedConvert('SATIS_HESABI', (v) => val.satisHesabi = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'muhKodu': 'MUH_KODU',
        'adi': 'ADI',
        'alisHesabi': 'ALIS_HESABI',
        'satisHesabi': 'SATIS_HESABI'
      },
    );

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

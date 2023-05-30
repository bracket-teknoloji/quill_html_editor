// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'stok_olcu_birimleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokOlcuBirimleriModel _$StokOlcuBirimleriModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'StokOlcuBirimleriModel',
      json,
      ($checkedConvert) {
        final val = StokOlcuBirimleriModel();
        $checkedConvert('BIRIM_NO', (v) => val.birimNo = v as int?);
        $checkedConvert('OLCU_BIRIMI', (v) => val.olcuBirimi = v as String?);
        return val;
      },
      fieldKeyMap: const {'birimNo': 'BIRIM_NO', 'olcuBirimi': 'OLCU_BIRIMI'},
    );

Map<String, dynamic> _$StokOlcuBirimleriModelToJson(
    StokOlcuBirimleriModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BIRIM_NO', instance.birimNo);
  writeNotNull('OLCU_BIRIMI', instance.olcuBirimi);
  return val;
}

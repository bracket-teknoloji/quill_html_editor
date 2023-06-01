// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'stok_olcu_birimleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokOlcuBirimleriModel _$StokOlcuBirimleriModelFromJson(
        Map<String, dynamic> json) =>
    StokOlcuBirimleriModel()
      ..birimNo = json['BIRIM_NO'] as int?
      ..olcuBirimi = json['OLCU_BIRIMI'] as String?;

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

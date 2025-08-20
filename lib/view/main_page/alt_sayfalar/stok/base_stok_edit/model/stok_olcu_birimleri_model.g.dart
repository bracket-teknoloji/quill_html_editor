// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_olcu_birimleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokOlcuBirimleriModel _$StokOlcuBirimleriModelFromJson(
  Map<String, dynamic> json,
) => StokOlcuBirimleriModel()
  ..birimNo = (json['BIRIM_NO'] as num?)?.toInt()
  ..olcuBirimi = json['OLCU_BIRIMI'] as String?;

Map<String, dynamic> _$StokOlcuBirimleriModelToJson(
  StokOlcuBirimleriModel instance,
) => <String, dynamic>{
  'BIRIM_NO': ?instance.birimNo,
  'OLCU_BIRIMI': ?instance.olcuBirimi,
};

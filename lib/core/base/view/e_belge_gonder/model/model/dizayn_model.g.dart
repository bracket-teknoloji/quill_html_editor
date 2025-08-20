// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dizayn_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DizaynModel _$DizaynModelFromJson(Map<String, dynamic> json) => DizaynModel(
  id: (json['ID'] as num?)?.toInt(),
  dizaynAdi: json['DIZAYN_ADI'] as String?,
  modulId: (json['MODUL_ID'] as num?)?.toInt(),
  dizaynKodu: json['DIZAYN_KODU'] as String?,
  erpDizayni: json['ERP_DIZAYNI'] as String?,
  varsayilanMi: json['VARSAYILAN_MI'] as bool?,
);

Map<String, dynamic> _$DizaynModelToJson(DizaynModel instance) =>
    <String, dynamic>{
      'ID': ?instance.id,
      'DIZAYN_ADI': ?instance.dizaynAdi,
      'MODUL_ID': ?instance.modulId,
      'DIZAYN_KODU': ?instance.dizaynKodu,
      'ERP_DIZAYNI': ?instance.erpDizayni,
      'VARSAYILAN_MI': ?instance.varsayilanMi,
    };

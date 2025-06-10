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
      if (instance.id case final value?) 'ID': value,
      if (instance.dizaynAdi case final value?) 'DIZAYN_ADI': value,
      if (instance.modulId case final value?) 'MODUL_ID': value,
      if (instance.dizaynKodu case final value?) 'DIZAYN_KODU': value,
      if (instance.erpDizayni case final value?) 'ERP_DIZAYNI': value,
      if (instance.varsayilanMi case final value?) 'VARSAYILAN_MI': value,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dizayn_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DizaynModel _$DizaynModelFromJson(Map<String, dynamic> json) => DizaynModel(
      id: json['ID'] as int?,
      dizaynAdi: json['DIZAYN_ADI'] as String?,
      modulId: json['MODUL_ID'] as int?,
      dizaynKodu: json['DIZAYN_KODU'] as String?,
      erpDizayni: json['ERP_DIZAYNI'] as String?,
    );

Map<String, dynamic> _$DizaynModelToJson(DizaynModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.id);
  writeNotNull('DIZAYN_ADI', instance.dizaynAdi);
  writeNotNull('MODUL_ID', instance.modulId);
  writeNotNull('DIZAYN_KODU', instance.dizaynKodu);
  writeNotNull('ERP_DIZAYNI', instance.erpDizayni);
  return val;
}

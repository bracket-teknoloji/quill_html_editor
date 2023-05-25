// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'base_proje_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseProjeModel _$BaseProjeModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BaseProjeModel',
      json,
      ($checkedConvert) {
        final val = BaseProjeModel();
        $checkedConvert('PROJE_KODU', (v) => val.projeKodu = v as String?);
        $checkedConvert(
            'PROJE_ACIKLAMA', (v) => val.projeAciklama = v as String?);
        $checkedConvert('AKTIF', (v) => val.aktif = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'projeKodu': 'PROJE_KODU',
        'projeAciklama': 'PROJE_ACIKLAMA',
        'aktif': 'AKTIF'
      },
    );

Map<String, dynamic> _$BaseProjeModelToJson(BaseProjeModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('PROJE_ACIKLAMA', instance.projeAciklama);
  writeNotNull('AKTIF', instance.aktif);
  return val;
}

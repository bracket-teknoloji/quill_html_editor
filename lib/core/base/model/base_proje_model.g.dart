// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_proje_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseProjeModel _$BaseProjeModelFromJson(Map<String, dynamic> json) =>
    BaseProjeModel()
      ..projeKodu = json['PROJE_KODU'] as String?
      ..projeAciklama = json['PROJE_ACIKLAMA'] as String?
      ..aktif = json['AKTIF'] as String?;

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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yapilandirma_profil_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_YapilandirmaProfilModel _$$_YapilandirmaProfilModelFromJson(
        Map<String, dynamic> json) =>
    _$_YapilandirmaProfilModel(
      sira: json['SIRA'] as int?,
      ozellikKodu: json['OZELLIK_KODU'] as String?,
      aciklama: json['ACIKLAMA'] as String?,
      deger: json['DEGER'] as String?,
    );

Map<String, dynamic> _$$_YapilandirmaProfilModelToJson(
    _$_YapilandirmaProfilModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SIRA', instance.sira);
  writeNotNull('OZELLIK_KODU', instance.ozellikKodu);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('DEGER', instance.deger);
  return val;
}

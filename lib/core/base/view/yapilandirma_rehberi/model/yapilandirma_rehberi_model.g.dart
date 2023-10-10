// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yapilandirma_rehberi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YapilandirmaRehberiModelImpl _$$YapilandirmaRehberiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$YapilandirmaRehberiModelImpl(
      yapkod: json['YAPKOD'] as String?,
      yapacik: json['YAPACIK'] as String?,
      kod: json['KOD'] as String?,
      kodAciklama: json['KOD_ACIKLAMA'] as String?,
      deger: json['DEGER'] as String?,
      degerAciklama: json['DEGER_ACIKLAMA'] as String?,
      ozellikSira: json['OZELLIK_SIRA'] as int?,
    );

Map<String, dynamic> _$$YapilandirmaRehberiModelImplToJson(
    _$YapilandirmaRehberiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('YAPKOD', instance.yapkod);
  writeNotNull('YAPACIK', instance.yapacik);
  writeNotNull('KOD', instance.kod);
  writeNotNull('KOD_ACIKLAMA', instance.kodAciklama);
  writeNotNull('DEGER', instance.deger);
  writeNotNull('DEGER_ACIKLAMA', instance.degerAciklama);
  writeNotNull('OZELLIK_SIRA', instance.ozellikSira);
  return val;
}

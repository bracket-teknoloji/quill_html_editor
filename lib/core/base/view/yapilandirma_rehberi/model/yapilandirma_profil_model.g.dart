// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yapilandirma_profil_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YapilandirmaProfilModelImpl _$$YapilandirmaProfilModelImplFromJson(
        Map<String, dynamic> json) =>
    _$YapilandirmaProfilModelImpl(
      sira: json['SIRA'] as int?,
      ozellikKodu: json['OZELLIK_KODU'] as String?,
      aciklama: json['ACIKLAMA'] as String?,
      deger: (json['DEGER'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : YapilandirmaRehberiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$YapilandirmaProfilModelImplToJson(
    _$YapilandirmaProfilModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SIRA', instance.sira);
  writeNotNull('OZELLIK_KODU', instance.ozellikKodu);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('DEGER', instance.deger?.map((e) => e?.toJson()).toList());
  return val;
}

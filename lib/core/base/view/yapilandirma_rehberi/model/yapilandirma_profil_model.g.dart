// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yapilandirma_profil_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_YapilandirmaProfilModel _$YapilandirmaProfilModelFromJson(
  Map<String, dynamic> json,
) => _YapilandirmaProfilModel(
  sira: (json['SIRA'] as num?)?.toInt(),
  ozellikKodu: json['OZELLIK_KODU'] as String?,
  aciklama: json['ACIKLAMA'] as String?,
  deger: (json['DEGER'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : YapilandirmaRehberiModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$YapilandirmaProfilModelToJson(
  _YapilandirmaProfilModel instance,
) => <String, dynamic>{
  'SIRA': ?instance.sira,
  'OZELLIK_KODU': ?instance.ozellikKodu,
  'ACIKLAMA': ?instance.aciklama,
  'DEGER': ?instance.deger?.map((e) => e?.toJson()).toList(),
};

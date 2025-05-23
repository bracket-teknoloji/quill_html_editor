// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yapilandirma_profil_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YapilandirmaProfilModelImpl _$$YapilandirmaProfilModelImplFromJson(Map<String, dynamic> json) =>
    _$YapilandirmaProfilModelImpl(
      sira: (json['SIRA'] as num?)?.toInt(),
      ozellikKodu: json['OZELLIK_KODU'] as String?,
      aciklama: json['ACIKLAMA'] as String?,
      deger: (json['DEGER'] as List<dynamic>?)
          ?.map((e) => e == null ? null : YapilandirmaRehberiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$YapilandirmaProfilModelImplToJson(_$YapilandirmaProfilModelImpl instance) => <String, dynamic>{
  if (instance.sira case final value?) 'SIRA': value,
  if (instance.ozellikKodu case final value?) 'OZELLIK_KODU': value,
  if (instance.aciklama case final value?) 'ACIKLAMA': value,
  if (instance.deger?.map((e) => e?.toJson()).toList() case final value?) 'DEGER': value,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_proje_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseProjeModel _$BaseProjeModelFromJson(Map<String, dynamic> json) =>
    BaseProjeModel(
      projeKodu: json['PROJE_KODU'] as String?,
      projeAciklama: json['PROJE_ACIKLAMA'] as String?,
      aktif: json['AKTIF'] as String?,
    );

Map<String, dynamic> _$BaseProjeModelToJson(BaseProjeModel instance) =>
    <String, dynamic>{
      'PROJE_KODU': ?instance.projeKodu,
      'PROJE_ACIKLAMA': ?instance.projeAciklama,
      'AKTIF': ?instance.aktif,
    };

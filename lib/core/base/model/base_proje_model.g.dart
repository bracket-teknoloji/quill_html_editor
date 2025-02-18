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
      if (instance.projeKodu case final value?) 'PROJE_KODU': value,
      if (instance.projeAciklama case final value?) 'PROJE_ACIKLAMA': value,
      if (instance.aktif case final value?) 'AKTIF': value,
    };

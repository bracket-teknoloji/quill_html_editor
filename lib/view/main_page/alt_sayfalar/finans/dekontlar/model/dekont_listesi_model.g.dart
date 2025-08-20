// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dekont_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DekontListesiModel _$DekontListesiModelFromJson(Map<String, dynamic> json) =>
    _DekontListesiModel(
      inckeyno: (json['INCKEYNO'] as num?)?.toInt(),
      seri: json['SERI'] as String?,
      dekontNo: (json['DEKONT_NO'] as num?)?.toInt(),
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      kalemSayisi: (json['KALEM_SAYISI'] as num?)?.toInt(),
      borcToplami: (json['BORC_TOPLAMI'] as num?)?.toDouble(),
      seriAdi: json['SERI_ADI'] as String?,
    );

Map<String, dynamic> _$DekontListesiModelToJson(_DekontListesiModel instance) =>
    <String, dynamic>{
      'INCKEYNO': ?instance.inckeyno,
      'SERI': ?instance.seri,
      'DEKONT_NO': ?instance.dekontNo,
      'TARIH': ?instance.tarih?.toIso8601String(),
      'KALEM_SAYISI': ?instance.kalemSayisi,
      'BORC_TOPLAMI': ?instance.borcToplami,
      'SERI_ADI': ?instance.seriAdi,
    };

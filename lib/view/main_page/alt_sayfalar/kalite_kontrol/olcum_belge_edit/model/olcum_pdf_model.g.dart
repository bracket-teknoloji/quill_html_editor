// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_pdf_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OlcumPdfModel _$OlcumPdfModelFromJson(Map<String, dynamic> json) =>
    _OlcumPdfModel(
      stokKodu: json['STOK_KODU'] as String?,
      yapkod: json['YAPKOD'] as String?,
      revno: json['REVNO'] as String?,
      revtar: json['REVTAR'] == null
          ? null
          : DateTime.parse(json['REVTAR'] as String),
      tur: json['TUR'] as String?,
    );

Map<String, dynamic> _$OlcumPdfModelToJson(_OlcumPdfModel instance) =>
    <String, dynamic>{
      'STOK_KODU': ?instance.stokKodu,
      'YAPKOD': ?instance.yapkod,
      'REVNO': ?instance.revno,
      'REVTAR': ?instance.revtar?.toIso8601String(),
      'TUR': ?instance.tur,
    };

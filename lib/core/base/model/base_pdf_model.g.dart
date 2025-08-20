// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_pdf_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasePdfModel _$BasePdfModelFromJson(Map<String, dynamic> json) => BasePdfModel(
  byteData: json['BYTE_DATA'] as String?,
  uzanti: json['UZANTI'] as String?,
  reportWidth: (json['REPORT_WIDTH'] as num?)?.toDouble(),
  reportHeight: (json['REPORT_HEIGHT'] as num?)?.toDouble(),
  dosyaAdi: json['DOSYA_ADI'] as String?,
  fromMemory: json['FROM_MEMORY'] as bool? ?? false,
);

Map<String, dynamic> _$BasePdfModelToJson(BasePdfModel instance) =>
    <String, dynamic>{
      'BYTE_DATA': ?instance.byteData,
      'UZANTI': ?instance.uzanti,
      'REPORT_WIDTH': ?instance.reportWidth,
      'REPORT_HEIGHT': ?instance.reportHeight,
      'DOSYA_ADI': ?instance.dosyaAdi,
      'FROM_MEMORY': ?instance.fromMemory,
    };

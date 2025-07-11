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

Map<String, dynamic> _$BasePdfModelToJson(BasePdfModel instance) => <String, dynamic>{
  if (instance.byteData case final value?) 'BYTE_DATA': value,
  if (instance.uzanti case final value?) 'UZANTI': value,
  if (instance.reportWidth case final value?) 'REPORT_WIDTH': value,
  if (instance.reportHeight case final value?) 'REPORT_HEIGHT': value,
  if (instance.dosyaAdi case final value?) 'DOSYA_ADI': value,
  if (instance.fromMemory case final value?) 'FROM_MEMORY': value,
};

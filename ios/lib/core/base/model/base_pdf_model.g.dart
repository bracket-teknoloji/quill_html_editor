// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_pdf_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasePdfModel _$BasePdfModelFromJson(Map<String, dynamic> json) => BasePdfModel()
  ..byteData = json['BYTE_DATA'] as String?
  ..uzanti = json['UZANTI'] as String?
  ..reportWidth = (json['REPORT_WIDTH'] as num?)?.toDouble()
  ..reportHeight = (json['REPORT_HEIGHT'] as num?)?.toDouble();

Map<String, dynamic> _$BasePdfModelToJson(BasePdfModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BYTE_DATA', instance.byteData);
  writeNotNull('UZANTI', instance.uzanti);
  writeNotNull('REPORT_WIDTH', instance.reportWidth);
  writeNotNull('REPORT_HEIGHT', instance.reportHeight);
  return val;
}

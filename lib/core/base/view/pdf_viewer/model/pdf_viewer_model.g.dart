// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_viewer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PdfModel _$PdfModelFromJson(Map<String, dynamic> json) => PdfModel(
      raporOzelKod: json['RAPOR_OZEL_KOD'] as String?,
      standart: json['STANDART'] as bool?,
      dicParams: json['DIC_PARAMS'] == null
          ? null
          : DicParams.fromJson(json['DIC_PARAMS'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PdfModelToJson(PdfModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RAPOR_OZEL_KOD', instance.raporOzelKod);
  writeNotNull('STANDART', instance.standart);
  writeNotNull('DIC_PARAMS', instance.dicParams?.toJson());
  return val;
}

DicParams _$DicParamsFromJson(Map<String, dynamic> json) => DicParams(
      cariKodu: json['CARI_KODU'] as String?,
      dovizTipi: json['DOVIZ_TIPI'] as String?,
      bastar: json['BASTAR'] as String?,
      bittar: json['BITTAR'] as String?,
    );

Map<String, dynamic> _$DicParamsToJson(DicParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('BASTAR', instance.bastar);
  writeNotNull('BITTAR', instance.bittar);
  return val;
}

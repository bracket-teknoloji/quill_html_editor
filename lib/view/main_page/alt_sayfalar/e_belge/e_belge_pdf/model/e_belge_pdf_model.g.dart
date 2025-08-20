// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_belge_pdf_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EBelgePdfModel _$EBelgePdfModelFromJson(Map<String, dynamic> json) =>
    _EBelgePdfModel(
      islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
      fileModel: json['FileModel'] == null
          ? null
          : FileModel.fromJson(json['FileModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EBelgePdfModelToJson(_EBelgePdfModel instance) =>
    <String, dynamic>{
      'ISLEM_KODU': ?instance.islemKodu,
      'FileModel': ?instance.fileModel?.toJson(),
    };

_FileModel _$FileModelFromJson(Map<String, dynamic> json) => _FileModel(
  byteData: json['BYTE_DATA'] as String?,
  uzanti: json['UZANTI'] as String?,
  dosyaTarihi: json['DOSYA_TARIHI'] == null
      ? null
      : DateTime.parse(json['DOSYA_TARIHI'] as String),
  dosyaAdi: json['DOSYA_ADI'] as String?,
);

Map<String, dynamic> _$FileModelToJson(_FileModel instance) =>
    <String, dynamic>{
      'BYTE_DATA': ?instance.byteData,
      'UZANTI': ?instance.uzanti,
      'DOSYA_TARIHI': ?instance.dosyaTarihi?.toIso8601String(),
      'DOSYA_ADI': ?instance.dosyaAdi,
    };

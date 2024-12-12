// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_belge_pdf_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EBelgePdfModelImpl _$$EBelgePdfModelImplFromJson(Map<String, dynamic> json) =>
    _$EBelgePdfModelImpl(
      islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
      fileModel: json['FileModel'] == null
          ? null
          : FileModel.fromJson(json['FileModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EBelgePdfModelImplToJson(
        _$EBelgePdfModelImpl instance) =>
    <String, dynamic>{
      if (instance.islemKodu case final value?) 'ISLEM_KODU': value,
      if (instance.fileModel?.toJson() case final value?) 'FileModel': value,
    };

_$FileModelImpl _$$FileModelImplFromJson(Map<String, dynamic> json) =>
    _$FileModelImpl(
      byteData: json['BYTE_DATA'] as String?,
      uzanti: json['UZANTI'] as String?,
      dosyaTarihi: json['DOSYA_TARIHI'] == null
          ? null
          : DateTime.parse(json['DOSYA_TARIHI'] as String),
      dosyaAdi: json['DOSYA_ADI'] as String?,
    );

Map<String, dynamic> _$$FileModelImplToJson(_$FileModelImpl instance) =>
    <String, dynamic>{
      if (instance.byteData case final value?) 'BYTE_DATA': value,
      if (instance.uzanti case final value?) 'UZANTI': value,
      if (instance.dosyaTarihi?.toIso8601String() case final value?)
        'DOSYA_TARIHI': value,
      if (instance.dosyaAdi case final value?) 'DOSYA_ADI': value,
    };

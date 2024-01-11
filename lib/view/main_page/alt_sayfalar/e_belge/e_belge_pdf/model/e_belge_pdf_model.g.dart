// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_belge_pdf_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EBelgePdfModelImpl _$$EBelgePdfModelImplFromJson(Map<String, dynamic> json) =>
    _$EBelgePdfModelImpl(
      islemKodu: json['ISLEM_KODU'] as int?,
      fileModel: json['FileModel'] == null
          ? null
          : FileModel.fromJson(json['FileModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EBelgePdfModelImplToJson(
    _$EBelgePdfModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ISLEM_KODU', instance.islemKodu);
  writeNotNull('FileModel', instance.fileModel?.toJson());
  return val;
}

_$FileModelImpl _$$FileModelImplFromJson(Map<String, dynamic> json) =>
    _$FileModelImpl(
      byteData: json['BYTE_DATA'] as String?,
      uzanti: json['UZANTI'] as String?,
      dosyaTarihi: json['DOSYA_TARIHI'] == null
          ? null
          : DateTime.parse(json['DOSYA_TARIHI'] as String),
      dosyaAdi: json['DOSYA_ADI'] as String?,
    );

Map<String, dynamic> _$$FileModelImplToJson(_$FileModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BYTE_DATA', instance.byteData);
  writeNotNull('UZANTI', instance.uzanti);
  writeNotNull('DOSYA_TARIHI', instance.dosyaTarihi?.toIso8601String());
  writeNotNull('DOSYA_ADI', instance.dosyaAdi);
  return val;
}

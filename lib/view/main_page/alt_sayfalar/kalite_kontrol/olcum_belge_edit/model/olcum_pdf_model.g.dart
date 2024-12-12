// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_pdf_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OlcumPdfModelImpl _$$OlcumPdfModelImplFromJson(Map<String, dynamic> json) =>
    _$OlcumPdfModelImpl(
      stokKodu: json['STOK_KODU'] as String?,
      yapkod: json['YAPKOD'] as String?,
      revno: json['REVNO'] as String?,
      revtar: json['REVTAR'] == null
          ? null
          : DateTime.parse(json['REVTAR'] as String),
      tur: json['TUR'] as String?,
    );

Map<String, dynamic> _$$OlcumPdfModelImplToJson(_$OlcumPdfModelImpl instance) =>
    <String, dynamic>{
      if (instance.stokKodu case final value?) 'STOK_KODU': value,
      if (instance.yapkod case final value?) 'YAPKOD': value,
      if (instance.revno case final value?) 'REVNO': value,
      if (instance.revtar?.toIso8601String() case final value?) 'REVTAR': value,
      if (instance.tur case final value?) 'TUR': value,
    };

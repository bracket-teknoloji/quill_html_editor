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

Map<String, dynamic> _$$OlcumPdfModelImplToJson(_$OlcumPdfModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('YAPKOD', instance.yapkod);
  writeNotNull('REVNO', instance.revno);
  writeNotNull('REVTAR', instance.revtar?.toIso8601String());
  writeNotNull('TUR', instance.tur);
  return val;
}

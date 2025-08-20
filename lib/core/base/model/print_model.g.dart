// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrintModel _$PrintModelFromJson(Map<String, dynamic> json) => _PrintModel(
  raporOzelKod: json['RAPOR_OZEL_KOD'] as String,
  dizaynId: (json['DIZAYN_ID'] as num?)?.toInt(),
  etiketSayisi: (json['ETIKET_SAYISI'] as num?)?.toInt(),
  yazdir: json['YAZDIR'] as bool? ?? true,
  yaziciAdi: json['YAZICI_ADI'] as String?,
  yaziciTipi: json['YAZICI_TIPI'] as String?,
  dicParams: json['DIC_PARAMS'] == null
      ? null
      : DicParams.fromJson(json['DIC_PARAMS'] as Map<String, dynamic>),
  standart: json['STANDART'] as bool?,
  exportTipi: json['EXPORT_TIPI'] as String?,
);

Map<String, dynamic> _$PrintModelToJson(_PrintModel instance) =>
    <String, dynamic>{
      'RAPOR_OZEL_KOD': instance.raporOzelKod,
      'DIZAYN_ID': ?instance.dizaynId,
      'ETIKET_SAYISI': ?instance.etiketSayisi,
      'YAZDIR': ?instance.yazdir,
      'YAZICI_ADI': ?instance.yaziciAdi,
      'YAZICI_TIPI': ?instance.yaziciTipi,
      'DIC_PARAMS': ?instance.dicParams?.toJson(),
      'STANDART': ?instance.standart,
      'EXPORT_TIPI': ?instance.exportTipi,
    };

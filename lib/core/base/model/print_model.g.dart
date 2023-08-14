// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrintModel _$PrintModelFromJson(Map<String, dynamic> json) => PrintModel(
      dizaynId: json['DIZAYN_ID'] as int?,
      etiketSayisi: json['ETIKET_SAYISI'] as int?,
      raporOzelKod: json['RAPOR_OZEL_KOD'] as String?,
      yazdir: json['YAZDIR'] as bool?,
      yaziciAdi: json['YAZICI_ADI'] as String?,
      yaziciTipi: json['YAZICI_TIPI'] as String?,
      dicParams: json['DIC_PARAMS'] == null
          ? null
          : DicParams.fromJson(json['DIC_PARAMS'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrintModelToJson(PrintModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DIZAYN_ID', instance.dizaynId);
  writeNotNull('ETIKET_SAYISI', instance.etiketSayisi);
  writeNotNull('RAPOR_OZEL_KOD', instance.raporOzelKod);
  writeNotNull('YAZDIR', instance.yazdir);
  writeNotNull('YAZICI_ADI', instance.yaziciAdi);
  writeNotNull('YAZICI_TIPI', instance.yaziciTipi);
  writeNotNull('DIC_PARAMS', instance.dicParams?.toJson());
  return val;
}

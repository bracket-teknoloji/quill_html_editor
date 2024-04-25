// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrintModelImpl _$$PrintModelImplFromJson(Map<String, dynamic> json) =>
    _$PrintModelImpl(
      dizaynId: (json['DIZAYN_ID'] as num?)?.toInt(),
      etiketSayisi: (json['ETIKET_SAYISI'] as num?)?.toInt(),
      raporOzelKod: json['RAPOR_OZEL_KOD'] as String,
      yazdir: json['YAZDIR'] as bool? ?? true,
      yaziciAdi: json['YAZICI_ADI'] as String?,
      yaziciTipi: json['YAZICI_TIPI'] as String?,
      dicParams: json['DIC_PARAMS'] == null
          ? null
          : DicParams.fromJson(json['DIC_PARAMS'] as Map<String, dynamic>),
      standart: json['STANDART'] as bool?,
    );

Map<String, dynamic> _$$PrintModelImplToJson(_$PrintModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DIZAYN_ID', instance.dizaynId);
  writeNotNull('ETIKET_SAYISI', instance.etiketSayisi);
  val['RAPOR_OZEL_KOD'] = instance.raporOzelKod;
  writeNotNull('YAZDIR', instance.yazdir);
  writeNotNull('YAZICI_ADI', instance.yaziciAdi);
  writeNotNull('YAZICI_TIPI', instance.yaziciTipi);
  writeNotNull('DIC_PARAMS', instance.dicParams?.toJson());
  writeNotNull('STANDART', instance.standart);
  return val;
}

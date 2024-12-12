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

Map<String, dynamic> _$$PrintModelImplToJson(_$PrintModelImpl instance) =>
    <String, dynamic>{
      if (instance.dizaynId case final value?) 'DIZAYN_ID': value,
      if (instance.etiketSayisi case final value?) 'ETIKET_SAYISI': value,
      'RAPOR_OZEL_KOD': instance.raporOzelKod,
      if (instance.yazdir case final value?) 'YAZDIR': value,
      if (instance.yaziciAdi case final value?) 'YAZICI_ADI': value,
      if (instance.yaziciTipi case final value?) 'YAZICI_TIPI': value,
      if (instance.dicParams?.toJson() case final value?) 'DIC_PARAMS': value,
      if (instance.standart case final value?) 'STANDART': value,
    };

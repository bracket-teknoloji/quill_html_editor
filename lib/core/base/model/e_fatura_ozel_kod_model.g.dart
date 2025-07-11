// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_fatura_ozel_kod_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EFaturaOzelKodModel _$EFaturaOzelKodModelFromJson(Map<String, dynamic> json) => _EFaturaOzelKodModel(
  tip: (json['TIP'] as num?)?.toInt(),
  tipAdi: json['TIP_ADI'] as String?,
  kod: (json['KOD'] as num?)?.toInt(),
  aciklama: json['ACIKLAMA'] as String?,
);

Map<String, dynamic> _$EFaturaOzelKodModelToJson(
  _EFaturaOzelKodModel instance,
) => <String, dynamic>{
  if (instance.tip case final value?) 'TIP': value,
  if (instance.tipAdi case final value?) 'TIP_ADI': value,
  if (instance.kod case final value?) 'KOD': value,
  if (instance.aciklama case final value?) 'ACIKLAMA': value,
};

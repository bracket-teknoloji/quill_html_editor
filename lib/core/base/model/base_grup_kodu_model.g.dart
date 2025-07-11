// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_grup_kodu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BaseGrupKoduModel _$BaseGrupKoduModelFromJson(Map<String, dynamic> json) => _BaseGrupKoduModel(
  modul: json['MODUL'] as String?,
  grupNo: (json['GRUP_NO'] as num?)?.toInt(),
  grupKodu: json['GRUP_KODU'] as String?,
  grupAdi: json['GRUP_ADI'] as String?,
  tip: json['TIP'] as String?,
  kod1: json['KOD1'] as String?,
  kod2: json['KOD2'] as String?,
  kod3: json['KOD3'] as String?,
  kod4: json['KOD4'] as String?,
  kod5: json['KOD5'] as String?,
  kod1Adi: json['KOD1_ADI'] as String?,
  kod2Adi: json['KOD2_ADI'] as String?,
  kod3Adi: json['KOD3_ADI'] as String?,
  kod4Adi: json['KOD4_ADI'] as String?,
  kod5Adi: json['KOD5_ADI'] as String?,
);

Map<String, dynamic> _$BaseGrupKoduModelToJson(_BaseGrupKoduModel instance) => <String, dynamic>{
  if (instance.modul case final value?) 'MODUL': value,
  if (instance.grupNo case final value?) 'GRUP_NO': value,
  if (instance.grupKodu case final value?) 'GRUP_KODU': value,
  if (instance.grupAdi case final value?) 'GRUP_ADI': value,
  if (instance.tip case final value?) 'TIP': value,
  if (instance.kod1 case final value?) 'KOD1': value,
  if (instance.kod2 case final value?) 'KOD2': value,
  if (instance.kod3 case final value?) 'KOD3': value,
  if (instance.kod4 case final value?) 'KOD4': value,
  if (instance.kod5 case final value?) 'KOD5': value,
  if (instance.kod1Adi case final value?) 'KOD1_ADI': value,
  if (instance.kod2Adi case final value?) 'KOD2_ADI': value,
  if (instance.kod3Adi case final value?) 'KOD3_ADI': value,
  if (instance.kod4Adi case final value?) 'KOD4_ADI': value,
  if (instance.kod5Adi case final value?) 'KOD5_ADI': value,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_irsaliye_bilgi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EIrsaliyeBilgiModel _$EIrsaliyeBilgiModelFromJson(Map<String, dynamic> json) =>
    _EIrsaliyeBilgiModel(
      dorsePlaka1: json['DORSE_PLAKA1'] as String?,
      dorsePlaka2: json['DORSE_PLAKA2'] as String?,
      dorsePlaka3: json['DORSE_PLAKA3'] as String?,
      plaka: json['PLAKA'] as String?,
      sevktar: json['SEVKTAR'] == null
          ? null
          : DateTime.parse(json['SEVKTAR'] as String),
      sofor1Aciklama: json['SOFOR_1_ACIKLAMA'] as String?,
      sofor1Adi: json['SOFOR_1_ADI'] as String?,
      sofor1KimlikNo: json['SOFOR_1_KIMLIK_NO'] as String?,
      sofor1Soyadi: json['SOFOR_1_SOYADI'] as String?,
      sofor2Aciklama: json['SOFOR_2_ACIKLAMA'] as String?,
      sofor2Adi: json['SOFOR_2_ADI'] as String?,
      sofor2KimlikNo: json['SOFOR_2_KIMLIK_NO'] as String?,
      sofor2Soyadi: json['SOFOR_2_SOYADI'] as String?,
      sofor3Aciklama: json['SOFOR_3_ACIKLAMA'] as String?,
      sofor3Adi: json['SOFOR_3_ADI'] as String?,
      sofor3KimlikNo: json['SOFOR_3_KIMLIK_NO'] as String?,
      sofor3Soyadi: json['SOFOR_3_SOYADI'] as String?,
      tasiyiciIl: json['TASIYICI_IL'] as String?,
      tasiyiciIlce: json['TASIYICI_ILCE'] as String?,
      tasiyiciPostakodu: json['TASIYICI_POSTAKODU'] as String?,
      tasiyiciUlke: json['TASIYICI_ULKE'] as String?,
      tasiyiciUnvan: json['TASIYICI_UNVAN'] as String?,
      tasiyiciVkn: json['TASIYICI_VKN'] as String?,
      sablonKodu: json['SABLON_KODU'] as String?,
    );

Map<String, dynamic> _$EIrsaliyeBilgiModelToJson(
  _EIrsaliyeBilgiModel instance,
) => <String, dynamic>{
  if (instance.dorsePlaka1 case final value?) 'DORSE_PLAKA1': value,
  if (instance.dorsePlaka2 case final value?) 'DORSE_PLAKA2': value,
  if (instance.dorsePlaka3 case final value?) 'DORSE_PLAKA3': value,
  if (instance.plaka case final value?) 'PLAKA': value,
  if (instance.sevktar?.toIso8601String() case final value?) 'SEVKTAR': value,
  if (instance.sofor1Aciklama case final value?) 'SOFOR_1_ACIKLAMA': value,
  if (instance.sofor1Adi case final value?) 'SOFOR_1_ADI': value,
  if (instance.sofor1KimlikNo case final value?) 'SOFOR_1_KIMLIK_NO': value,
  if (instance.sofor1Soyadi case final value?) 'SOFOR_1_SOYADI': value,
  if (instance.sofor2Aciklama case final value?) 'SOFOR_2_ACIKLAMA': value,
  if (instance.sofor2Adi case final value?) 'SOFOR_2_ADI': value,
  if (instance.sofor2KimlikNo case final value?) 'SOFOR_2_KIMLIK_NO': value,
  if (instance.sofor2Soyadi case final value?) 'SOFOR_2_SOYADI': value,
  if (instance.sofor3Aciklama case final value?) 'SOFOR_3_ACIKLAMA': value,
  if (instance.sofor3Adi case final value?) 'SOFOR_3_ADI': value,
  if (instance.sofor3KimlikNo case final value?) 'SOFOR_3_KIMLIK_NO': value,
  if (instance.sofor3Soyadi case final value?) 'SOFOR_3_SOYADI': value,
  if (instance.tasiyiciIl case final value?) 'TASIYICI_IL': value,
  if (instance.tasiyiciIlce case final value?) 'TASIYICI_ILCE': value,
  if (instance.tasiyiciPostakodu case final value?) 'TASIYICI_POSTAKODU': value,
  if (instance.tasiyiciUlke case final value?) 'TASIYICI_ULKE': value,
  if (instance.tasiyiciUnvan case final value?) 'TASIYICI_UNVAN': value,
  if (instance.tasiyiciVkn case final value?) 'TASIYICI_VKN': value,
  if (instance.sablonKodu case final value?) 'SABLON_KODU': value,
};

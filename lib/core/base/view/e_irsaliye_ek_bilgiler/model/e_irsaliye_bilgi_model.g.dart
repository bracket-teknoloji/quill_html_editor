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
  'DORSE_PLAKA1': ?instance.dorsePlaka1,
  'DORSE_PLAKA2': ?instance.dorsePlaka2,
  'DORSE_PLAKA3': ?instance.dorsePlaka3,
  'PLAKA': ?instance.plaka,
  'SEVKTAR': ?instance.sevktar?.toIso8601String(),
  'SOFOR_1_ACIKLAMA': ?instance.sofor1Aciklama,
  'SOFOR_1_ADI': ?instance.sofor1Adi,
  'SOFOR_1_KIMLIK_NO': ?instance.sofor1KimlikNo,
  'SOFOR_1_SOYADI': ?instance.sofor1Soyadi,
  'SOFOR_2_ACIKLAMA': ?instance.sofor2Aciklama,
  'SOFOR_2_ADI': ?instance.sofor2Adi,
  'SOFOR_2_KIMLIK_NO': ?instance.sofor2KimlikNo,
  'SOFOR_2_SOYADI': ?instance.sofor2Soyadi,
  'SOFOR_3_ACIKLAMA': ?instance.sofor3Aciklama,
  'SOFOR_3_ADI': ?instance.sofor3Adi,
  'SOFOR_3_KIMLIK_NO': ?instance.sofor3KimlikNo,
  'SOFOR_3_SOYADI': ?instance.sofor3Soyadi,
  'TASIYICI_IL': ?instance.tasiyiciIl,
  'TASIYICI_ILCE': ?instance.tasiyiciIlce,
  'TASIYICI_POSTAKODU': ?instance.tasiyiciPostakodu,
  'TASIYICI_ULKE': ?instance.tasiyiciUlke,
  'TASIYICI_UNVAN': ?instance.tasiyiciUnvan,
  'TASIYICI_VKN': ?instance.tasiyiciVkn,
  'SABLON_KODU': ?instance.sablonKodu,
};

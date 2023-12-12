// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_irsaliye_bilgi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EIrsaliyeBilgiModelImpl _$$EIrsaliyeBilgiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EIrsaliyeBilgiModelImpl(
      dorsePlaka1: json['DORSE_PLAKA1'] as String?,
      dorsePlaka2: json['DORSE_PLAKA2'] as String?,
      dorsePlaka3: json['DORSE_PLAKA3'] as String?,
      plaka: json['PLAKA'] as String?,
      sevktar: json['SEVKTAR'] == null
          ? null
          : DateTime.parse(json['SEVKTAR'] as String),
      sofor1Aciklama: json['SOFOR1_ACIKLAMA'] as String?,
      sofor1Adi: json['SOFOR1_ADI'] as String?,
      sofor1KimlikNo: json['SOFOR1_KIMLIK_NO'] as String?,
      sofor1Soyadi: json['SOFOR1_SOYADI'] as String?,
      sofor2Aciklama: json['SOFOR2_ACIKLAMA'] as String?,
      sofor2Adi: json['SOFOR2_ADI'] as String?,
      sofor2KimlikNo: json['SOFOR2_KIMLIK_NO'] as String?,
      sofor2Soyadi: json['SOFOR2_SOYADI'] as String?,
      sofor3Aciklama: json['SOFOR3_ACIKLAMA'] as String?,
      sofor3Adi: json['SOFOR3_ADI'] as String?,
      sofor3KimlikNo: json['SOFOR3_KIMLIK_NO'] as String?,
      sofor3Soyadi: json['SOFOR3_SOYADI'] as String?,
      tasiyiciIl: json['TASIYICI_IL'] as String?,
      tasiyiciIlce: json['TASIYICI_ILCE'] as String?,
      tasiyiciPostakodu: json['TASIYICI_POSTAKODU'] as String?,
      tasiyiciUlke: json['TASIYICI_ULKE'] as String?,
      tasiyiciUnvan: json['TASIYICI_UNVAN'] as String?,
      tasiyiciVkn: json['TASIYICI_VKN'] as String?,
    );

Map<String, dynamic> _$$EIrsaliyeBilgiModelImplToJson(
    _$EIrsaliyeBilgiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DORSE_PLAKA1', instance.dorsePlaka1);
  writeNotNull('DORSE_PLAKA2', instance.dorsePlaka2);
  writeNotNull('DORSE_PLAKA3', instance.dorsePlaka3);
  writeNotNull('PLAKA', instance.plaka);
  writeNotNull('SEVKTAR', instance.sevktar?.toIso8601String());
  writeNotNull('SOFOR1_ACIKLAMA', instance.sofor1Aciklama);
  writeNotNull('SOFOR1_ADI', instance.sofor1Adi);
  writeNotNull('SOFOR1_KIMLIK_NO', instance.sofor1KimlikNo);
  writeNotNull('SOFOR1_SOYADI', instance.sofor1Soyadi);
  writeNotNull('SOFOR2_ACIKLAMA', instance.sofor2Aciklama);
  writeNotNull('SOFOR2_ADI', instance.sofor2Adi);
  writeNotNull('SOFOR2_KIMLIK_NO', instance.sofor2KimlikNo);
  writeNotNull('SOFOR2_SOYADI', instance.sofor2Soyadi);
  writeNotNull('SOFOR3_ACIKLAMA', instance.sofor3Aciklama);
  writeNotNull('SOFOR3_ADI', instance.sofor3Adi);
  writeNotNull('SOFOR3_KIMLIK_NO', instance.sofor3KimlikNo);
  writeNotNull('SOFOR3_SOYADI', instance.sofor3Soyadi);
  writeNotNull('TASIYICI_IL', instance.tasiyiciIl);
  writeNotNull('TASIYICI_ILCE', instance.tasiyiciIlce);
  writeNotNull('TASIYICI_POSTAKODU', instance.tasiyiciPostakodu);
  writeNotNull('TASIYICI_ULKE', instance.tasiyiciUlke);
  writeNotNull('TASIYICI_UNVAN', instance.tasiyiciUnvan);
  writeNotNull('TASIYICI_VKN', instance.tasiyiciVkn);
  return val;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kullanici_haritasi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KullaniciHaritasiModel _$KullaniciHaritasiModelFromJson(
  Map<String, dynamic> json,
) => _KullaniciHaritasiModel(
  kullanici: json['KULLANICI'] as String?,
  kullaniciAdsoyad: json['KULLANICI_ADSOYAD'] as String?,
  tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
  enlem: (json['ENLEM'] as num?)?.toDouble(),
  boylam: (json['BOYLAM'] as num?)?.toDouble(),
  cihazMarka: json['CIHAZ_MARKA'] as String?,
  cihazModel: json['CIHAZ_MODEL'] as String?,
  cihazId: json['CIHAZ_ID'] as String?,
  hiz: (json['HIZ'] as num?)?.toInt(),
);

Map<String, dynamic> _$KullaniciHaritasiModelToJson(
  _KullaniciHaritasiModel instance,
) => <String, dynamic>{
  if (instance.kullanici case final value?) 'KULLANICI': value,
  if (instance.kullaniciAdsoyad case final value?) 'KULLANICI_ADSOYAD': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
  if (instance.enlem case final value?) 'ENLEM': value,
  if (instance.boylam case final value?) 'BOYLAM': value,
  if (instance.cihazMarka case final value?) 'CIHAZ_MARKA': value,
  if (instance.cihazModel case final value?) 'CIHAZ_MODEL': value,
  if (instance.cihazId case final value?) 'CIHAZ_ID': value,
  if (instance.hiz case final value?) 'HIZ': value,
};

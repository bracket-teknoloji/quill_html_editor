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
  'KULLANICI': ?instance.kullanici,
  'KULLANICI_ADSOYAD': ?instance.kullaniciAdsoyad,
  'TARIH': ?instance.tarih?.toIso8601String(),
  'ENLEM': ?instance.enlem,
  'BOYLAM': ?instance.boylam,
  'CIHAZ_MARKA': ?instance.cihazMarka,
  'CIHAZ_MODEL': ?instance.cihazModel,
  'CIHAZ_ID': ?instance.cihazId,
  'HIZ': ?instance.hiz,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kasa_islemleri_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KasaIslemleriRequestModel _$KasaIslemleriRequestModelFromJson(
  Map<String, dynamic> json,
) => _KasaIslemleriRequestModel(
  baslamaTarihi: json['BaslamaTarihi'] as String?,
  bitisTarihi: json['BitisTarihi'] as String?,
  menuKodu: json['MenuKodu'] as String?,
  sayfa: (json['Sayfa'] as num?)?.toInt(),
  plasiyerKodu: json['PlasiyerKodu'] as String?,
  hesapTipi: json['HesapTipi'] as String?,
  hesapKodu: json['HesapKodu'] as String?,
  kasaKodu: json['KasaKodu'] as String?,
  gc: json['Gc'] as String?,
  kisitYok: json['KisitYok'] as bool?,
  refKey: json['RefKey'] as String?,
);

Map<String, dynamic> _$KasaIslemleriRequestModelToJson(
  _KasaIslemleriRequestModel instance,
) => <String, dynamic>{
  'BaslamaTarihi': ?instance.baslamaTarihi,
  'BitisTarihi': ?instance.bitisTarihi,
  'MenuKodu': ?instance.menuKodu,
  'Sayfa': ?instance.sayfa,
  'PlasiyerKodu': ?instance.plasiyerKodu,
  'HesapTipi': ?instance.hesapTipi,
  'HesapKodu': ?instance.hesapKodu,
  'KasaKodu': ?instance.kasaKodu,
  'Gc': ?instance.gc,
  'KisitYok': ?instance.kisitYok,
  'RefKey': ?instance.refKey,
};

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
  if (instance.baslamaTarihi case final value?) 'BaslamaTarihi': value,
  if (instance.bitisTarihi case final value?) 'BitisTarihi': value,
  if (instance.menuKodu case final value?) 'MenuKodu': value,
  if (instance.sayfa case final value?) 'Sayfa': value,
  if (instance.plasiyerKodu case final value?) 'PlasiyerKodu': value,
  if (instance.hesapTipi case final value?) 'HesapTipi': value,
  if (instance.hesapKodu case final value?) 'HesapKodu': value,
  if (instance.kasaKodu case final value?) 'KasaKodu': value,
  if (instance.gc case final value?) 'Gc': value,
  if (instance.kisitYok case final value?) 'KisitYok': value,
  if (instance.refKey case final value?) 'RefKey': value,
};

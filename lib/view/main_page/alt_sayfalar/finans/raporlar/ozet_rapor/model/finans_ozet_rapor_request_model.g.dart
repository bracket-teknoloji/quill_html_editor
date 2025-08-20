// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finans_ozet_rapor_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FinansOzetRaporRequestModel _$FinansOzetRaporRequestModelFromJson(
  Map<String, dynamic> json,
) => _FinansOzetRaporRequestModel(
  plasiyerKodu: json['PlasiyerKodu'] as String?,
  cariKodu: json['CariKodu'] as String?,
  tarihTipi: json['TarihTipi'] as String?,
  cariKoduIleBaslar: json['CariKoduIleBaslar'] as String?,
  kdvDahil: json['KDVDahil'] as bool?,
  baslamaTarihi: json['BaslamaTarihi'] as String?,
  bitisTarihi: json['BitisTarihi'] as String?,
  iadeDurumu: json['IadeDurumu'] as String?,
);

Map<String, dynamic> _$FinansOzetRaporRequestModelToJson(
  _FinansOzetRaporRequestModel instance,
) => <String, dynamic>{
  'PlasiyerKodu': ?instance.plasiyerKodu,
  'CariKodu': ?instance.cariKodu,
  'TarihTipi': ?instance.tarihTipi,
  'CariKoduIleBaslar': ?instance.cariKoduIleBaslar,
  'KDVDahil': ?instance.kdvDahil,
  'BaslamaTarihi': ?instance.baslamaTarihi,
  'BitisTarihi': ?instance.bitisTarihi,
  'IadeDurumu': ?instance.iadeDurumu,
};

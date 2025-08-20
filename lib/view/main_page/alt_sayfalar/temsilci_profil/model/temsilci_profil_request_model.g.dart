// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temsilci_profil_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemsilciProfilRequestModel _$TemsilciProfilRequestModelFromJson(
  Map<String, dynamic> json,
) => TemsilciProfilRequestModel(
  cariKodu: json['CariKodu'] as String?,
  donemTipi: json['DonemTipi'] as String?,
  satisIrsDahil: json['SATIS_IRS_DAHIL'] as String?,
  cariVKN: json['CariVKN'] as String?,
  kdvDahil: json['KDVDahil'] as String?,
  iadeDurumu: json['IadeDurumu'] as String?,
);

Map<String, dynamic> _$TemsilciProfilRequestModelToJson(
  TemsilciProfilRequestModel instance,
) => <String, dynamic>{
  'CariKodu': ?instance.cariKodu,
  'DonemTipi': ?instance.donemTipi,
  'SATIS_IRS_DAHIL': ?instance.satisIrsDahil,
  'CariVKN': ?instance.cariVKN,
  'KDVDahil': ?instance.kdvDahil,
  'IadeDurumu': ?instance.iadeDurumu,
};

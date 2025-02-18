// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temsilci_profil_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemsilciProfilRequestModel _$TemsilciProfilRequestModelFromJson(
        Map<String, dynamic> json) =>
    TemsilciProfilRequestModel(
      cariKodu: json['CariKodu'] as String?,
      donemTipi: json['DonemTipi'] as String?,
      satisIrsDahil: json['SATIS_IRS_DAHIL'] as String?,
      cariVKN: json['CariVKN'] as String?,
      kdvDahil: json['KDVDahil'] as String?,
      iadeDurumu: json['IadeDurumu'] as String?,
    );

Map<String, dynamic> _$TemsilciProfilRequestModelToJson(
        TemsilciProfilRequestModel instance) =>
    <String, dynamic>{
      if (instance.cariKodu case final value?) 'CariKodu': value,
      if (instance.donemTipi case final value?) 'DonemTipi': value,
      if (instance.satisIrsDahil case final value?) 'SATIS_IRS_DAHIL': value,
      if (instance.cariVKN case final value?) 'CariVKN': value,
      if (instance.kdvDahil case final value?) 'KDVDahil': value,
      if (instance.iadeDurumu case final value?) 'IadeDurumu': value,
    };

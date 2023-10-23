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
    TemsilciProfilRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CariKodu', instance.cariKodu);
  writeNotNull('DonemTipi', instance.donemTipi);
  writeNotNull('SATIS_IRS_DAHIL', instance.satisIrsDahil);
  writeNotNull('CariVKN', instance.cariVKN);
  writeNotNull('KDVDahil', instance.kdvDahil);
  writeNotNull('IadeDurumu', instance.iadeDurumu);
  return val;
}

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
  if (instance.plasiyerKodu case final value?) 'PlasiyerKodu': value,
  if (instance.cariKodu case final value?) 'CariKodu': value,
  if (instance.tarihTipi case final value?) 'TarihTipi': value,
  if (instance.cariKoduIleBaslar case final value?) 'CariKoduIleBaslar': value,
  if (instance.kdvDahil case final value?) 'KDVDahil': value,
  if (instance.baslamaTarihi case final value?) 'BaslamaTarihi': value,
  if (instance.bitisTarihi case final value?) 'BitisTarihi': value,
  if (instance.iadeDurumu case final value?) 'IadeDurumu': value,
};

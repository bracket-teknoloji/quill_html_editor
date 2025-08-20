// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_islemleri_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BankaIslemleriRequestModel _$BankaIslemleriRequestModelFromJson(
  Map<String, dynamic> json,
) => _BankaIslemleriRequestModel(
  baslamaTarihi: json['BaslamaTarihi'] as String?,
  bitisTarihi: json['BitisTarihi'] as String?,
  menuKodu: json['MenuKodu'] as String?,
  hesapTipi: json['HesapTipi'] as String?,
  hesapKodu: json['HesapKodu'] as String?,
);

Map<String, dynamic> _$BankaIslemleriRequestModelToJson(
  _BankaIslemleriRequestModel instance,
) => <String, dynamic>{
  'BaslamaTarihi': ?instance.baslamaTarihi,
  'BitisTarihi': ?instance.bitisTarihi,
  'MenuKodu': ?instance.menuKodu,
  'HesapTipi': ?instance.hesapTipi,
  'HesapKodu': ?instance.hesapKodu,
};

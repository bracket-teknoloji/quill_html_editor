// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_listesi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BankaListesiRequestModel _$BankaListesiRequestModelFromJson(
  Map<String, dynamic> json,
) => _BankaListesiRequestModel(
  bakiye: json['Bakiye'] as String?,
  arrHesapTipi: json['ArrHesapTipi'] as String?,
  haricHesaplarArray: json['HaricHesaplarArray'] as String?,
  sirala: json['Sirala'] as String?,
  ekranTipi: json['EkranTipi'] as String? ?? "R",
  menuKodu: json['MenuKodu'] as String?,
  belgeTipi: json['BelgeTipi'] as String?,
  bankaKodu: json['BankaKodu'] as String?,
  islemModulu: json['IslemModulu'] as String?,
);

Map<String, dynamic> _$BankaListesiRequestModelToJson(
  _BankaListesiRequestModel instance,
) => <String, dynamic>{
  'Bakiye': ?instance.bakiye,
  'ArrHesapTipi': ?instance.arrHesapTipi,
  'HaricHesaplarArray': ?instance.haricHesaplarArray,
  'Sirala': ?instance.sirala,
  'EkranTipi': ?instance.ekranTipi,
  'MenuKodu': ?instance.menuKodu,
  'BelgeTipi': ?instance.belgeTipi,
  'BankaKodu': ?instance.bankaKodu,
  'IslemModulu': ?instance.islemModulu,
};

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
  if (instance.bakiye case final value?) 'Bakiye': value,
  if (instance.arrHesapTipi case final value?) 'ArrHesapTipi': value,
  if (instance.haricHesaplarArray case final value?) 'HaricHesaplarArray': value,
  if (instance.sirala case final value?) 'Sirala': value,
  if (instance.ekranTipi case final value?) 'EkranTipi': value,
  if (instance.menuKodu case final value?) 'MenuKodu': value,
  if (instance.belgeTipi case final value?) 'BelgeTipi': value,
  if (instance.bankaKodu case final value?) 'BankaKodu': value,
  if (instance.islemModulu case final value?) 'IslemModulu': value,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_ara_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HucreAraRequestModel _$HucreAraRequestModelFromJson(
  Map<String, dynamic> json,
) => _HucreAraRequestModel(
  barkod: json['Barkod'] as String?,
  ekranTipi: json['EkranTipi'] as String?,
  filtreKodu: (json['FiltreKodu'] as num?)?.toInt(),
  hucreMiktarArray: (json['HucreMiktarArray'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  menuKodu: json['MenuKodu'] as String?,
);

Map<String, dynamic> _$HucreAraRequestModelToJson(
  _HucreAraRequestModel instance,
) => <String, dynamic>{
  'Barkod': ?instance.barkod,
  'EkranTipi': ?instance.ekranTipi,
  'FiltreKodu': ?instance.filtreKodu,
  'HucreMiktarArray': ?instance.hucreMiktarArray,
  'MenuKodu': ?instance.menuKodu,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finans_ozet_rapor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FinansOzetRaporModel _$FinansOzetRaporModelFromJson(
  Map<String, dynamic> json,
) => _FinansOzetRaporModel(
  tabloTipi: json['TABLO_TIPI'] as String?,
  belgeTipi: json['BELGE_TIPI'] as String?,
  ayKodu: (json['AY_KODU'] as num?)?.toInt(),
  tutar1: (json['TUTAR1'] as num?)?.toDouble(),
  tutar2: (json['TUTAR2'] as num?)?.toDouble(),
);

Map<String, dynamic> _$FinansOzetRaporModelToJson(
  _FinansOzetRaporModel instance,
) => <String, dynamic>{
  'TABLO_TIPI': ?instance.tabloTipi,
  'BELGE_TIPI': ?instance.belgeTipi,
  'AY_KODU': ?instance.ayKodu,
  'TUTAR1': ?instance.tutar1,
  'TUTAR2': ?instance.tutar2,
};

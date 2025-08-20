// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_hareketleri_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CariHareketleriRequestModel _$CariHareketleriRequestModelFromJson(
  Map<String, dynamic> json,
) => _CariHareketleriRequestModel(
  siralama: json['SIRALAMA'] as String?,
  sadeceTahsilatlarOdemeler: json['SadeceTahsilatlarOdemeler'] as bool?,
  cariKodu: json['CariKodu'] as String?,
  ekranTipi: json['EkranTipi'] as String?,
  arrPlasiyerKodu: json['ArrPlasiyerKodu'] as String?,
  arrHareketTuru: json['ArrHareketTuru'] as String?,
  baslamaTarihi: json['BaslamaTarihi'] as String?,
  bitisTarihi: json['BitisTarihi'] as String?,
  ba: json['BA'] as String?,
  menuKodu: json['MenuKodu'] as String?,
  kapatilmis: json['Kapatilmis'] as String?,
);

Map<String, dynamic> _$CariHareketleriRequestModelToJson(
  _CariHareketleriRequestModel instance,
) => <String, dynamic>{
  'SIRALAMA': ?instance.siralama,
  'SadeceTahsilatlarOdemeler': ?instance.sadeceTahsilatlarOdemeler,
  'CariKodu': ?instance.cariKodu,
  'EkranTipi': ?instance.ekranTipi,
  'ArrPlasiyerKodu': ?instance.arrPlasiyerKodu,
  'ArrHareketTuru': ?instance.arrHareketTuru,
  'BaslamaTarihi': ?instance.baslamaTarihi,
  'BitisTarihi': ?instance.bitisTarihi,
  'BA': ?instance.ba,
  'MenuKodu': ?instance.menuKodu,
  'Kapatilmis': ?instance.kapatilmis,
};

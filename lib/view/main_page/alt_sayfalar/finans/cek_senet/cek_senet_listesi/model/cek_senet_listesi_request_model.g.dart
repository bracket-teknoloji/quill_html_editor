// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cek_senet_listesi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CekSenetListesiRequestModel _$CekSenetListesiRequestModelFromJson(
  Map<String, dynamic> json,
) => _CekSenetListesiRequestModel(
  verenKodu: json['VerenKodu'] as String?,
  sirala: json['Sirala'] as String?,
  ekranTipi: json['EkranTipi'] as String?,
  yer: json['Yer'] as String?,
  donemTipi: json['DonemTipi'] as String?,
  tarihTipi: json['TarihTipi'] as String?,
  tipi: json['Tipi'] as String?,
  verilenKodu: json['VerilenKodu'] as String?,
  durum: json['Durum'] as String?,
  searchText: json['SearchText'] as String?,
  baslangicTarihi: json['BaslangicTarihi'] as String?,
  bitisTarihi: json['BitisTarihi'] as String?,
);

Map<String, dynamic> _$CekSenetListesiRequestModelToJson(
  _CekSenetListesiRequestModel instance,
) => <String, dynamic>{
  'VerenKodu': ?instance.verenKodu,
  'Sirala': ?instance.sirala,
  'EkranTipi': ?instance.ekranTipi,
  'Yer': ?instance.yer,
  'DonemTipi': ?instance.donemTipi,
  'TarihTipi': ?instance.tarihTipi,
  'Tipi': ?instance.tipi,
  'VerilenKodu': ?instance.verilenKodu,
  'Durum': ?instance.durum,
  'SearchText': ?instance.searchText,
  'BaslangicTarihi': ?instance.baslangicTarihi,
  'BitisTarihi': ?instance.bitisTarihi,
};

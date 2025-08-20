// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_rehberi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StokRehberiRequestModel _$StokRehberiRequestModelFromJson(
  Map<String, dynamic> json,
) => _StokRehberiRequestModel(
  belgeNo: json['BelgeNo'] as String?,
  belgeTarihi: json['BelgeTarihi'] as String?,
  belgeTipi: json['BelgeTipi'] as String?,
  cariKodu: json['CariKodu'] as String?,
  ekranTipi: json['EkranTipi'] as String? ?? "D",
  faturaTipi: (json['FaturaTipi'] as num?)?.toInt(),
  kisitYok: json['KisitYok'] as bool?,
  menuKodu: json['MenuKodu'] as String?,
  resimGoster: json['ResimGoster'] as String?,
  stokKodu: json['StokKodu'] as String?,
  seriTakibiVar: json['SeriTakibiVar'] as String?,
  depoKodu: (json['DepoKodu'] as num?)?.toInt(),
  okutuldu: json['Okutuldu'] as bool?,
  oto: json['Oto'] as String?,
  ozelKod1: json['OzelKod1'] as String?,
  ozelKod2: json['OzelKod2'] as String?,
  barkod2: json['Barkod2'] as String?,
  faturaDepoKodu: (json['FaturaDepoKodu'] as num?)?.toInt(),
  faturaHedefDepo: (json['FaturaHedefDepo'] as num?)?.toInt(),
  kosulKodu: json['KosulKodu'] as String?,
);

Map<String, dynamic> _$StokRehberiRequestModelToJson(
  _StokRehberiRequestModel instance,
) => <String, dynamic>{
  'BelgeNo': ?instance.belgeNo,
  'BelgeTarihi': ?instance.belgeTarihi,
  'BelgeTipi': ?instance.belgeTipi,
  'CariKodu': ?instance.cariKodu,
  'EkranTipi': ?instance.ekranTipi,
  'FaturaTipi': ?instance.faturaTipi,
  'KisitYok': ?instance.kisitYok,
  'MenuKodu': ?instance.menuKodu,
  'ResimGoster': ?instance.resimGoster,
  'StokKodu': ?instance.stokKodu,
  'SeriTakibiVar': ?instance.seriTakibiVar,
  'DepoKodu': ?instance.depoKodu,
  'Okutuldu': ?instance.okutuldu,
  'Oto': ?instance.oto,
  'OzelKod1': ?instance.ozelKod1,
  'OzelKod2': ?instance.ozelKod2,
  'Barkod2': ?instance.barkod2,
  'FaturaDepoKodu': ?instance.faturaDepoKodu,
  'FaturaHedefDepo': ?instance.faturaHedefDepo,
  'KosulKodu': ?instance.kosulKodu,
};

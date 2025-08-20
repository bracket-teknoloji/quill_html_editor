// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_listesi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CariListesiRequestModel _$CariListesiRequestModelFromJson(
  Map<String, dynamic> json,
) => _CariListesiRequestModel(
  eFaturaGoster: json['EFaturaGoster'] as bool?,
  siralama: json['SIRALAMA'] as String? ?? "AZ",
  sayfa: (json['Sayfa'] as num?)?.toInt() ?? 1,
  menuKodu: json['MenuKodu'] as String? ?? "CARI_CREH",
  filterText: json['FilterText'] as String? ?? "",
  kod: json['Kod'] as String? ?? "",
  cariKodu: json['CariKodu'] as String?,
  baslamaTarihi: json['BaslamaTarihi'] == null
      ? null
      : DateTime.parse(json['BaslamaTarihi'] as String),
  bitisTarihi: json['BitisTarihi'] == null
      ? null
      : DateTime.parse(json['BitisTarihi'] as String),
  filtreler: (json['Filtreler'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  kullanici: json['Kullanici'] as String?,
  arrPlasiyer: (json['ArrPlasiyer'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  arrKod1: (json['ArrKod1'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  arrKod2: (json['ArrKod2'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  arrKod3: (json['ArrKod3'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  arrKod4: (json['ArrKod4'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  arrKod5: (json['ArrKod5'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  arrSehir: (json['ArrSehir'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  arrGrupKodu: (json['ArrGrupKodu'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  ilce: json['Ilce'] as String?,
  cariTipi: json['CariTipi'] as String?,
  filterBakiye: json['FILTER_BAKIYE'] as String?,
  bagliCariKodu: json['BagliCariKodu'] as String?,
  belgeTuru: json['BelgeTuru'] as String?,
  teslimCari: json['TeslimCari'] as String?,
  sehir: json['Sehir'] as String?,
  siparisKarsilanmaDurumu: json['SiparisKarsilanmaDurumu'] as String?,
  searchText: json['SearchText'] as String?,
  secildi: json['Secildi'] as String?,
);

Map<String, dynamic> _$CariListesiRequestModelToJson(
  _CariListesiRequestModel instance,
) => <String, dynamic>{
  'EFaturaGoster': ?instance.eFaturaGoster,
  'SIRALAMA': ?instance.siralama,
  'Sayfa': ?instance.sayfa,
  'MenuKodu': ?instance.menuKodu,
  'FilterText': ?instance.filterText,
  'Kod': ?instance.kod,
  'CariKodu': ?instance.cariKodu,
  'BaslamaTarihi': ?instance.baslamaTarihi?.toIso8601String(),
  'BitisTarihi': ?instance.bitisTarihi?.toIso8601String(),
  'Filtreler': ?instance.filtreler,
  'Kullanici': ?instance.kullanici,
  'ArrPlasiyer': ?instance.arrPlasiyer,
  'ArrKod1': ?instance.arrKod1,
  'ArrKod2': ?instance.arrKod2,
  'ArrKod3': ?instance.arrKod3,
  'ArrKod4': ?instance.arrKod4,
  'ArrKod5': ?instance.arrKod5,
  'ArrSehir': ?instance.arrSehir,
  'ArrGrupKodu': ?instance.arrGrupKodu,
  'Ilce': ?instance.ilce,
  'CariTipi': ?instance.cariTipi,
  'FILTER_BAKIYE': ?instance.filterBakiye,
  'BagliCariKodu': ?instance.bagliCariKodu,
  'BelgeTuru': ?instance.belgeTuru,
  'TeslimCari': ?instance.teslimCari,
  'Sehir': ?instance.sehir,
  'SiparisKarsilanmaDurumu': ?instance.siparisKarsilanmaDurumu,
  'SearchText': ?instance.searchText,
  'Secildi': ?instance.secildi,
};

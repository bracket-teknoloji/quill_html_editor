// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_listesi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CariListesiRequestModelImpl _$$CariListesiRequestModelImplFromJson(Map<String, dynamic> json) =>
    _$CariListesiRequestModelImpl(
      eFaturaGoster: json['EFaturaGoster'] as bool?,
      siralama: json['SIRALAMA'] as String? ?? "AZ",
      sayfa: (json['Sayfa'] as num?)?.toInt() ?? 1,
      menuKodu: json['MenuKodu'] as String? ?? "CARI_CREH",
      filterText: json['FilterText'] as String? ?? "",
      kod: json['Kod'] as String? ?? "",
      cariKodu: json['CariKodu'] as String?,
      baslamaTarihi: json['BaslamaTarihi'] == null ? null : DateTime.parse(json['BaslamaTarihi'] as String),
      bitisTarihi: json['BitisTarihi'] == null ? null : DateTime.parse(json['BitisTarihi'] as String),
      filtreler: (json['Filtreler'] as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
      kullanici: json['Kullanici'] as String?,
      arrPlasiyer: (json['ArrPlasiyer'] as List<dynamic>?)?.map((e) => e as String).toList(),
      arrKod1: (json['ArrKod1'] as List<dynamic>?)?.map((e) => e as String).toList(),
      arrKod2: (json['ArrKod2'] as List<dynamic>?)?.map((e) => e as String).toList(),
      arrKod3: (json['ArrKod3'] as List<dynamic>?)?.map((e) => e as String).toList(),
      arrKod4: (json['ArrKod4'] as List<dynamic>?)?.map((e) => e as String).toList(),
      arrKod5: (json['ArrKod5'] as List<dynamic>?)?.map((e) => e as String).toList(),
      arrSehir: (json['ArrSehir'] as List<dynamic>?)?.map((e) => e as String).toList(),
      arrGrupKodu: (json['ArrGrupKodu'] as List<dynamic>?)?.map((e) => e as String).toList(),
      ilce: json['Ilce'] as String?,
      cariTipi: json['CariTipi'] as String?,
      filterBakiye: json['FILTER_BAKIYE'] as String?,
      bagliCariKodu: json['BagliCariKodu'] as String?,
      belgeTuru: json['BelgeTuru'] as String?,
      teslimCari: json['TeslimCari'] as String?,
      sehir: json['Sehir'] as String?,
      siparisKarsilanmaDurumu: json['SiparisKarsilanmaDurumu'] as String?,
      searchText: json['SearchText'] as String?,
    );

Map<String, dynamic> _$$CariListesiRequestModelImplToJson(_$CariListesiRequestModelImpl instance) => <String, dynamic>{
  if (instance.eFaturaGoster case final value?) 'EFaturaGoster': value,
  if (instance.siralama case final value?) 'SIRALAMA': value,
  if (instance.sayfa case final value?) 'Sayfa': value,
  if (instance.menuKodu case final value?) 'MenuKodu': value,
  if (instance.filterText case final value?) 'FilterText': value,
  if (instance.kod case final value?) 'Kod': value,
  if (instance.cariKodu case final value?) 'CariKodu': value,
  if (instance.baslamaTarihi?.toIso8601String() case final value?) 'BaslamaTarihi': value,
  if (instance.bitisTarihi?.toIso8601String() case final value?) 'BitisTarihi': value,
  if (instance.filtreler case final value?) 'Filtreler': value,
  if (instance.kullanici case final value?) 'Kullanici': value,
  if (instance.arrPlasiyer case final value?) 'ArrPlasiyer': value,
  if (instance.arrKod1 case final value?) 'ArrKod1': value,
  if (instance.arrKod2 case final value?) 'ArrKod2': value,
  if (instance.arrKod3 case final value?) 'ArrKod3': value,
  if (instance.arrKod4 case final value?) 'ArrKod4': value,
  if (instance.arrKod5 case final value?) 'ArrKod5': value,
  if (instance.arrSehir case final value?) 'ArrSehir': value,
  if (instance.arrGrupKodu case final value?) 'ArrGrupKodu': value,
  if (instance.ilce case final value?) 'Ilce': value,
  if (instance.cariTipi case final value?) 'CariTipi': value,
  if (instance.filterBakiye case final value?) 'FILTER_BAKIYE': value,
  if (instance.bagliCariKodu case final value?) 'BagliCariKodu': value,
  if (instance.belgeTuru case final value?) 'BelgeTuru': value,
  if (instance.teslimCari case final value?) 'TeslimCari': value,
  if (instance.sehir case final value?) 'Sehir': value,
  if (instance.siparisKarsilanmaDurumu case final value?) 'SiparisKarsilanmaDurumu': value,
  if (instance.searchText case final value?) 'SearchText': value,
};

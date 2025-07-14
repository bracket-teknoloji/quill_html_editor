// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CariRequestModel _$CariRequestModelFromJson(Map<String, dynamic> json) => _CariRequestModel(
  filterText: json['FilterText'] as String? ?? "",
  kod: (json['Kod'] as List<dynamic>?)?.map((e) => e as String).toList(),
  sayfa: (json['Sayfa'] as num?)?.toInt(),
  ilce: json['Ilce'] as String?,
  cariTipi: json['CariTipi'] as String?,
  siralama: json['SIRALAMA'] as String?,
  menuKodu: json['MenuKodu'] as String?,
  eFaturaGoster: json['EFaturaGoster'] as bool?,
  bagliCariKodu: json['BagliCariKodu'] as String?,
  filterBakiye: json['FILTER_BAKIYE'] as String?,
  arrGrupKodu: (json['ArrGrupKodu'] as List<dynamic>?)?.map((e) => e as String).toList(),
  arrKod1: (json['ArrKod1'] as List<dynamic>?)?.map((e) => e as String).toList(),
  arrKod2: (json['ArrKod2'] as List<dynamic>?)?.map((e) => e as String).toList(),
  arrKod3: (json['ArrKod3'] as List<dynamic>?)?.map((e) => e as String).toList(),
  arrKod4: (json['ArrKod4'] as List<dynamic>?)?.map((e) => e as String).toList(),
  arrKod5: (json['ArrKod5'] as List<dynamic>?)?.map((e) => e as String).toList(),
  arrSehir: (json['ArrSehir'] as List<dynamic>?)?.map((e) => e as String).toList(),
  arrPlasiyerKodu: (json['ArrPlasiyerKodu'] as List<dynamic>?)?.map((e) => e as String).toList(),
  plasiyerKisitiYok: json['PlasiyerKisitiYok'] as bool?,
  belgeTuru: json['BelgeTuru'] as String?,
  vergiNo: json['VergiNo'] as String?,
  siparisKarsilanmaDurumu: json['SiparisKarsilanmaDurumu'] as String?,
  kisitYok: json['KisitYok'] as bool?,
  secildi: json['Secildi'] as String?,
  teslimCari: json['TeslimCari'] as String?,
  rotaDisi: json['RotaDisi'] as String?,
);

Map<String, dynamic> _$CariRequestModelToJson(
  _CariRequestModel instance,
) => <String, dynamic>{
  if (instance.filterText case final value?) 'FilterText': value,
  if (instance.kod case final value?) 'Kod': value,
  if (instance.sayfa case final value?) 'Sayfa': value,
  if (instance.ilce case final value?) 'Ilce': value,
  if (instance.cariTipi case final value?) 'CariTipi': value,
  if (instance.siralama case final value?) 'SIRALAMA': value,
  if (instance.menuKodu case final value?) 'MenuKodu': value,
  if (instance.eFaturaGoster case final value?) 'EFaturaGoster': value,
  if (instance.bagliCariKodu case final value?) 'BagliCariKodu': value,
  if (instance.filterBakiye case final value?) 'FILTER_BAKIYE': value,
  if (instance.arrGrupKodu case final value?) 'ArrGrupKodu': value,
  if (instance.arrKod1 case final value?) 'ArrKod1': value,
  if (instance.arrKod2 case final value?) 'ArrKod2': value,
  if (instance.arrKod3 case final value?) 'ArrKod3': value,
  if (instance.arrKod4 case final value?) 'ArrKod4': value,
  if (instance.arrKod5 case final value?) 'ArrKod5': value,
  if (instance.arrSehir case final value?) 'ArrSehir': value,
  if (instance.arrPlasiyerKodu case final value?) 'ArrPlasiyerKodu': value,
  if (instance.plasiyerKisitiYok case final value?) 'PlasiyerKisitiYok': value,
  if (instance.belgeTuru case final value?) 'BelgeTuru': value,
  if (instance.vergiNo case final value?) 'VergiNo': value,
  if (instance.siparisKarsilanmaDurumu case final value?) 'SiparisKarsilanmaDurumu': value,
  if (instance.kisitYok case final value?) 'KisitYok': value,
  if (instance.secildi case final value?) 'Secildi': value,
  if (instance.teslimCari case final value?) 'TeslimCari': value,
  if (instance.rotaDisi case final value?) 'RotaDisi': value,
};

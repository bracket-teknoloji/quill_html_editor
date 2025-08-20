// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CariRequestModel _$CariRequestModelFromJson(Map<String, dynamic> json) =>
    _CariRequestModel(
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
      arrGrupKodu: (json['ArrGrupKodu'] as List<dynamic>?)
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
      arrPlasiyerKodu: (json['ArrPlasiyerKodu'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      plasiyerKisitiYok: json['PlasiyerKisitiYok'] as bool?,
      belgeTuru: json['BelgeTuru'] as String?,
      vergiNo: json['VergiNo'] as String?,
      siparisKarsilanmaDurumu: json['SiparisKarsilanmaDurumu'] as String?,
      kisitYok: json['KisitYok'] as bool?,
      secildi: json['Secildi'] as String?,
      teslimCari: json['TeslimCari'] as String?,
      rotaDisi: json['RotaDisi'] as String?,
    );

Map<String, dynamic> _$CariRequestModelToJson(_CariRequestModel instance) =>
    <String, dynamic>{
      'FilterText': ?instance.filterText,
      'Kod': ?instance.kod,
      'Sayfa': ?instance.sayfa,
      'Ilce': ?instance.ilce,
      'CariTipi': ?instance.cariTipi,
      'SIRALAMA': ?instance.siralama,
      'MenuKodu': ?instance.menuKodu,
      'EFaturaGoster': ?instance.eFaturaGoster,
      'BagliCariKodu': ?instance.bagliCariKodu,
      'FILTER_BAKIYE': ?instance.filterBakiye,
      'ArrGrupKodu': ?instance.arrGrupKodu,
      'ArrKod1': ?instance.arrKod1,
      'ArrKod2': ?instance.arrKod2,
      'ArrKod3': ?instance.arrKod3,
      'ArrKod4': ?instance.arrKod4,
      'ArrKod5': ?instance.arrKod5,
      'ArrSehir': ?instance.arrSehir,
      'ArrPlasiyerKodu': ?instance.arrPlasiyerKodu,
      'PlasiyerKisitiYok': ?instance.plasiyerKisitiYok,
      'BelgeTuru': ?instance.belgeTuru,
      'VergiNo': ?instance.vergiNo,
      'SiparisKarsilanmaDurumu': ?instance.siparisKarsilanmaDurumu,
      'KisitYok': ?instance.kisitYok,
      'Secildi': ?instance.secildi,
      'TeslimCari': ?instance.teslimCari,
      'RotaDisi': ?instance.rotaDisi,
    };

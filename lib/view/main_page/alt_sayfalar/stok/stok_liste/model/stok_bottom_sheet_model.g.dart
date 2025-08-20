// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_bottom_sheet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StokBottomSheetModel _$StokBottomSheetModelFromJson(
  Map<String, dynamic> json,
) => _StokBottomSheetModel(
  sayfa: (json['Sayfa'] as num?)?.toInt(),
  bakiyeDurumu: json['BakiyeDurumu'] as String?,
  menuKodu: json['MenuKodu'] as String?,
  resimleriGoster: json['ResimleriGoster'] as String?,
  siralama: json['Siralama'] as String? ?? "AZ",
  searchText: json['SearchText'] as String?,
  belgeNo: json['BelgeNo'] as String?,
  belgeTarihi: json['BelgeTarihi'] as String?,
  belgeTipi: json['BelgeTipi'] as String?,
  cariKodu: json['CariKodu'] as String?,
  faturaDepoKodu: (json['FaturaDepoKodu'] as num?)?.toInt(),
  ekranTipi: json['EkranTipi'] as String? ?? "R",
  faturaTipi: (json['FaturaTipi'] as num?)?.toInt(),
  resimGoster: json['ResimGoster'] as String?,
  kisitYok: json['KisitYok'] as bool?,
  stokKodu: json['StokKodu'] as String?,
  okutuldu: json['Okutuldu'] as bool?,
  seriTakibiVar: json['SeriTakibiVar'] as String?,
  fiyatGrubu: json['FiyatGrubu'] as String?,
  ozelKod1: json['OzelKod1'] as String?,
  ozelKod2: json['OzelKod2'] as String?,
  searchList: (json['SearchList'] as List<dynamic>?)
      ?.map((e) => StokDetayliAramaAlanlar.fromJson(e as Map<String, dynamic>))
      .toList(),
  arrGrupKodu:
      (json['ArrGrupKodu'] as List<dynamic>?)
          ?.map((e) => BaseGrupKoduModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  arrKod1:
      (json['ArrKod1'] as List<dynamic>?)
          ?.map((e) => BaseGrupKoduModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  arrKod2:
      (json['ArrKod2'] as List<dynamic>?)
          ?.map((e) => BaseGrupKoduModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  arrKod3:
      (json['ArrKod3'] as List<dynamic>?)
          ?.map((e) => BaseGrupKoduModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  arrKod4:
      (json['ArrKod4'] as List<dynamic>?)
          ?.map((e) => BaseGrupKoduModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  arrKod5:
      (json['ArrKod5'] as List<dynamic>?)
          ?.map((e) => BaseGrupKoduModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  receteliStoklar: json['ReceteliStoklar'] as bool?,
);

Map<String, dynamic> _$StokBottomSheetModelToJson(
  _StokBottomSheetModel instance,
) => <String, dynamic>{
  'Sayfa': ?instance.sayfa,
  'BakiyeDurumu': ?instance.bakiyeDurumu,
  'MenuKodu': ?instance.menuKodu,
  'ResimleriGoster': ?instance.resimleriGoster,
  'Siralama': ?instance.siralama,
  'SearchText': ?instance.searchText,
  'BelgeNo': ?instance.belgeNo,
  'BelgeTarihi': ?instance.belgeTarihi,
  'BelgeTipi': ?instance.belgeTipi,
  'CariKodu': ?instance.cariKodu,
  'FaturaDepoKodu': ?instance.faturaDepoKodu,
  'EkranTipi': ?instance.ekranTipi,
  'FaturaTipi': ?instance.faturaTipi,
  'ResimGoster': ?instance.resimGoster,
  'KisitYok': ?instance.kisitYok,
  'StokKodu': ?instance.stokKodu,
  'Okutuldu': ?instance.okutuldu,
  'SeriTakibiVar': ?instance.seriTakibiVar,
  'FiyatGrubu': ?instance.fiyatGrubu,
  'OzelKod1': ?instance.ozelKod1,
  'OzelKod2': ?instance.ozelKod2,
  'SearchList': ?instance.searchList?.map((e) => e.toJson()).toList(),
  'ArrGrupKodu': ?instance.arrGrupKodu?.map((e) => e.toJson()).toList(),
  'ArrKod1': ?instance.arrKod1?.map((e) => e.toJson()).toList(),
  'ArrKod2': ?instance.arrKod2?.map((e) => e.toJson()).toList(),
  'ArrKod3': ?instance.arrKod3?.map((e) => e.toJson()).toList(),
  'ArrKod4': ?instance.arrKod4?.map((e) => e.toJson()).toList(),
  'ArrKod5': ?instance.arrKod5?.map((e) => e.toJson()).toList(),
  'ReceteliStoklar': ?instance.receteliStoklar,
};

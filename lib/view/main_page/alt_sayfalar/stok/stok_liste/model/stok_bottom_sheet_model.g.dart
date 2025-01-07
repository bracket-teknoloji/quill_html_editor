// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_bottom_sheet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StokBottomSheetModelImpl _$$StokBottomSheetModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StokBottomSheetModelImpl(
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
          ?.map((e) =>
              StokDetayliAramaAlanlar.fromJson(e as Map<String, dynamic>))
          .toList(),
      arrGrupKodu: (json['ArrGrupKodu'] as List<dynamic>?)
              ?.map(
                  (e) => BaseGrupKoduModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      arrKod1: (json['ArrKod1'] as List<dynamic>?)
              ?.map(
                  (e) => BaseGrupKoduModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      arrKod2: (json['ArrKod2'] as List<dynamic>?)
              ?.map(
                  (e) => BaseGrupKoduModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      arrKod3: (json['ArrKod3'] as List<dynamic>?)
              ?.map(
                  (e) => BaseGrupKoduModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      arrKod4: (json['ArrKod4'] as List<dynamic>?)
              ?.map(
                  (e) => BaseGrupKoduModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      arrKod5: (json['ArrKod5'] as List<dynamic>?)
              ?.map(
                  (e) => BaseGrupKoduModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      receteliStoklar: json['ReceteliStoklar'] as bool?,
    );

Map<String, dynamic> _$$StokBottomSheetModelImplToJson(
        _$StokBottomSheetModelImpl instance) =>
    <String, dynamic>{
      if (instance.sayfa case final value?) 'Sayfa': value,
      if (instance.bakiyeDurumu case final value?) 'BakiyeDurumu': value,
      if (instance.menuKodu case final value?) 'MenuKodu': value,
      if (instance.resimleriGoster case final value?) 'ResimleriGoster': value,
      if (instance.siralama case final value?) 'Siralama': value,
      if (instance.searchText case final value?) 'SearchText': value,
      if (instance.belgeNo case final value?) 'BelgeNo': value,
      if (instance.belgeTarihi case final value?) 'BelgeTarihi': value,
      if (instance.belgeTipi case final value?) 'BelgeTipi': value,
      if (instance.cariKodu case final value?) 'CariKodu': value,
      if (instance.ekranTipi case final value?) 'EkranTipi': value,
      if (instance.faturaTipi case final value?) 'FaturaTipi': value,
      if (instance.resimGoster case final value?) 'ResimGoster': value,
      if (instance.kisitYok case final value?) 'KisitYok': value,
      if (instance.stokKodu case final value?) 'StokKodu': value,
      if (instance.okutuldu case final value?) 'Okutuldu': value,
      if (instance.seriTakibiVar case final value?) 'SeriTakibiVar': value,
      if (instance.fiyatGrubu case final value?) 'FiyatGrubu': value,
      if (instance.ozelKod1 case final value?) 'OzelKod1': value,
      if (instance.ozelKod2 case final value?) 'OzelKod2': value,
      if (instance.searchList?.map((e) => e.toJson()).toList()
          case final value?)
        'SearchList': value,
      if (instance.arrGrupKodu?.map((e) => e.toJson()).toList()
          case final value?)
        'ArrGrupKodu': value,
      if (instance.arrKod1?.map((e) => e.toJson()).toList() case final value?)
        'ArrKod1': value,
      if (instance.arrKod2?.map((e) => e.toJson()).toList() case final value?)
        'ArrKod2': value,
      if (instance.arrKod3?.map((e) => e.toJson()).toList() case final value?)
        'ArrKod3': value,
      if (instance.arrKod4?.map((e) => e.toJson()).toList() case final value?)
        'ArrKod4': value,
      if (instance.arrKod5?.map((e) => e.toJson()).toList() case final value?)
        'ArrKod5': value,
      if (instance.receteliStoklar case final value?) 'ReceteliStoklar': value,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_bottom_sheet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StokBottomSheetModel _$$_StokBottomSheetModelFromJson(
        Map<String, dynamic> json) =>
    _$_StokBottomSheetModel(
      sayfa: json['Sayfa'] as int?,
      bakiyeDurumu: json['BakiyeDurumu'] as String?,
      menuKodu: json['MenuKodu'] as String?,
      resimleriGoster: json['ResimleriGoster'] as String?,
      siralama: json['Siralama'] as String?,
      searchText: json['SearchText'] as String?,
      belgeNo: json['BelgeNo'] as String?,
      belgeTarihi: json['BelgeTarihi'] as String?,
      belgeTipi: json['BelgeTipi'] as String?,
      cariKodu: json['CariKodu'] as String?,
      ekranTipi: json['EkranTipi'] as String?,
      faturaTipi: json['FaturaTipi'] as int?,
      resimGoster: json['ResimGoster'] as String?,
      kisitYok: json['KisitYok'] as bool?,
      stokKodu: json['StokKodu'] as String?,
      okutuldu: json['Okutuldu'] as bool?,
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
    );

Map<String, dynamic> _$$_StokBottomSheetModelToJson(
    _$_StokBottomSheetModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Sayfa', instance.sayfa);
  writeNotNull('BakiyeDurumu', instance.bakiyeDurumu);
  writeNotNull('MenuKodu', instance.menuKodu);
  writeNotNull('ResimleriGoster', instance.resimleriGoster);
  writeNotNull('Siralama', instance.siralama);
  writeNotNull('SearchText', instance.searchText);
  writeNotNull('BelgeNo', instance.belgeNo);
  writeNotNull('BelgeTarihi', instance.belgeTarihi);
  writeNotNull('BelgeTipi', instance.belgeTipi);
  writeNotNull('CariKodu', instance.cariKodu);
  writeNotNull('EkranTipi', instance.ekranTipi);
  writeNotNull('FaturaTipi', instance.faturaTipi);
  writeNotNull('ResimGoster', instance.resimGoster);
  writeNotNull('KisitYok', instance.kisitYok);
  writeNotNull('StokKodu', instance.stokKodu);
  writeNotNull('Okutuldu', instance.okutuldu);
  writeNotNull(
      'ArrGrupKodu', instance.arrGrupKodu?.map((e) => e.toJson()).toList());
  writeNotNull('ArrKod1', instance.arrKod1?.map((e) => e.toJson()).toList());
  writeNotNull('ArrKod2', instance.arrKod2?.map((e) => e.toJson()).toList());
  writeNotNull('ArrKod3', instance.arrKod3?.map((e) => e.toJson()).toList());
  writeNotNull('ArrKod4', instance.arrKod4?.map((e) => e.toJson()).toList());
  writeNotNull('ArrKod5', instance.arrKod5?.map((e) => e.toJson()).toList());
  return val;
}

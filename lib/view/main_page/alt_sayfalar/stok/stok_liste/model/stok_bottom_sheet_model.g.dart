// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_bottom_sheet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokBottomSheetModel _$StokBottomSheetModelFromJson(
        Map<String, dynamic> json) =>
    StokBottomSheetModel(
      sayfa: json['Sayfa'] as int?,
      bakiyeDurumu: json['BakiyeDurumu'] as String?,
      menuKodu: json['MenuKodu'] as String?,
      resimleriGoster: json['ResimleriGoster'] as String?,
      siralama: json['Siralama'] as String?,
      searchText: json['SearchText'] as String?,
      arrGrupKodu: (json['ArrGrupKodu'] as List<dynamic>?)
          ?.map((e) => BaseGrupKoduModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      arrKod1: (json['ArrKod1'] as List<dynamic>?)
          ?.map((e) => BaseGrupKoduModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      arrKod2: (json['ArrKod2'] as List<dynamic>?)
          ?.map((e) => BaseGrupKoduModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      arrKod3: (json['ArrKod3'] as List<dynamic>?)
          ?.map((e) => BaseGrupKoduModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      arrKod4: (json['ArrKod4'] as List<dynamic>?)
          ?.map((e) => BaseGrupKoduModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      arrKod5: (json['ArrKod5'] as List<dynamic>?)
          ?.map((e) => BaseGrupKoduModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StokBottomSheetModelToJson(
    StokBottomSheetModel instance) {
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
  writeNotNull('ArrGrupKodu', instance.arrGrupKodu);
  writeNotNull('ArrKod1', instance.arrKod1);
  writeNotNull('ArrKod2', instance.arrKod2);
  writeNotNull('ArrKod3', instance.arrKod3);
  writeNotNull('ArrKod4', instance.arrKod4);
  writeNotNull('ArrKod5', instance.arrKod5);
  return val;
}

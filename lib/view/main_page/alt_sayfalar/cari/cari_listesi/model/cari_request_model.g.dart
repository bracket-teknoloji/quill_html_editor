// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CariRequestModelImpl _$$CariRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CariRequestModelImpl(
      sayfa: json['SAYFA'] as int?,
      ilce: json['ILCE'] as String?,
      cariTipi: json['CARI_TIPI'] as String?,
      siralama: json['SIRALAMA'] as String?,
      menuKodu: json['MENU_KODU'] as String?,
      filterText: json['FILTER_TEXT'] as String?,
      eFaturaGoster: json['E_FATURA_GOSTER'] as bool?,
      filterBakiye: json['FILTER_BAKIYE'] as String?,
      kod: (json['KOD'] as List<dynamic>?)?.map((e) => e as String).toList(),
      arrKod5: (json['ARR_KOD5'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      arrSehir: (json['ARR_SEHIR'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      arrPlasiyerKodu: (json['ARR_PLASIYER_KODU'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CariRequestModelImplToJson(
    _$CariRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SAYFA', instance.sayfa);
  writeNotNull('ILCE', instance.ilce);
  writeNotNull('CARI_TIPI', instance.cariTipi);
  writeNotNull('SIRALAMA', instance.siralama);
  writeNotNull('MENU_KODU', instance.menuKodu);
  writeNotNull('FILTER_TEXT', instance.filterText);
  writeNotNull('E_FATURA_GOSTER', instance.eFaturaGoster);
  writeNotNull('FILTER_BAKIYE', instance.filterBakiye);
  writeNotNull('KOD', instance.kod);
  writeNotNull('ARR_KOD5', instance.arrKod5);
  writeNotNull('ARR_SEHIR', instance.arrSehir);
  writeNotNull('ARR_PLASIYER_KODU', instance.arrPlasiyerKodu);
  return val;
}

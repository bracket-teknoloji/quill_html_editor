// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finans_ozet_rapor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FinansOzetRaporModelImpl _$$FinansOzetRaporModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FinansOzetRaporModelImpl(
      tabloTipi: json['TABLO_TIPI'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      ayKodu: json['AY_KODU'] as int?,
      tutar1: (json['TUTAR1'] as num?)?.toDouble(),
      tutar2: (json['TUTAR2'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$FinansOzetRaporModelImplToJson(
    _$FinansOzetRaporModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TABLO_TIPI', instance.tabloTipi);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('AY_KODU', instance.ayKodu);
  writeNotNull('TUTAR1', instance.tutar1);
  writeNotNull('TUTAR2', instance.tutar2);
  return val;
}

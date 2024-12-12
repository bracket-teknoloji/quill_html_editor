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
      ayKodu: (json['AY_KODU'] as num?)?.toInt(),
      tutar1: (json['TUTAR1'] as num?)?.toDouble(),
      tutar2: (json['TUTAR2'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$FinansOzetRaporModelImplToJson(
        _$FinansOzetRaporModelImpl instance) =>
    <String, dynamic>{
      if (instance.tabloTipi case final value?) 'TABLO_TIPI': value,
      if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
      if (instance.ayKodu case final value?) 'AY_KODU': value,
      if (instance.tutar1 case final value?) 'TUTAR1': value,
      if (instance.tutar2 case final value?) 'TUTAR2': value,
    };

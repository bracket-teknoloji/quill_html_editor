// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_ara_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HucreAraRequestModelImpl _$$HucreAraRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HucreAraRequestModelImpl(
      barkod: json['Barkod'] as String?,
      ekranTipi: json['EkranTipi'] as String?,
      filtreKodu: (json['FiltreKodu'] as num?)?.toInt(),
      hucreMiktarArray:
          (json['HucreMiktarArray'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      menuKodu: json['MenuKodu'] as String?,
    );

Map<String, dynamic> _$$HucreAraRequestModelImplToJson(
        _$HucreAraRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.barkod case final value?) 'Barkod': value,
      if (instance.ekranTipi case final value?) 'EkranTipi': value,
      if (instance.filtreKodu case final value?) 'FiltreKodu': value,
      if (instance.hucreMiktarArray case final value?)
        'HucreMiktarArray': value,
      if (instance.menuKodu case final value?) 'MenuKodu': value,
    };

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
    _$HucreAraRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Barkod', instance.barkod);
  writeNotNull('EkranTipi', instance.ekranTipi);
  writeNotNull('FiltreKodu', instance.filtreKodu);
  writeNotNull('HucreMiktarArray', instance.hucreMiktarArray);
  writeNotNull('MenuKodu', instance.menuKodu);
  return val;
}

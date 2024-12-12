// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_hareketleri_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HucreHareketleriRequestModelImpl _$$HucreHareketleriRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HucreHareketleriRequestModelImpl(
      ekranTipi: json['EkranTipi'] as String?,
      filtreKodu: (json['FiltreKodu'] as num?)?.toInt(),
      stokKodu: json['StokKodu'] as String?,
    );

Map<String, dynamic> _$$HucreHareketleriRequestModelImplToJson(
        _$HucreHareketleriRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.ekranTipi case final value?) 'EkranTipi': value,
      if (instance.filtreKodu case final value?) 'FiltreKodu': value,
      if (instance.stokKodu case final value?) 'StokKodu': value,
    };

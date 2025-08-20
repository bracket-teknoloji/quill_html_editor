// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_hareketleri_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HucreHareketleriRequestModel _$HucreHareketleriRequestModelFromJson(
  Map<String, dynamic> json,
) => _HucreHareketleriRequestModel(
  ekranTipi: json['EkranTipi'] as String?,
  filtreKodu: (json['FiltreKodu'] as num?)?.toInt(),
  stokKodu: json['StokKodu'] as String?,
);

Map<String, dynamic> _$HucreHareketleriRequestModelToJson(
  _HucreHareketleriRequestModel instance,
) => <String, dynamic>{
  'EkranTipi': ?instance.ekranTipi,
  'FiltreKodu': ?instance.filtreKodu,
  'StokKodu': ?instance.stokKodu,
};

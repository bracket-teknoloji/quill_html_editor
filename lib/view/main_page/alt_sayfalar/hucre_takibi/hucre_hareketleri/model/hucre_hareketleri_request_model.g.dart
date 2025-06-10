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
  if (instance.ekranTipi case final value?) 'EkranTipi': value,
  if (instance.filtreKodu case final value?) 'FiltreKodu': value,
  if (instance.stokKodu case final value?) 'StokKodu': value,
};

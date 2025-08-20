// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_girisi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OlcumGirisiRequestModel _$OlcumGirisiRequestModelFromJson(
  Map<String, dynamic> json,
) => _OlcumGirisiRequestModel(
  durum: (json['DURUM'] as num?)?.toInt(),
  belgeTipi: json['BELGE_TIPI'] as String?,
  bastar: json['BASTAR'] as String?,
  bittar: json['BITTAR'] as String?,
  siralama: json['SIRALAMA'] as String?,
  qrstring: json['QRSTRING'] as String?,
  searchText: json['SearchText'] as String?,
  sayfa: (json['Sayfa'] as num?)?.toInt(),
);

Map<String, dynamic> _$OlcumGirisiRequestModelToJson(
  _OlcumGirisiRequestModel instance,
) => <String, dynamic>{
  'DURUM': ?instance.durum,
  'BELGE_TIPI': ?instance.belgeTipi,
  'BASTAR': ?instance.bastar,
  'BITTAR': ?instance.bittar,
  'SIRALAMA': ?instance.siralama,
  'QRSTRING': ?instance.qrstring,
  'SearchText': ?instance.searchText,
  'Sayfa': ?instance.sayfa,
};

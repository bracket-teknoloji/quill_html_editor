// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_hareketleri_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeriHareketleriRequestModel _$SeriHareketleriRequestModelFromJson(
  Map<String, dynamic> json,
) => _SeriHareketleriRequestModel(
  stokKodu: json['StokKodu'] as String?,
  seriNo: json['SeriNo'] as String?,
  sirala: json['Sirala'] as String? ?? 'TARIH_ZA',
  belgeNo: json['BelgeNo'] as String?,
  belgeTipi: json['BelgeTipi'] as String?,
  hareketId: (json['HareketID'] as num?)?.toInt(),
  tempGetir: json['TempGetir'] as String?,
);

Map<String, dynamic> _$SeriHareketleriRequestModelToJson(
  _SeriHareketleriRequestModel instance,
) => <String, dynamic>{
  'StokKodu': ?instance.stokKodu,
  'SeriNo': ?instance.seriNo,
  'Sirala': ?instance.sirala,
  'BelgeNo': ?instance.belgeNo,
  'BelgeTipi': ?instance.belgeTipi,
  'HareketID': ?instance.hareketId,
  'TempGetir': ?instance.tempGetir,
};

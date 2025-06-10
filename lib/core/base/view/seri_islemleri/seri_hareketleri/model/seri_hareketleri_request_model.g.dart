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
  if (instance.stokKodu case final value?) 'StokKodu': value,
  if (instance.seriNo case final value?) 'SeriNo': value,
  if (instance.sirala case final value?) 'Sirala': value,
  if (instance.belgeNo case final value?) 'BelgeNo': value,
  if (instance.belgeTipi case final value?) 'BelgeTipi': value,
  if (instance.hareketId case final value?) 'HareketID': value,
  if (instance.tempGetir case final value?) 'TempGetir': value,
};

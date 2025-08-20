// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_raporu_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UretimSonuRaporuRequestModel _$UretimSonuRaporuRequestModelFromJson(
  Map<String, dynamic> json,
) => _UretimSonuRaporuRequestModel(
  belgeNo: json['BelgeNo'] as String?,
  filtreKodu: (json['FiltreKodu'] as num?)?.toInt(),
  stokKodu: json['StokKodu'] as String?,
);

Map<String, dynamic> _$UretimSonuRaporuRequestModelToJson(
  _UretimSonuRaporuRequestModel instance,
) => <String, dynamic>{
  'BelgeNo': ?instance.belgeNo,
  'FiltreKodu': ?instance.filtreKodu,
  'StokKodu': ?instance.stokKodu,
};

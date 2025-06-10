// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barkod_tanimla_kayitlari_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BarkodTanimlaKayitlariRequestModel
_$BarkodTanimlaKayitlariRequestModelFromJson(Map<String, dynamic> json) =>
    _BarkodTanimlaKayitlariRequestModel(
      stokKodu: json['StokKodu'] as String?,
      kayitTipi: json['KayitTipi'] as String?,
    );

Map<String, dynamic> _$BarkodTanimlaKayitlariRequestModelToJson(
  _BarkodTanimlaKayitlariRequestModel instance,
) => <String, dynamic>{
  if (instance.stokKodu case final value?) 'StokKodu': value,
  if (instance.kayitTipi case final value?) 'KayitTipi': value,
};

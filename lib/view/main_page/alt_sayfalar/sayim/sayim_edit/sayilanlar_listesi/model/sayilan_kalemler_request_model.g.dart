// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sayilan_kalemler_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SayilanKalemlerRequestModel _$SayilanKalemlerRequestModelFromJson(
  Map<String, dynamic> json,
) => _SayilanKalemlerRequestModel(
  filtreKodu: (json['FiltreKodu'] as num?)?.toInt(),
  depoKodu: (json['DepoKodu'] as num?)?.toInt(),
  kullaniciAdi: json['KullaniciAdi'] as String?,
  ekranTipi: json['EkranTipi'] as String? ?? "L",
  belgeNo: json['BelgeNo'] as String?,
  seriBazinda: json['seriBazinda'] as String?,
  id: (json['ID'] as num?)?.toInt(),
);

Map<String, dynamic> _$SayilanKalemlerRequestModelToJson(
  _SayilanKalemlerRequestModel instance,
) => <String, dynamic>{
  'FiltreKodu': ?instance.filtreKodu,
  'DepoKodu': ?instance.depoKodu,
  'KullaniciAdi': ?instance.kullaniciAdi,
  'EkranTipi': ?instance.ekranTipi,
  'BelgeNo': ?instance.belgeNo,
  'seriBazinda': ?instance.seriBazinda,
  'ID': ?instance.id,
};

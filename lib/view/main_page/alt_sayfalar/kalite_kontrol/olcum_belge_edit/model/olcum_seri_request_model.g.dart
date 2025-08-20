// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_seri_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OlcumSeriRequestModel _$OlcumSeriRequestModelFromJson(
  Map<String, dynamic> json,
) => _OlcumSeriRequestModel(
  stokKodu: json['STOK_KODU'] as String?,
  girisDepo: (json['GIRIS_DEPO'] as num?)?.toInt(),
  cikisDepo: (json['CIKIS_DEPO'] as num?)?.toInt(),
  redGirisDepo: (json['RED_GIRIS_DEPO'] as num?)?.toInt(),
  kabulGirisDepo: (json['KABUL_GIRIS_DEPO'] as num?)?.toInt(),
  seriListe: (json['SERI_LISTE'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$OlcumSeriRequestModelToJson(
  _OlcumSeriRequestModel instance,
) => <String, dynamic>{
  'STOK_KODU': ?instance.stokKodu,
  'GIRIS_DEPO': ?instance.girisDepo,
  'CIKIS_DEPO': ?instance.cikisDepo,
  'RED_GIRIS_DEPO': ?instance.redGirisDepo,
  'KABUL_GIRIS_DEPO': ?instance.kabulGirisDepo,
  'SERI_LISTE': ?instance.seriListe,
};

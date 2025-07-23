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
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
  if (instance.girisDepo case final value?) 'GIRIS_DEPO': value,
  if (instance.cikisDepo case final value?) 'CIKIS_DEPO': value,
  if (instance.redGirisDepo case final value?) 'RED_GIRIS_DEPO': value,
  if (instance.kabulGirisDepo case final value?) 'KABUL_GIRIS_DEPO': value,
  if (instance.seriListe case final value?) 'SERI_LISTE': value,
};

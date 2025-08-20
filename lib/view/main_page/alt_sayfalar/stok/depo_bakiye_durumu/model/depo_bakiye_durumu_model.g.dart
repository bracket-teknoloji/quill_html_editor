// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'depo_bakiye_durumu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DepoBakiyeDurumuModel _$DepoBakiyeDurumuModelFromJson(
  Map<String, dynamic> json,
) => _DepoBakiyeDurumuModel(
  subeKodu: (json['SUBE_KODU'] as num?)?.toInt(),
  depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
  stokKodu: json['STOK_KODU'] as String?,
  giris: (json['GIRIS'] as num?)?.toDouble(),
  cikis: (json['CIKIS'] as num?)?.toDouble(),
  bakiye: (json['BAKIYE'] as num?)?.toDouble(),
  subeAdi: json['SUBE_ADI'] as String?,
  stokAdi: json['STOK_ADI'] as String?,
  depoAdi: json['DEPO_ADI'] as String?,
);

Map<String, dynamic> _$DepoBakiyeDurumuModelToJson(
  _DepoBakiyeDurumuModel instance,
) => <String, dynamic>{
  'SUBE_KODU': ?instance.subeKodu,
  'DEPO_KODU': ?instance.depoKodu,
  'STOK_KODU': ?instance.stokKodu,
  'GIRIS': ?instance.giris,
  'CIKIS': ?instance.cikis,
  'BAKIYE': ?instance.bakiye,
  'SUBE_ADI': ?instance.subeAdi,
  'STOK_ADI': ?instance.stokAdi,
  'DEPO_ADI': ?instance.depoAdi,
};

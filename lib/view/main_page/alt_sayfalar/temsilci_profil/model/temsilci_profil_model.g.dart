// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temsilci_profil_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemsilciProfilModel _$TemsilciProfilModelFromJson(Map<String, dynamic> json) =>
    TemsilciProfilModel()
      ..tabloTipi = json['TABLO_TIPI'] as String?
      ..kayitTipi = json['KAYIT_TIPI'] as String?
      ..ayKodu = (json['AY_KODU'] as num?)?.toInt()
      ..plasiyerKodu = json['PLASIYER_KODU'] as String?
      ..plasiyerAciklama = json['PLASIYER_ACIKLAMA'] as String?
      ..tutar = (json['TUTAR'] as num?)?.toDouble();

Map<String, dynamic> _$TemsilciProfilModelToJson(
  TemsilciProfilModel instance,
) => <String, dynamic>{
  'TABLO_TIPI': ?instance.tabloTipi,
  'KAYIT_TIPI': ?instance.kayitTipi,
  'AY_KODU': ?instance.ayKodu,
  'PLASIYER_KODU': ?instance.plasiyerKodu,
  'PLASIYER_ACIKLAMA': ?instance.plasiyerAciklama,
  'TUTAR': ?instance.tutar,
};

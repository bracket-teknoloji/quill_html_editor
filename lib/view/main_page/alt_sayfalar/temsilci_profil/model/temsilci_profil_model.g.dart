// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temsilci_profil_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemsilciProfilModel _$TemsilciProfilModelFromJson(Map<String, dynamic> json) => TemsilciProfilModel()
  ..tabloTipi = json['TABLO_TIPI'] as String?
  ..kayitTipi = json['KAYIT_TIPI'] as String?
  ..ayKodu = (json['AY_KODU'] as num?)?.toInt()
  ..plasiyerKodu = json['PLASIYER_KODU'] as String?
  ..plasiyerAciklama = json['PLASIYER_ACIKLAMA'] as String?
  ..tutar = (json['TUTAR'] as num?)?.toDouble();

Map<String, dynamic> _$TemsilciProfilModelToJson(TemsilciProfilModel instance) => <String, dynamic>{
  if (instance.tabloTipi case final value?) 'TABLO_TIPI': value,
  if (instance.kayitTipi case final value?) 'KAYIT_TIPI': value,
  if (instance.ayKodu case final value?) 'AY_KODU': value,
  if (instance.plasiyerKodu case final value?) 'PLASIYER_KODU': value,
  if (instance.plasiyerAciklama case final value?) 'PLASIYER_ACIKLAMA': value,
  if (instance.tutar case final value?) 'TUTAR': value,
};

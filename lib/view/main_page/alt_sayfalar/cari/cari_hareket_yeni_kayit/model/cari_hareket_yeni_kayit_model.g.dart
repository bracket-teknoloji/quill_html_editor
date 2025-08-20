// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_hareket_yeni_kayit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariHareketYeniKayitModel _$CariHareketYeniKayitModelFromJson(
  Map<String, dynamic> json,
) => CariHareketYeniKayitModel()
  ..aciklama = json['ACIKLAMA'] as String?
  ..alacak = (json['ALACAK'] as num?)?.toDouble()
  ..borc = (json['BORC'] as num?)?.toDouble()
  ..belgeNo = json['BELGE_NO'] as String?
  ..cariKodu = json['CARI_KODU'] as String?
  ..hareketKodu = json['HAREKET_KODU'] as String?
  ..plasiyerKodu = json['PLASIYER_KODU'] as String?
  ..projeKodu = json['PROJE_KODU'] as String?
  ..inckeyno = (json['INCKEYNO'] as num?)?.toInt()
  ..tarih = json['TARIH'] == null
      ? null
      : DateTime.parse(json['TARIH'] as String)
  ..vadeTarihi = json['VADE_TARIHI'] == null
      ? null
      : DateTime.parse(json['VADE_TARIHI'] as String)
  ..yeniKayit = json['_YeniKayit'] as bool?;

Map<String, dynamic> _$CariHareketYeniKayitModelToJson(
  CariHareketYeniKayitModel instance,
) => <String, dynamic>{
  'ACIKLAMA': ?instance.aciklama,
  'ALACAK': ?instance.alacak,
  'BORC': ?instance.borc,
  'BELGE_NO': ?instance.belgeNo,
  'CARI_KODU': ?instance.cariKodu,
  'HAREKET_KODU': ?instance.hareketKodu,
  'PLASIYER_KODU': ?instance.plasiyerKodu,
  'PROJE_KODU': ?instance.projeKodu,
  'INCKEYNO': ?instance.inckeyno,
  'TARIH': ?instance.tarih?.toIso8601String(),
  'VADE_TARIHI': ?instance.vadeTarihi?.toIso8601String(),
  '_YeniKayit': ?instance.yeniKayit,
};

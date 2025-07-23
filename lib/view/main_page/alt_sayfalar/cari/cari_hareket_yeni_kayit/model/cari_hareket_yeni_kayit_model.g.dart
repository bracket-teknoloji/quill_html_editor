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
  if (instance.aciklama case final value?) 'ACIKLAMA': value,
  if (instance.alacak case final value?) 'ALACAK': value,
  if (instance.borc case final value?) 'BORC': value,
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.cariKodu case final value?) 'CARI_KODU': value,
  if (instance.hareketKodu case final value?) 'HAREKET_KODU': value,
  if (instance.plasiyerKodu case final value?) 'PLASIYER_KODU': value,
  if (instance.projeKodu case final value?) 'PROJE_KODU': value,
  if (instance.inckeyno case final value?) 'INCKEYNO': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
  if (instance.vadeTarihi?.toIso8601String() case final value?)
    'VADE_TARIHI': value,
  if (instance.yeniKayit case final value?) '_YeniKayit': value,
};

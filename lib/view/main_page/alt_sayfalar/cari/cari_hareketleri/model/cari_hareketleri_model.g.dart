// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_hareketleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariHareketleriModel _$CariHareketleriModelFromJson(Map<String, dynamic> json) => CariHareketleriModel()
  ..inckeyno = (json['INCKEYNO'] as num?)?.toInt()
  ..cariKodu = json['CARI_KODU'] as String?
  ..cariAdi = json['CARI_ADI'] as String?
  ..tarih = json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String)
  ..aciklama = json['ACIKLAMA'] as String?
  ..borc = (json['BORC'] as num?)?.toDouble()
  ..hareketAciklama = json['HAREKET_ACIKLAMA'] as String?
  ..hareketKodu = json['HAREKET_KODU'] as String?
  ..belgeNo = json['BELGE_NO'] as String?
  ..plasiyerKodu = json['PLASIYER_KODU'] as String?
  ..plasiyerAciklama = json['PLASIYER_ACIKLAMA'] as String?
  ..yuruyenBakiye = (json['YURUYEN_BAKIYE'] as num?)?.toDouble()
  ..dovYuruyenBakiye = (json['DOV_YURUYEN_BAKIYE'] as num?)?.toDouble()
  ..projeKodu = json['PROJE_KODU'] as String?
  ..projeAciklama = json['PROJE_ACIKLAMA'] as String?
  ..dovizBorc = (json['DOVIZ_BORC'] as num?)?.toDouble()
  ..dovizTuru = (json['DOVIZ_TURU'] as num?)?.toInt()
  ..dovizAdi = json['DOVIZ_ADI'] as String?
  ..refkey = json['REFKEY'] as String?
  ..vadeTarihi = json['VADE_TARIHI'] == null ? null : DateTime.parse(json['VADE_TARIHI'] as String)
  ..belgeTipi = json['BELGE_TIPI'] as String?
  ..alacak = (json['ALACAK'] as num?)?.toDouble()
  ..bordroMu = json['BORDRO_MU'] as bool?
  ..dovizAlacak = (json['DOVIZ_ALACAK'] as num?)?.toDouble()
  ..subeKodu = (json['SUBE_KODU'] as num?)?.toInt()
  ..ebelgeTuru = json['EBELGE_TURU'] as String?
  ..resmiBelgeNo = json['RESMI_BELGE_NO'] as String?
  ..raporKodu = json['RAPOR_KODU'] as String?
  ..kapatilmisTutar = (json['KAPATILMIS_TUTAR'] as num?)?.toDouble();

Map<String, dynamic> _$CariHareketleriModelToJson(CariHareketleriModel instance) => <String, dynamic>{
  if (instance.inckeyno case final value?) 'INCKEYNO': value,
  if (instance.cariKodu case final value?) 'CARI_KODU': value,
  if (instance.cariAdi case final value?) 'CARI_ADI': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
  if (instance.aciklama case final value?) 'ACIKLAMA': value,
  if (instance.borc case final value?) 'BORC': value,
  if (instance.hareketAciklama case final value?) 'HAREKET_ACIKLAMA': value,
  if (instance.hareketKodu case final value?) 'HAREKET_KODU': value,
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.plasiyerKodu case final value?) 'PLASIYER_KODU': value,
  if (instance.plasiyerAciklama case final value?) 'PLASIYER_ACIKLAMA': value,
  if (instance.yuruyenBakiye case final value?) 'YURUYEN_BAKIYE': value,
  if (instance.dovYuruyenBakiye case final value?) 'DOV_YURUYEN_BAKIYE': value,
  if (instance.projeKodu case final value?) 'PROJE_KODU': value,
  if (instance.projeAciklama case final value?) 'PROJE_ACIKLAMA': value,
  if (instance.dovizBorc case final value?) 'DOVIZ_BORC': value,
  if (instance.dovizTuru case final value?) 'DOVIZ_TURU': value,
  if (instance.dovizAdi case final value?) 'DOVIZ_ADI': value,
  if (instance.refkey case final value?) 'REFKEY': value,
  if (instance.vadeTarihi?.toIso8601String() case final value?) 'VADE_TARIHI': value,
  if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
  if (instance.alacak case final value?) 'ALACAK': value,
  if (instance.bordroMu case final value?) 'BORDRO_MU': value,
  if (instance.dovizAlacak case final value?) 'DOVIZ_ALACAK': value,
  if (instance.subeKodu case final value?) 'SUBE_KODU': value,
  if (instance.ebelgeTuru case final value?) 'EBELGE_TURU': value,
  if (instance.resmiBelgeNo case final value?) 'RESMI_BELGE_NO': value,
  if (instance.raporKodu case final value?) 'RAPOR_KODU': value,
  if (instance.kapatilmisTutar case final value?) 'KAPATILMIS_TUTAR': value,
};

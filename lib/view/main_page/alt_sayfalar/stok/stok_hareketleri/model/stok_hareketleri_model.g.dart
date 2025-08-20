// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_hareketleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokHareketleriModel _$StokHareketleriModelFromJson(
  Map<String, dynamic> json,
) => StokHareketleriModel()
  ..inckeyno = (json['INCKEYNO'] as num?)?.toInt()
  ..cikisIslemi = json['CIKIS_ISLEMI'] as bool?
  ..stokAdi = json['STOK_ADI'] as String?
  ..stokKodu = json['STOK_KODU'] as String?
  ..fisno = json['FISNO'] as String?
  ..stharGcmik = (json['STHAR_GCMIK'] as num?)?.toDouble()
  ..stharTarih = json['STHAR_TARIH'] == null
      ? null
      : DateTime.parse(json['STHAR_TARIH'] as String)
  ..stharNf = (json['STHAR_NF'] as num?)?.toDouble()
  ..stharBf = (json['STHAR_BF'] as num?)?.toDouble()
  ..stharKdv = (json['STHAR_KDV'] as num?)?.toDouble()
  ..hareketTuru = json['HAREKET_TURU'] as String?
  ..hareketTuruAciklama = json['HAREKET_TURU_ACIKLAMA'] as String?
  ..belgeTipi = json['BELGE_TIPI'] as String?
  ..belgeTipiAciklama = json['BELGE_TIPI_ACIKLAMA'] as String?
  ..cariKodu = json['CARI_KODU'] as String?
  ..ambarIslemi = json['AMBAR_ISLEMI'] as String?
  ..depoKodu = (json['DEPO_KODU'] as num?)?.toInt()
  ..depoAdi = json['DEPO_ADI'] as String?
  ..aciklama = json['ACIKLAMA'] as String?
  ..dovizTipi = (json['DOVIZ_TIPI'] as num?)?.toInt()
  ..dovizFiyati = (json['DOVIZ_FIYATI'] as num?)?.toDouble()
  ..seriAktif = json['SERI_AKTIF'] as String?
  ..ekalan1 = json['EKALAN1'] as String?
  ..ekalan2 = json['EKALAN2'] as String?
  ..projeKodu = json['PROJE_KODU'] as String?
  ..plasiyerKodu = json['PLASIYER_KODU'] as String?
  ..plasiyerAciklama = json['PLASIYER_ACIKLAMA'] as String?
  ..cariAdi = json['CARI_ADI'] as String?
  ..seriDurumAdi = json['SERI_DURUM_ADI'] as String?;

Map<String, dynamic> _$StokHareketleriModelToJson(
  StokHareketleriModel instance,
) => <String, dynamic>{
  'INCKEYNO': ?instance.inckeyno,
  'CIKIS_ISLEMI': ?instance.cikisIslemi,
  'STOK_ADI': ?instance.stokAdi,
  'STOK_KODU': ?instance.stokKodu,
  'FISNO': ?instance.fisno,
  'STHAR_GCMIK': ?instance.stharGcmik,
  'STHAR_TARIH': ?instance.stharTarih?.toIso8601String(),
  'STHAR_NF': ?instance.stharNf,
  'STHAR_BF': ?instance.stharBf,
  'STHAR_KDV': ?instance.stharKdv,
  'HAREKET_TURU': ?instance.hareketTuru,
  'HAREKET_TURU_ACIKLAMA': ?instance.hareketTuruAciklama,
  'BELGE_TIPI': ?instance.belgeTipi,
  'BELGE_TIPI_ACIKLAMA': ?instance.belgeTipiAciklama,
  'CARI_KODU': ?instance.cariKodu,
  'AMBAR_ISLEMI': ?instance.ambarIslemi,
  'DEPO_KODU': ?instance.depoKodu,
  'DEPO_ADI': ?instance.depoAdi,
  'ACIKLAMA': ?instance.aciklama,
  'DOVIZ_TIPI': ?instance.dovizTipi,
  'DOVIZ_FIYATI': ?instance.dovizFiyati,
  'SERI_AKTIF': ?instance.seriAktif,
  'EKALAN1': ?instance.ekalan1,
  'EKALAN2': ?instance.ekalan2,
  'PROJE_KODU': ?instance.projeKodu,
  'PLASIYER_KODU': ?instance.plasiyerKodu,
  'PLASIYER_ACIKLAMA': ?instance.plasiyerAciklama,
  'CARI_ADI': ?instance.cariAdi,
  'SERI_DURUM_ADI': ?instance.seriDurumAdi,
};

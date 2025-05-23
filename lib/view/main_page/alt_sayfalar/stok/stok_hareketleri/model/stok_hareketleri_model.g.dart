// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_hareketleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokHareketleriModel _$StokHareketleriModelFromJson(Map<String, dynamic> json) => StokHareketleriModel()
  ..inckeyno = (json['INCKEYNO'] as num?)?.toInt()
  ..cikisIslemi = json['CIKIS_ISLEMI'] as bool?
  ..stokAdi = json['STOK_ADI'] as String?
  ..stokKodu = json['STOK_KODU'] as String?
  ..fisno = json['FISNO'] as String?
  ..stharGcmik = (json['STHAR_GCMIK'] as num?)?.toDouble()
  ..stharTarih = json['STHAR_TARIH'] == null ? null : DateTime.parse(json['STHAR_TARIH'] as String)
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

Map<String, dynamic> _$StokHareketleriModelToJson(StokHareketleriModel instance) => <String, dynamic>{
  if (instance.inckeyno case final value?) 'INCKEYNO': value,
  if (instance.cikisIslemi case final value?) 'CIKIS_ISLEMI': value,
  if (instance.stokAdi case final value?) 'STOK_ADI': value,
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
  if (instance.fisno case final value?) 'FISNO': value,
  if (instance.stharGcmik case final value?) 'STHAR_GCMIK': value,
  if (instance.stharTarih?.toIso8601String() case final value?) 'STHAR_TARIH': value,
  if (instance.stharNf case final value?) 'STHAR_NF': value,
  if (instance.stharBf case final value?) 'STHAR_BF': value,
  if (instance.stharKdv case final value?) 'STHAR_KDV': value,
  if (instance.hareketTuru case final value?) 'HAREKET_TURU': value,
  if (instance.hareketTuruAciklama case final value?) 'HAREKET_TURU_ACIKLAMA': value,
  if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
  if (instance.belgeTipiAciklama case final value?) 'BELGE_TIPI_ACIKLAMA': value,
  if (instance.cariKodu case final value?) 'CARI_KODU': value,
  if (instance.ambarIslemi case final value?) 'AMBAR_ISLEMI': value,
  if (instance.depoKodu case final value?) 'DEPO_KODU': value,
  if (instance.depoAdi case final value?) 'DEPO_ADI': value,
  if (instance.aciklama case final value?) 'ACIKLAMA': value,
  if (instance.dovizTipi case final value?) 'DOVIZ_TIPI': value,
  if (instance.dovizFiyati case final value?) 'DOVIZ_FIYATI': value,
  if (instance.seriAktif case final value?) 'SERI_AKTIF': value,
  if (instance.ekalan1 case final value?) 'EKALAN1': value,
  if (instance.ekalan2 case final value?) 'EKALAN2': value,
  if (instance.projeKodu case final value?) 'PROJE_KODU': value,
  if (instance.plasiyerKodu case final value?) 'PLASIYER_KODU': value,
  if (instance.plasiyerAciklama case final value?) 'PLASIYER_ACIKLAMA': value,
  if (instance.cariAdi case final value?) 'CARI_ADI': value,
  if (instance.seriDurumAdi case final value?) 'SERI_DURUM_ADI': value,
};

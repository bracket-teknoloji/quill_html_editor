// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_hareketleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokHareketleriModel _$StokHareketleriModelFromJson(Map<String, dynamic> json) => StokHareketleriModel()
  ..inckeyno = json['INCKEYNO'] as int?
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
  ..depoKodu = json['DEPO_KODU'] as int?
  ..depoAdi = json['DEPO_ADI'] as String?
  ..aciklama = json['ACIKLAMA'] as String?
  ..dovizTipi = json['DOVIZ_TIPI'] as int?
  ..dovizFiyati = (json['DOVIZ_FIYATI'] as num?)?.toDouble()
  ..seriAktif = json['SERI_AKTIF'] as String?
  ..ekalan1 = json['EKALAN1'] as String?
  ..projeKodu = json['PROJE_KODU'] as String?
  ..plasiyerKodu = json['PLASIYER_KODU'] as String?
  ..plasiyerAciklama = json['PLASIYER_ACIKLAMA'] as String?
  ..cariAdi = json['CARI_ADI'] as String?;

Map<String, dynamic> _$StokHareketleriModelToJson(StokHareketleriModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('INCKEYNO', instance.inckeyno);
  writeNotNull('CIKIS_ISLEMI', instance.cikisIslemi);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('FISNO', instance.fisno);
  writeNotNull('STHAR_GCMIK', instance.stharGcmik);
  writeNotNull('STHAR_TARIH', instance.stharTarih?.toIso8601String());
  writeNotNull('STHAR_NF', instance.stharNf);
  writeNotNull('STHAR_BF', instance.stharBf);
  writeNotNull('STHAR_KDV', instance.stharKdv);
  writeNotNull('HAREKET_TURU', instance.hareketTuru);
  writeNotNull('HAREKET_TURU_ACIKLAMA', instance.hareketTuruAciklama);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('BELGE_TIPI_ACIKLAMA', instance.belgeTipiAciklama);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('AMBAR_ISLEMI', instance.ambarIslemi);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('DEPO_ADI', instance.depoAdi);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('DOVIZ_FIYATI', instance.dovizFiyati);
  writeNotNull('SERI_AKTIF', instance.seriAktif);
  writeNotNull('EKALAN1', instance.ekalan1);
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('PLASIYER_ACIKLAMA', instance.plasiyerAciklama);
  writeNotNull('CARI_ADI', instance.cariAdi);
  return val;
}

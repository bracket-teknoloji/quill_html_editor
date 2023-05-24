// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'stok_hareketleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokHareketleriModel _$StokHareketleriModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'StokHareketleriModel',
      json,
      ($checkedConvert) {
        final val = StokHareketleriModel();
        $checkedConvert('INCKEYNO', (v) => val.inckeyno = v as int?);
        $checkedConvert('CIKIS_ISLEMI', (v) => val.cikisIslemi = v as bool?);
        $checkedConvert('STOK_ADI', (v) => val.stokAdi = v as String?);
        $checkedConvert('STOK_KODU', (v) => val.stokKodu = v as String?);
        $checkedConvert('FISNO', (v) => val.fisno = v as String?);
        $checkedConvert(
            'STHAR_GCMIK', (v) => val.stharGcmik = (v as num?)?.toDouble());
        $checkedConvert(
            'STHAR_TARIH',
            (v) => val.stharTarih =
                v == null ? null : DateTime.parse(v as String));
        $checkedConvert(
            'STHAR_NF', (v) => val.stharNf = (v as num?)?.toDouble());
        $checkedConvert(
            'STHAR_BF', (v) => val.stharBf = (v as num?)?.toDouble());
        $checkedConvert(
            'STHAR_KDV', (v) => val.stharKdv = (v as num?)?.toDouble());
        $checkedConvert('HAREKET_TURU', (v) => val.hareketTuru = v as String?);
        $checkedConvert('HAREKET_TURU_ACIKLAMA',
            (v) => val.hareketTuruAciklama = v as String?);
        $checkedConvert('BELGE_TIPI', (v) => val.belgeTipi = v as String?);
        $checkedConvert(
            'BELGE_TIPI_ACIKLAMA', (v) => val.belgeTipiAciklama = v as String?);
        $checkedConvert('CARI_KODU', (v) => val.cariKodu = v as String?);
        $checkedConvert('AMBAR_ISLEMI', (v) => val.ambarIslemi = v as String?);
        $checkedConvert('DEPO_KODU', (v) => val.depoKodu = v as int?);
        $checkedConvert('DEPO_ADI', (v) => val.depoAdi = v as String?);
        $checkedConvert('ACIKLAMA', (v) => val.aciklama = v as String?);
        $checkedConvert('DOVIZ_TIPI', (v) => val.dovizTipi = v as int?);
        $checkedConvert(
            'DOVIZ_FIYATI', (v) => val.dovizFiyati = (v as num?)?.toDouble());
        $checkedConvert('SERI_AKTIF', (v) => val.seriAktif = v as String?);
        $checkedConvert('EKALAN1', (v) => val.ekalan1 = v as String?);
        $checkedConvert('PROJE_KODU', (v) => val.projeKodu = v as String?);
        $checkedConvert(
            'PLASIYER_KODU', (v) => val.plasiyerKodu = v as String?);
        $checkedConvert(
            'PLASIYER_ACIKLAMA', (v) => val.plasiyerAciklama = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'inckeyno': 'INCKEYNO',
        'cikisIslemi': 'CIKIS_ISLEMI',
        'stokAdi': 'STOK_ADI',
        'stokKodu': 'STOK_KODU',
        'fisno': 'FISNO',
        'stharGcmik': 'STHAR_GCMIK',
        'stharTarih': 'STHAR_TARIH',
        'stharNf': 'STHAR_NF',
        'stharBf': 'STHAR_BF',
        'stharKdv': 'STHAR_KDV',
        'hareketTuru': 'HAREKET_TURU',
        'hareketTuruAciklama': 'HAREKET_TURU_ACIKLAMA',
        'belgeTipi': 'BELGE_TIPI',
        'belgeTipiAciklama': 'BELGE_TIPI_ACIKLAMA',
        'cariKodu': 'CARI_KODU',
        'ambarIslemi': 'AMBAR_ISLEMI',
        'depoKodu': 'DEPO_KODU',
        'depoAdi': 'DEPO_ADI',
        'aciklama': 'ACIKLAMA',
        'dovizTipi': 'DOVIZ_TIPI',
        'dovizFiyati': 'DOVIZ_FIYATI',
        'seriAktif': 'SERI_AKTIF',
        'ekalan1': 'EKALAN1',
        'projeKodu': 'PROJE_KODU',
        'plasiyerKodu': 'PLASIYER_KODU',
        'plasiyerAciklama': 'PLASIYER_ACIKLAMA'
      },
    );

Map<String, dynamic> _$StokHareketleriModelToJson(
    StokHareketleriModel instance) {
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
  return val;
}

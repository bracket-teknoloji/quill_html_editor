// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_emirleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IsEmirleriModel _$IsEmirleriModelFromJson(Map<String, dynamic> json) =>
    _IsEmirleriModel(
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      teslimTarihi: json['TESLIM_TARIHI'] == null
          ? null
          : DateTime.parse(json['TESLIM_TARIHI'] as String),
      isemriNo: json['ISEMRI_NO'] as String?,
      isemriSira: (json['ISEMRI_SIRA'] as num?)?.toInt(),
      islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
      requestVersion: (json['REQUEST_VERSION'] as num?)?.toInt(),
      stokKodu: json['STOK_KODU'] as String?,
      yapkod: json['YAPKOD'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      kalan: (json['KALAN'] as num?)?.toDouble(),
      cikisDepo: (json['CIKIS_DEPO'] as num?)?.toInt(),
      girisDepo: (json['GIRIS_DEPO'] as num?)?.toInt(),
      kapali: json['KAPALI'] as String?,
      rework: json['REWORK'] as String?,
      cikisDepoAdi: json['CIKIS_DEPO_ADI'] as String?,
      girisDepoAdi: json['GIRIS_DEPO_ADI'] as String?,
      stokOlcuBirimi: json['STOK_OLCU_BIRIMI'] as String?,
      projeKodu: json['PROJE_KODU'] as String?,
      refIsemrino: json['REF_ISEMRINO'] as String?,
      siparisNo: json['SIPARIS_NO'] as String?,
      siparisSira: (json['SIPARIS_SIRA'] as num?)?.toInt(),
      cariKodu: json['CARI_KODU'] as String?,
      cariAdi: json['CARI_ADI'] as String?,
      aciklama: json['ACIKLAMA'] as String?,
      tamamlanan: (json['TAMAMLANAN'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$IsEmirleriModelToJson(_IsEmirleriModel instance) =>
    <String, dynamic>{
      'TARIH': ?instance.tarih?.toIso8601String(),
      'TESLIM_TARIHI': ?instance.teslimTarihi?.toIso8601String(),
      'ISEMRI_NO': ?instance.isemriNo,
      'ISEMRI_SIRA': ?instance.isemriSira,
      'ISLEM_KODU': ?instance.islemKodu,
      'REQUEST_VERSION': ?instance.requestVersion,
      'STOK_KODU': ?instance.stokKodu,
      'YAPKOD': ?instance.yapkod,
      'STOK_ADI': ?instance.stokAdi,
      'MIKTAR': ?instance.miktar,
      'KALAN': ?instance.kalan,
      'CIKIS_DEPO': ?instance.cikisDepo,
      'GIRIS_DEPO': ?instance.girisDepo,
      'KAPALI': ?instance.kapali,
      'REWORK': ?instance.rework,
      'CIKIS_DEPO_ADI': ?instance.cikisDepoAdi,
      'GIRIS_DEPO_ADI': ?instance.girisDepoAdi,
      'STOK_OLCU_BIRIMI': ?instance.stokOlcuBirimi,
      'PROJE_KODU': ?instance.projeKodu,
      'REF_ISEMRINO': ?instance.refIsemrino,
      'SIPARIS_NO': ?instance.siparisNo,
      'SIPARIS_SIRA': ?instance.siparisSira,
      'CARI_KODU': ?instance.cariKodu,
      'CARI_ADI': ?instance.cariAdi,
      'ACIKLAMA': ?instance.aciklama,
      'TAMAMLANAN': ?instance.tamamlanan,
    };

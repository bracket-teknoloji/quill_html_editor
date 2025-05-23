// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_emirleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IsEmirleriModelImpl _$$IsEmirleriModelImplFromJson(Map<String, dynamic> json) => _$IsEmirleriModelImpl(
  tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
  teslimTarihi: json['TESLIM_TARIHI'] == null ? null : DateTime.parse(json['TESLIM_TARIHI'] as String),
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

Map<String, dynamic> _$$IsEmirleriModelImplToJson(_$IsEmirleriModelImpl instance) => <String, dynamic>{
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
  if (instance.teslimTarihi?.toIso8601String() case final value?) 'TESLIM_TARIHI': value,
  if (instance.isemriNo case final value?) 'ISEMRI_NO': value,
  if (instance.isemriSira case final value?) 'ISEMRI_SIRA': value,
  if (instance.islemKodu case final value?) 'ISLEM_KODU': value,
  if (instance.requestVersion case final value?) 'REQUEST_VERSION': value,
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
  if (instance.yapkod case final value?) 'YAPKOD': value,
  if (instance.stokAdi case final value?) 'STOK_ADI': value,
  if (instance.miktar case final value?) 'MIKTAR': value,
  if (instance.kalan case final value?) 'KALAN': value,
  if (instance.cikisDepo case final value?) 'CIKIS_DEPO': value,
  if (instance.girisDepo case final value?) 'GIRIS_DEPO': value,
  if (instance.kapali case final value?) 'KAPALI': value,
  if (instance.rework case final value?) 'REWORK': value,
  if (instance.cikisDepoAdi case final value?) 'CIKIS_DEPO_ADI': value,
  if (instance.girisDepoAdi case final value?) 'GIRIS_DEPO_ADI': value,
  if (instance.stokOlcuBirimi case final value?) 'STOK_OLCU_BIRIMI': value,
  if (instance.projeKodu case final value?) 'PROJE_KODU': value,
  if (instance.refIsemrino case final value?) 'REF_ISEMRINO': value,
  if (instance.siparisNo case final value?) 'SIPARIS_NO': value,
  if (instance.siparisSira case final value?) 'SIPARIS_SIRA': value,
  if (instance.cariKodu case final value?) 'CARI_KODU': value,
  if (instance.cariAdi case final value?) 'CARI_ADI': value,
  if (instance.aciklama case final value?) 'ACIKLAMA': value,
  if (instance.tamamlanan case final value?) 'TAMAMLANAN': value,
};

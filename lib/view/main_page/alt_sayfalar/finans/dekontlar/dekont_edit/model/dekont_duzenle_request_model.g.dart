// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dekont_duzenle_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DekontDuzenleRequestModel _$DekontDuzenleRequestModelFromJson(
  Map<String, dynamic> json,
) => _DekontDuzenleRequestModel(
  inckeyno: (json['INCKEYNO'] as num?)?.toInt(),
  tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
  seriNo: json['SERI_NO'] as String?,
  dekontNo: (json['DEKONT_NO'] as num?)?.toInt(),
  siraNo: (json['SIRA_NO'] as num?)?.toInt(),
  ba: json['BA'] as String?,
  hesapTipi: json['HESAP_TIPI'] as String?,
  hesapTipiAciklama: json['HESAP_TIPI_ACIKLAMA'] as String?,
  hesapKodu: json['HESAP_KODU'] as String?,
  hesapAdi: json['HESAP_ADI'] as String?,
  tutar: (json['TUTAR'] as num?)?.toDouble(),
  dovizTipi: (json['DOVIZ_TIPI'] as num?)?.toInt(),
  dovizAdi: json['DOVIZ_ADI'] as String?,
  dovizTutari: (json['DOVIZ_TUTARI'] as num?)?.toDouble(),
  aciklama: json['ACIKLAMA'] as String?,
  plasiyerKodu: json['PLASIYER_KODU'] as String?,
  refkey: json['REFKEY'] as String?,
  plasiyerAciklama: json['PLASIYER_ACIKLAMA'] as String?,
  depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
  exportTipi: (json['EXPORT_TIPI'] as num?)?.toInt(),
  muhasebeHesapTipi: json['MUHASEBE_HESAP_TIPI'] as String?,
  belgeNo: json['BELGE_NO'] as String?,
  exportRefno: json['EXPORT_REFNO'] as String?,
  cariAdi: json['CARI_ADI'] as String?,
);

Map<String, dynamic> _$DekontDuzenleRequestModelToJson(
  _DekontDuzenleRequestModel instance,
) => <String, dynamic>{
  'INCKEYNO': ?instance.inckeyno,
  'TARIH': ?instance.tarih?.toIso8601String(),
  'SERI_NO': ?instance.seriNo,
  'DEKONT_NO': ?instance.dekontNo,
  'SIRA_NO': ?instance.siraNo,
  'BA': ?instance.ba,
  'HESAP_TIPI': ?instance.hesapTipi,
  'HESAP_TIPI_ACIKLAMA': ?instance.hesapTipiAciklama,
  'HESAP_KODU': ?instance.hesapKodu,
  'HESAP_ADI': ?instance.hesapAdi,
  'TUTAR': ?instance.tutar,
  'DOVIZ_TIPI': ?instance.dovizTipi,
  'DOVIZ_ADI': ?instance.dovizAdi,
  'DOVIZ_TUTARI': ?instance.dovizTutari,
  'ACIKLAMA': ?instance.aciklama,
  'PLASIYER_KODU': ?instance.plasiyerKodu,
  'REFKEY': ?instance.refkey,
  'PLASIYER_ACIKLAMA': ?instance.plasiyerAciklama,
  'DEPO_KODU': ?instance.depoKodu,
  'EXPORT_TIPI': ?instance.exportTipi,
  'MUHASEBE_HESAP_TIPI': ?instance.muhasebeHesapTipi,
  'BELGE_NO': ?instance.belgeNo,
  'EXPORT_REFNO': ?instance.exportRefno,
  'CARI_ADI': ?instance.cariAdi,
};

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
  if (instance.inckeyno case final value?) 'INCKEYNO': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
  if (instance.seriNo case final value?) 'SERI_NO': value,
  if (instance.dekontNo case final value?) 'DEKONT_NO': value,
  if (instance.siraNo case final value?) 'SIRA_NO': value,
  if (instance.ba case final value?) 'BA': value,
  if (instance.hesapTipi case final value?) 'HESAP_TIPI': value,
  if (instance.hesapTipiAciklama case final value?) 'HESAP_TIPI_ACIKLAMA': value,
  if (instance.hesapKodu case final value?) 'HESAP_KODU': value,
  if (instance.hesapAdi case final value?) 'HESAP_ADI': value,
  if (instance.tutar case final value?) 'TUTAR': value,
  if (instance.dovizTipi case final value?) 'DOVIZ_TIPI': value,
  if (instance.dovizAdi case final value?) 'DOVIZ_ADI': value,
  if (instance.dovizTutari case final value?) 'DOVIZ_TUTARI': value,
  if (instance.aciklama case final value?) 'ACIKLAMA': value,
  if (instance.plasiyerKodu case final value?) 'PLASIYER_KODU': value,
  if (instance.refkey case final value?) 'REFKEY': value,
  if (instance.plasiyerAciklama case final value?) 'PLASIYER_ACIKLAMA': value,
  if (instance.depoKodu case final value?) 'DEPO_KODU': value,
  if (instance.exportTipi case final value?) 'EXPORT_TIPI': value,
  if (instance.muhasebeHesapTipi case final value?) 'MUHASEBE_HESAP_TIPI': value,
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.exportRefno case final value?) 'EXPORT_REFNO': value,
  if (instance.cariAdi case final value?) 'CARI_ADI': value,
};

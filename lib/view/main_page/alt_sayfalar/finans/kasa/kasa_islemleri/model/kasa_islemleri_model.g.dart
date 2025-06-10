// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kasa_islemleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KasaIslemleriModel _$KasaIslemleriModelFromJson(
  Map<String, dynamic> json,
) => _KasaIslemleriModel(
  inckeyno: (json['INCKEYNO'] as num?)?.toInt(),
  caharInckeyno: (json['CAHAR_INCKEYNO'] as num?)?.toInt(),
  kasaKodu: json['KASA_KODU'] as String?,
  kasaAdi: json['KASA_ADI'] as String?,
  belgeNo: json['BELGE_NO'] as String?,
  tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
  tip: json['TIP'] as String?,
  tipAciklama: json['TIP_ACIKLAMA'] as String?,
  hedefAciklama: json['HEDEF_ACIKLAMA'] as String?,
  tutar: (json['TUTAR'] as num?)?.toDouble(),
  cariMuh: json['CARI_MUH'] as String?,
  gc: json['GC'] as String?,
  kod: json['KOD'] as String?,
  cariKodu: json['CARI_KODU'] as String?,
  cariAdi: json['CARI_ADI'] as String?,
  hesapAdi: json['HESAP_ADI'] as String?,
  dovizTutari: (json['DOVIZ_TUTARI'] as num?)?.toDouble(),
  dovizKuru: (json['DOVIZ_KURU'] as num?)?.toDouble(),
  plasiyerKodu: json['PLASIYER_KODU'] as String?,
  plasiyerAdi: json['PLASIYER_ADI'] as String?,
  projeKodu: json['PROJE_KODU'] as String?,
  projeAdi: json['PROJE_ADI'] as String?,
  aciklama: json['ACIKLAMA'] as String?,
  refkey: json['REFKEY'] as String?,
  kasaDevirTarihi: json['KASA_DEVIR_TARIHI'] == null
      ? null
      : DateTime.parse(json['KASA_DEVIR_TARIHI'] as String),
  kasaDevirTutari: (json['KASA_DEVIR_TUTARI'] as num?)?.toDouble(),
  kasaDovizDevirTutari: (json['KASA_DOVIZ_DEVIR_TUTARI'] as num?)?.toDouble(),
  kasaDovizTipi: (json['KASA_DOVIZ_TIPI'] as num?)?.toInt(),
  saat: json['SAAT'] as String?,
  kdvOrani: (json['KDV_ORANI'] as num?)?.toDouble(),
  dovizAdi: json['DOVIZ_ADI'] as String?,
);

Map<String, dynamic> _$KasaIslemleriModelToJson(
  _KasaIslemleriModel instance,
) => <String, dynamic>{
  if (instance.inckeyno case final value?) 'INCKEYNO': value,
  if (instance.caharInckeyno case final value?) 'CAHAR_INCKEYNO': value,
  if (instance.kasaKodu case final value?) 'KASA_KODU': value,
  if (instance.kasaAdi case final value?) 'KASA_ADI': value,
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
  if (instance.tip case final value?) 'TIP': value,
  if (instance.tipAciklama case final value?) 'TIP_ACIKLAMA': value,
  if (instance.hedefAciklama case final value?) 'HEDEF_ACIKLAMA': value,
  if (instance.tutar case final value?) 'TUTAR': value,
  if (instance.cariMuh case final value?) 'CARI_MUH': value,
  if (instance.gc case final value?) 'GC': value,
  if (instance.kod case final value?) 'KOD': value,
  if (instance.cariKodu case final value?) 'CARI_KODU': value,
  if (instance.cariAdi case final value?) 'CARI_ADI': value,
  if (instance.hesapAdi case final value?) 'HESAP_ADI': value,
  if (instance.dovizTutari case final value?) 'DOVIZ_TUTARI': value,
  if (instance.dovizKuru case final value?) 'DOVIZ_KURU': value,
  if (instance.plasiyerKodu case final value?) 'PLASIYER_KODU': value,
  if (instance.plasiyerAdi case final value?) 'PLASIYER_ADI': value,
  if (instance.projeKodu case final value?) 'PROJE_KODU': value,
  if (instance.projeAdi case final value?) 'PROJE_ADI': value,
  if (instance.aciklama case final value?) 'ACIKLAMA': value,
  if (instance.refkey case final value?) 'REFKEY': value,
  if (instance.kasaDevirTarihi?.toIso8601String() case final value?)
    'KASA_DEVIR_TARIHI': value,
  if (instance.kasaDevirTutari case final value?) 'KASA_DEVIR_TUTARI': value,
  if (instance.kasaDovizDevirTutari case final value?)
    'KASA_DOVIZ_DEVIR_TUTARI': value,
  if (instance.kasaDovizTipi case final value?) 'KASA_DOVIZ_TIPI': value,
  if (instance.saat case final value?) 'SAAT': value,
  if (instance.kdvOrani case final value?) 'KDV_ORANI': value,
  if (instance.dovizAdi case final value?) 'DOVIZ_ADI': value,
};

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

Map<String, dynamic> _$KasaIslemleriModelToJson(_KasaIslemleriModel instance) =>
    <String, dynamic>{
      'INCKEYNO': ?instance.inckeyno,
      'CAHAR_INCKEYNO': ?instance.caharInckeyno,
      'KASA_KODU': ?instance.kasaKodu,
      'KASA_ADI': ?instance.kasaAdi,
      'BELGE_NO': ?instance.belgeNo,
      'TARIH': ?instance.tarih?.toIso8601String(),
      'TIP': ?instance.tip,
      'TIP_ACIKLAMA': ?instance.tipAciklama,
      'HEDEF_ACIKLAMA': ?instance.hedefAciklama,
      'TUTAR': ?instance.tutar,
      'CARI_MUH': ?instance.cariMuh,
      'GC': ?instance.gc,
      'KOD': ?instance.kod,
      'CARI_KODU': ?instance.cariKodu,
      'CARI_ADI': ?instance.cariAdi,
      'HESAP_ADI': ?instance.hesapAdi,
      'DOVIZ_TUTARI': ?instance.dovizTutari,
      'DOVIZ_KURU': ?instance.dovizKuru,
      'PLASIYER_KODU': ?instance.plasiyerKodu,
      'PLASIYER_ADI': ?instance.plasiyerAdi,
      'PROJE_KODU': ?instance.projeKodu,
      'PROJE_ADI': ?instance.projeAdi,
      'ACIKLAMA': ?instance.aciklama,
      'REFKEY': ?instance.refkey,
      'KASA_DEVIR_TARIHI': ?instance.kasaDevirTarihi?.toIso8601String(),
      'KASA_DEVIR_TUTARI': ?instance.kasaDevirTutari,
      'KASA_DOVIZ_DEVIR_TUTARI': ?instance.kasaDovizDevirTutari,
      'KASA_DOVIZ_TIPI': ?instance.kasaDovizTipi,
      'SAAT': ?instance.saat,
      'KDV_ORANI': ?instance.kdvOrani,
      'DOVIZ_ADI': ?instance.dovizAdi,
    };

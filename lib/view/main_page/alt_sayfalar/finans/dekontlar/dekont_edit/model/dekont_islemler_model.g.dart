// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dekont_islemler_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DekontIslemlerModel _$DekontIslemlerModelFromJson(Map<String, dynamic> json) =>
    _DekontIslemlerModel(
      inckeyno: (json['INCKEYNO'] as num?)?.toInt(),
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
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
      dovizTutari: (json['DOVIZ_TUTARI'] as num?)?.toInt(),
      aciklama: json['ACIKLAMA'] as String?,
      plasiyerKodu: json['PLASIYER_KODU'] as String?,
      refkey: json['REFKEY'] as String?,
      cariAdi: json['CARI_ADI'] as String?,
      plasiyerAciklama: json['PLASIYER_ACIKLAMA'] as String?,
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      exportTipi: (json['EXPORT_TIPI'] as num?)?.toInt(),
      muhasebeHesapTipi: json['MUHASEBE_HESAP_TIPI'] as String?,
    );

Map<String, dynamic> _$DekontIslemlerModelToJson(
  _DekontIslemlerModel instance,
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
  'DOVIZ_TUTARI': ?instance.dovizTutari,
  'ACIKLAMA': ?instance.aciklama,
  'PLASIYER_KODU': ?instance.plasiyerKodu,
  'REFKEY': ?instance.refkey,
  'CARI_ADI': ?instance.cariAdi,
  'PLASIYER_ACIKLAMA': ?instance.plasiyerAciklama,
  'DEPO_KODU': ?instance.depoKodu,
  'EXPORT_TIPI': ?instance.exportTipi,
  'MUHASEBE_HESAP_TIPI': ?instance.muhasebeHesapTipi,
};

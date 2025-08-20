// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cek_senet_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CekSenetListesiModel _$CekSenetListesiModelFromJson(
  Map<String, dynamic> json,
) => _CekSenetListesiModel(
  isCiroTipli: json['IS_CIRO_TIPLI'] as bool?,
  cikisTarihi: json['CIKIS_TARIHI'] == null
      ? null
      : DateTime.parse(json['CIKIS_TARIHI'] as String),
  odemeTarihi: json['ODEME_TARIHI'] == null
      ? null
      : DateTime.parse(json['ODEME_TARIHI'] as String),
  tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
  vadeTarihi: json['VADE_TARIHI'] == null
      ? null
      : DateTime.parse(json['VADE_TARIHI'] as String),
  dovizTutari: (json['DOVIZ_TUTARI'] as num?)?.toDouble(),
  getDovizTutari: (json['GetDovizTutari'] as num?)?.toDouble(),
  tutar: (json['TUTAR'] as num?)?.toDouble(),
  dovizTipi: (json['DOVIZ_TIPI'] as num?)?.toInt(),
  evrakSayisi: (json['EVRAK_SAYISI'] as num?)?.toInt(),
  getDovizTipi: (json['GetDovizTipi'] as num?)?.toInt(),
  aciklama1: json['ACIKLAMA1'] as String?,
  aciklama2: json['ACIKLAMA2'] as String?,
  aciklama3: json['ACIKLAMA3'] as String?,
  alinanBordroNo: json['ALINAN_BORDRO_NO'] as String?,
  asilCari: json['ASIL_CARI'] as String?,
  belgeNo: json['BELGE_NO'] as String?,
  belgeTipi: json['BELGE_TIPI'] as String?,
  cariAdi: json['CARI_ADI'] as String?,
  cariKodu: json['CARI_KODU'] as String?,
  cariRaporKodu: json['CARI_RAPOR_KODU'] as String?,
  cekBanka: json['CEK_BANKA'] as String?,
  cekSube: json['CEK_SUBE'] as String?,
  ciroTipi: json['CIRO_TIPI'] as String?,
  dovizKodu: json['DOVIZ_KODU'] as String?,
  durum: json['DURUM'] as String?,
  durumAciklama: json['DURUM_ACIKLAMA'] as String?,
  getAsilCariAdi: json['GetAsilCariAdi'] as String?,
  getCekBankaAdi: json['GetCekBankaAdi'] as String?,
  getCekSubeAdi: json['GetCekSubeAdi'] as String?,
  plasiyerKodu: json['PLASIYER_KODU'] as String?,
  projeKodu: json['PROJE_KODU'] as String?,
  raporKodu: json['RAPOR_KODU'] as String?,
  seriNo: json['SERI_NO'] as String?,
  verenKodu: json['VEREN_KODU'] as String?,
  verilenAdi: json['VERILEN_ADI'] as String?,
  verilenBankaKodu: json['VERILEN_BANKA_KODU'] as String?,
  verilenBordroNo: json['VERILEN_BORDRO_NO'] as String?,
  verilenKodu: json['VERILEN_KODU'] as String?,
  yerAciklama: json['YER_ACIKLAMA'] as String?,
  yeri: json['YERI'] as String?,
);

Map<String, dynamic> _$CekSenetListesiModelToJson(
  _CekSenetListesiModel instance,
) => <String, dynamic>{
  'IS_CIRO_TIPLI': ?instance.isCiroTipli,
  'CIKIS_TARIHI': ?instance.cikisTarihi?.toIso8601String(),
  'ODEME_TARIHI': ?instance.odemeTarihi?.toIso8601String(),
  'TARIH': ?instance.tarih?.toIso8601String(),
  'VADE_TARIHI': ?instance.vadeTarihi?.toIso8601String(),
  'DOVIZ_TUTARI': ?instance.dovizTutari,
  'GetDovizTutari': ?instance.getDovizTutari,
  'TUTAR': ?instance.tutar,
  'DOVIZ_TIPI': ?instance.dovizTipi,
  'EVRAK_SAYISI': ?instance.evrakSayisi,
  'GetDovizTipi': ?instance.getDovizTipi,
  'ACIKLAMA1': ?instance.aciklama1,
  'ACIKLAMA2': ?instance.aciklama2,
  'ACIKLAMA3': ?instance.aciklama3,
  'ALINAN_BORDRO_NO': ?instance.alinanBordroNo,
  'ASIL_CARI': ?instance.asilCari,
  'BELGE_NO': ?instance.belgeNo,
  'BELGE_TIPI': ?instance.belgeTipi,
  'CARI_ADI': ?instance.cariAdi,
  'CARI_KODU': ?instance.cariKodu,
  'CARI_RAPOR_KODU': ?instance.cariRaporKodu,
  'CEK_BANKA': ?instance.cekBanka,
  'CEK_SUBE': ?instance.cekSube,
  'CIRO_TIPI': ?instance.ciroTipi,
  'DOVIZ_KODU': ?instance.dovizKodu,
  'DURUM': ?instance.durum,
  'DURUM_ACIKLAMA': ?instance.durumAciklama,
  'GetAsilCariAdi': ?instance.getAsilCariAdi,
  'GetCekBankaAdi': ?instance.getCekBankaAdi,
  'GetCekSubeAdi': ?instance.getCekSubeAdi,
  'PLASIYER_KODU': ?instance.plasiyerKodu,
  'PROJE_KODU': ?instance.projeKodu,
  'RAPOR_KODU': ?instance.raporKodu,
  'SERI_NO': ?instance.seriNo,
  'VEREN_KODU': ?instance.verenKodu,
  'VERILEN_ADI': ?instance.verilenAdi,
  'VERILEN_BANKA_KODU': ?instance.verilenBankaKodu,
  'VERILEN_BORDRO_NO': ?instance.verilenBordroNo,
  'VERILEN_KODU': ?instance.verilenKodu,
  'YER_ACIKLAMA': ?instance.yerAciklama,
  'YERI': ?instance.yeri,
};

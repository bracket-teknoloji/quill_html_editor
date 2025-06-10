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
  if (instance.isCiroTipli case final value?) 'IS_CIRO_TIPLI': value,
  if (instance.cikisTarihi?.toIso8601String() case final value?)
    'CIKIS_TARIHI': value,
  if (instance.odemeTarihi?.toIso8601String() case final value?)
    'ODEME_TARIHI': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
  if (instance.vadeTarihi?.toIso8601String() case final value?)
    'VADE_TARIHI': value,
  if (instance.dovizTutari case final value?) 'DOVIZ_TUTARI': value,
  if (instance.getDovizTutari case final value?) 'GetDovizTutari': value,
  if (instance.tutar case final value?) 'TUTAR': value,
  if (instance.dovizTipi case final value?) 'DOVIZ_TIPI': value,
  if (instance.evrakSayisi case final value?) 'EVRAK_SAYISI': value,
  if (instance.getDovizTipi case final value?) 'GetDovizTipi': value,
  if (instance.aciklama1 case final value?) 'ACIKLAMA1': value,
  if (instance.aciklama2 case final value?) 'ACIKLAMA2': value,
  if (instance.aciklama3 case final value?) 'ACIKLAMA3': value,
  if (instance.alinanBordroNo case final value?) 'ALINAN_BORDRO_NO': value,
  if (instance.asilCari case final value?) 'ASIL_CARI': value,
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
  if (instance.cariAdi case final value?) 'CARI_ADI': value,
  if (instance.cariKodu case final value?) 'CARI_KODU': value,
  if (instance.cariRaporKodu case final value?) 'CARI_RAPOR_KODU': value,
  if (instance.cekBanka case final value?) 'CEK_BANKA': value,
  if (instance.cekSube case final value?) 'CEK_SUBE': value,
  if (instance.ciroTipi case final value?) 'CIRO_TIPI': value,
  if (instance.dovizKodu case final value?) 'DOVIZ_KODU': value,
  if (instance.durum case final value?) 'DURUM': value,
  if (instance.durumAciklama case final value?) 'DURUM_ACIKLAMA': value,
  if (instance.getAsilCariAdi case final value?) 'GetAsilCariAdi': value,
  if (instance.getCekBankaAdi case final value?) 'GetCekBankaAdi': value,
  if (instance.getCekSubeAdi case final value?) 'GetCekSubeAdi': value,
  if (instance.plasiyerKodu case final value?) 'PLASIYER_KODU': value,
  if (instance.projeKodu case final value?) 'PROJE_KODU': value,
  if (instance.raporKodu case final value?) 'RAPOR_KODU': value,
  if (instance.seriNo case final value?) 'SERI_NO': value,
  if (instance.verenKodu case final value?) 'VEREN_KODU': value,
  if (instance.verilenAdi case final value?) 'VERILEN_ADI': value,
  if (instance.verilenBankaKodu case final value?) 'VERILEN_BANKA_KODU': value,
  if (instance.verilenBordroNo case final value?) 'VERILEN_BORDRO_NO': value,
  if (instance.verilenKodu case final value?) 'VERILEN_KODU': value,
  if (instance.yerAciklama case final value?) 'YER_ACIKLAMA': value,
  if (instance.yeri case final value?) 'YERI': value,
};

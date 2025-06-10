// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_belge_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EBelgeListesiModel _$EBelgeListesiModelFromJson(Map<String, dynamic> json) =>
    _EBelgeListesiModel(
      ebelgeTuru: json['EBELGE_TURU'] as String?,
      inckeyno: (json['INCKEYNO'] as num?)?.toInt(),
      efatmasInckeyno: (json['EFATMAS_INCKEYNO'] as num?)?.toInt(),
      gelen: json['GELEN'] as String?,
      taslak: json['TASLAK'] as String?,
      gonderildi: json['GONDERILDI'] as String?,
      faturaIslendi: json['FATURA_ISLENDI'] as String?,
      dekontIslendi: json['DEKONT_ISLENDI'] as String?,
      iptalEdildi: json['IPTAL_EDILDI'] as String?,
      cevapKodu: (json['CEVAP_KODU'] as num?)?.toInt(),
      cevapAciklama: json['CEVAP_ACIKLAMA'] as String?,
      basariylaGonderildi: json['BASARIYLA_GONDERILDI'] as String?,
      onayDurumKodu: json['ONAY_DURUM_KODU'] as String?,
      onayAciklama: json['ONAY_ACIKLAMA'] as String?,
      resmiBelgeNo: json['RESMI_BELGE_NO'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      kayittarihi: json['KAYITTARIHI'] == null
          ? null
          : DateTime.parse(json['KAYITTARIHI'] as String),
      belgeTuru: json['BELGE_TURU'] as String?,
      cariAdi: json['CARI_ADI'] as String?,
      vergiNo: json['VERGI_NO'] as String?,
      cariIlce: json['CARI_ILCE'] as String?,
      cariIl: json['CARI_IL'] as String?,
      dovizKuru: (json['DOVIZ_KURU'] as num?)?.toDouble(),
      basimYapildi: json['BASIM_YAPILDI'] as String?,
      genelToplam: (json['GENEL_TOPLAM'] as num?)?.toDouble(),
      kdvTutari: (json['KDV_TUTARI'] as num?)?.toDouble(),
      senaryo: json['SENARYO'] as String?,
      zarfid: json['ZARFID'] as String?,
      uuid: json['UUID'] as String?,
      faturaTipi: json['FATURA_TIPI'] as String?,
      kayityapankul: json['KAYITYAPANKUL'] as String?,
      kontrolEdildi: json['KONTROL_EDILDI'] as String?,
      kayitliCariKodu: json['KAYITLI_CARI_KODU'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      islenenBelgeNo: json['ISLENEN_BELGE_NO'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
      dovizTipi: (json['DOVIZ_TIPI'] as num?)?.toInt(),
      dovizAdi: json['DOVIZ_ADI'] as String?,
      dovizTutari: (json['DOVIZ_TUTARI'] as num?)?.toDouble(),
      iskontoTutari: (json['ISKONTO_TUTARI'] as num?)?.toDouble(),
      dekontJson: json['DEKONT_JSON'] as String?,
      kontrolAciklama: json['KONTROL_ACIKLAMA'] as String?,
      dizaynYolu: json['DIZAYN_YOLU'] as String?,
      gondermeDurumu: json['GONDERME_DURUMU'] as String?,
      zarfSilinebilir: json['ZARF_SILINEBILIR'] as String?,
      iptalTarihi: json['IPTAL_TARIHI'] == null
          ? null
          : DateTime.parse(json['IPTAL_TARIHI'] as String),
      eposta: json['EPOSTA'] as String?,
      eBelgeTuru: json['E_BELGE_TURU'] as String?,
      id: (json['ID'] as num?)?.toInt(),
      eFatMasId: (json['E_FAT_MAS_ID'] as num?)?.toInt(),
      eIrsMasId: (json['E_IRS_MAS_ID'] as num?)?.toInt(),
      kayitTarihi: json['KAYIT_TARIHI'] == null
          ? null
          : DateTime.parse(json['KAYIT_TARIHI'] as String),
      eFaturaIptalTarihi: json['E_FATURA_IPTAL_TARIHI'] == null
          ? null
          : DateTime.parse(json['E_FATURA_IPTAL_TARIHI'] as String),
      ilce: json['ILCE'] as String?,
      sehir: json['SEHIR'] as String?,
      kayitYapanKul: json['KAYIT_YAPAN_KUL'] as String?,
      gelenEFatKontrolEdildi: json['GELEN_E_FAT_KONTROL_EDILDI'] as String?,
      gelenEFatKontrolAciklama: json['GELEN_E_FAT_KONTROL_ACIKLAMA'] as String?,
      gonderimSekliEPosta: json['GONDERIM_SEKLI_E_POSTA'] as bool?,
      ePosta: json['E_POSTA'] as String?,
      islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
      kutuTuru: json['KUTU_TURU'] as String?,
      aciklama: json['ACIKLAMA'] as String?,
      senaryoTipi: json['SENARYO_TIPI'] as String?,
      kopyaSayisi: (json['KOPYA_SAYISI'] as num?)?.toInt(),
      yaziciAdi: json['YAZICI_ADI'] as String?,
      dizaynNo: (json['DIZAYN_NO'] as num?)?.toInt(),
      dovizliOlustur: json['DOVIZLI_OLUSTUR'] as bool?,
      internetFaturasi: json['INTERNET_FATURASI'] as bool?,
      eirsBilgi: json['EIRS_BILGI'] == null
          ? null
          : EIrsaliyeBilgiModel.fromJson(
              json['EIRS_BILGI'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$EBelgeListesiModelToJson(
  _EBelgeListesiModel instance,
) => <String, dynamic>{
  if (instance.ebelgeTuru case final value?) 'EBELGE_TURU': value,
  if (instance.inckeyno case final value?) 'INCKEYNO': value,
  if (instance.efatmasInckeyno case final value?) 'EFATMAS_INCKEYNO': value,
  if (instance.gelen case final value?) 'GELEN': value,
  if (instance.taslak case final value?) 'TASLAK': value,
  if (instance.gonderildi case final value?) 'GONDERILDI': value,
  if (instance.faturaIslendi case final value?) 'FATURA_ISLENDI': value,
  if (instance.dekontIslendi case final value?) 'DEKONT_ISLENDI': value,
  if (instance.iptalEdildi case final value?) 'IPTAL_EDILDI': value,
  if (instance.cevapKodu case final value?) 'CEVAP_KODU': value,
  if (instance.cevapAciklama case final value?) 'CEVAP_ACIKLAMA': value,
  if (instance.basariylaGonderildi case final value?)
    'BASARIYLA_GONDERILDI': value,
  if (instance.onayDurumKodu case final value?) 'ONAY_DURUM_KODU': value,
  if (instance.onayAciklama case final value?) 'ONAY_ACIKLAMA': value,
  if (instance.resmiBelgeNo case final value?) 'RESMI_BELGE_NO': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
  if (instance.kayittarihi?.toIso8601String() case final value?)
    'KAYITTARIHI': value,
  if (instance.belgeTuru case final value?) 'BELGE_TURU': value,
  if (instance.cariAdi case final value?) 'CARI_ADI': value,
  if (instance.vergiNo case final value?) 'VERGI_NO': value,
  if (instance.cariIlce case final value?) 'CARI_ILCE': value,
  if (instance.cariIl case final value?) 'CARI_IL': value,
  if (instance.dovizKuru case final value?) 'DOVIZ_KURU': value,
  if (instance.basimYapildi case final value?) 'BASIM_YAPILDI': value,
  if (instance.genelToplam case final value?) 'GENEL_TOPLAM': value,
  if (instance.kdvTutari case final value?) 'KDV_TUTARI': value,
  if (instance.senaryo case final value?) 'SENARYO': value,
  if (instance.zarfid case final value?) 'ZARFID': value,
  if (instance.uuid case final value?) 'UUID': value,
  if (instance.faturaTipi case final value?) 'FATURA_TIPI': value,
  if (instance.kayityapankul case final value?) 'KAYITYAPANKUL': value,
  if (instance.kontrolEdildi case final value?) 'KONTROL_EDILDI': value,
  if (instance.kayitliCariKodu case final value?) 'KAYITLI_CARI_KODU': value,
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.islenenBelgeNo case final value?) 'ISLENEN_BELGE_NO': value,
  if (instance.cariKodu case final value?) 'CARI_KODU': value,
  if (instance.dovizTipi case final value?) 'DOVIZ_TIPI': value,
  if (instance.dovizAdi case final value?) 'DOVIZ_ADI': value,
  if (instance.dovizTutari case final value?) 'DOVIZ_TUTARI': value,
  if (instance.iskontoTutari case final value?) 'ISKONTO_TUTARI': value,
  if (instance.dekontJson case final value?) 'DEKONT_JSON': value,
  if (instance.kontrolAciklama case final value?) 'KONTROL_ACIKLAMA': value,
  if (instance.dizaynYolu case final value?) 'DIZAYN_YOLU': value,
  if (instance.gondermeDurumu case final value?) 'GONDERME_DURUMU': value,
  if (instance.zarfSilinebilir case final value?) 'ZARF_SILINEBILIR': value,
  if (instance.iptalTarihi?.toIso8601String() case final value?)
    'IPTAL_TARIHI': value,
  if (instance.eposta case final value?) 'EPOSTA': value,
  if (instance.eBelgeTuru case final value?) 'E_BELGE_TURU': value,
  if (instance.id case final value?) 'ID': value,
  if (instance.eFatMasId case final value?) 'E_FAT_MAS_ID': value,
  if (instance.eIrsMasId case final value?) 'E_IRS_MAS_ID': value,
  if (instance.kayitTarihi?.toIso8601String() case final value?)
    'KAYIT_TARIHI': value,
  if (instance.eFaturaIptalTarihi?.toIso8601String() case final value?)
    'E_FATURA_IPTAL_TARIHI': value,
  if (instance.ilce case final value?) 'ILCE': value,
  if (instance.sehir case final value?) 'SEHIR': value,
  if (instance.kayitYapanKul case final value?) 'KAYIT_YAPAN_KUL': value,
  if (instance.gelenEFatKontrolEdildi case final value?)
    'GELEN_E_FAT_KONTROL_EDILDI': value,
  if (instance.gelenEFatKontrolAciklama case final value?)
    'GELEN_E_FAT_KONTROL_ACIKLAMA': value,
  if (instance.gonderimSekliEPosta case final value?)
    'GONDERIM_SEKLI_E_POSTA': value,
  if (instance.ePosta case final value?) 'E_POSTA': value,
  if (instance.islemKodu case final value?) 'ISLEM_KODU': value,
  if (instance.kutuTuru case final value?) 'KUTU_TURU': value,
  if (instance.aciklama case final value?) 'ACIKLAMA': value,
  if (instance.senaryoTipi case final value?) 'SENARYO_TIPI': value,
  if (instance.kopyaSayisi case final value?) 'KOPYA_SAYISI': value,
  if (instance.yaziciAdi case final value?) 'YAZICI_ADI': value,
  if (instance.dizaynNo case final value?) 'DIZAYN_NO': value,
  if (instance.dovizliOlustur case final value?) 'DOVIZLI_OLUSTUR': value,
  if (instance.internetFaturasi case final value?) 'INTERNET_FATURASI': value,
  if (instance.eirsBilgi?.toJson() case final value?) 'EIRS_BILGI': value,
};

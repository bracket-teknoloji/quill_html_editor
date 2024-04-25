// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_belge_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EBelgeListesiModelImpl _$$EBelgeListesiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EBelgeListesiModelImpl(
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
    );

Map<String, dynamic> _$$EBelgeListesiModelImplToJson(
    _$EBelgeListesiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EBELGE_TURU', instance.ebelgeTuru);
  writeNotNull('INCKEYNO', instance.inckeyno);
  writeNotNull('EFATMAS_INCKEYNO', instance.efatmasInckeyno);
  writeNotNull('GELEN', instance.gelen);
  writeNotNull('TASLAK', instance.taslak);
  writeNotNull('GONDERILDI', instance.gonderildi);
  writeNotNull('FATURA_ISLENDI', instance.faturaIslendi);
  writeNotNull('DEKONT_ISLENDI', instance.dekontIslendi);
  writeNotNull('IPTAL_EDILDI', instance.iptalEdildi);
  writeNotNull('CEVAP_KODU', instance.cevapKodu);
  writeNotNull('CEVAP_ACIKLAMA', instance.cevapAciklama);
  writeNotNull('BASARIYLA_GONDERILDI', instance.basariylaGonderildi);
  writeNotNull('ONAY_DURUM_KODU', instance.onayDurumKodu);
  writeNotNull('ONAY_ACIKLAMA', instance.onayAciklama);
  writeNotNull('RESMI_BELGE_NO', instance.resmiBelgeNo);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('KAYITTARIHI', instance.kayittarihi?.toIso8601String());
  writeNotNull('BELGE_TURU', instance.belgeTuru);
  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('VERGI_NO', instance.vergiNo);
  writeNotNull('CARI_ILCE', instance.cariIlce);
  writeNotNull('CARI_IL', instance.cariIl);
  writeNotNull('DOVIZ_KURU', instance.dovizKuru);
  writeNotNull('BASIM_YAPILDI', instance.basimYapildi);
  writeNotNull('GENEL_TOPLAM', instance.genelToplam);
  writeNotNull('KDV_TUTARI', instance.kdvTutari);
  writeNotNull('SENARYO', instance.senaryo);
  writeNotNull('ZARFID', instance.zarfid);
  writeNotNull('UUID', instance.uuid);
  writeNotNull('FATURA_TIPI', instance.faturaTipi);
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('KONTROL_EDILDI', instance.kontrolEdildi);
  writeNotNull('KAYITLI_CARI_KODU', instance.kayitliCariKodu);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('ISLENEN_BELGE_NO', instance.islenenBelgeNo);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('DOVIZ_ADI', instance.dovizAdi);
  writeNotNull('DOVIZ_TUTARI', instance.dovizTutari);
  writeNotNull('ISKONTO_TUTARI', instance.iskontoTutari);
  writeNotNull('DEKONT_JSON', instance.dekontJson);
  writeNotNull('KONTROL_ACIKLAMA', instance.kontrolAciklama);
  writeNotNull('DIZAYN_YOLU', instance.dizaynYolu);
  writeNotNull('GONDERME_DURUMU', instance.gondermeDurumu);
  writeNotNull('ZARF_SILINEBILIR', instance.zarfSilinebilir);
  writeNotNull('IPTAL_TARIHI', instance.iptalTarihi?.toIso8601String());
  writeNotNull('EPOSTA', instance.eposta);
  writeNotNull('E_BELGE_TURU', instance.eBelgeTuru);
  writeNotNull('ID', instance.id);
  writeNotNull('E_FAT_MAS_ID', instance.eFatMasId);
  writeNotNull('E_IRS_MAS_ID', instance.eIrsMasId);
  writeNotNull('KAYIT_TARIHI', instance.kayitTarihi?.toIso8601String());
  writeNotNull(
      'E_FATURA_IPTAL_TARIHI', instance.eFaturaIptalTarihi?.toIso8601String());
  writeNotNull('ILCE', instance.ilce);
  writeNotNull('SEHIR', instance.sehir);
  writeNotNull('KAYIT_YAPAN_KUL', instance.kayitYapanKul);
  writeNotNull('GELEN_E_FAT_KONTROL_EDILDI', instance.gelenEFatKontrolEdildi);
  writeNotNull(
      'GELEN_E_FAT_KONTROL_ACIKLAMA', instance.gelenEFatKontrolAciklama);
  writeNotNull('GONDERIM_SEKLI_E_POSTA', instance.gonderimSekliEPosta);
  writeNotNull('E_POSTA', instance.ePosta);
  writeNotNull('ISLEM_KODU', instance.islemKodu);
  writeNotNull('KUTU_TURU', instance.kutuTuru);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('SENARYO_TIPI', instance.senaryoTipi);
  writeNotNull('KOPYA_SAYISI', instance.kopyaSayisi);
  writeNotNull('YAZICI_ADI', instance.yaziciAdi);
  writeNotNull('DIZAYN_NO', instance.dizaynNo);
  writeNotNull('DOVIZLI_OLUSTUR', instance.dovizliOlustur);
  writeNotNull('INTERNET_FATURASI', instance.internetFaturasi);
  return val;
}

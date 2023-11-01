// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_belge_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EBelgeListesiModelImpl _$$EBelgeListesiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EBelgeListesiModelImpl(
      ebelgeTuru: json['EBELGE_TURU'] as String?,
      inckeyno: json['INCKEYNO'] as int?,
      efatmasInckeyno: json['EFATMAS_INCKEYNO'] as int?,
      gelen: json['GELEN'] as String?,
      taslak: json['TASLAK'] as String?,
      gonderildi: json['GONDERILDI'] as String?,
      faturaIslendi: json['FATURA_ISLENDI'] as String?,
      dekontIslendi: json['DEKONT_ISLENDI'] as String?,
      iptalEdildi: json['IPTAL_EDILDI'] as String?,
      cevapKodu: json['CEVAP_KODU'] as int?,
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
      dovizTipi: json['DOVIZ_TIPI'] as int?,
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
      gonderimSekliEposta: json['GONDERIM_SEKLI_EPOSTA'] as String?,
      eposta: json['EPOSTA'] as String?,
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
  writeNotNull('GONDERIM_SEKLI_EPOSTA', instance.gonderimSekliEposta);
  writeNotNull('EPOSTA', instance.eposta);
  return val;
}

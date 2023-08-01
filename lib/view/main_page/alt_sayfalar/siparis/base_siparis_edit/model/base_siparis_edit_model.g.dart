// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_siparis_edit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseSiparisEditModel _$BaseSiparisEditModelFromJson(
        Map<String, dynamic> json) =>
    BaseSiparisEditModel()
      ..duzeltmetarihi = json['DUZELTMETARIHI'] == null
          ? null
          : DateTime.parse(json['DUZELTMETARIHI'] as String)
      ..kalemAdedi = json['KALEM_ADEDI'] as int?
      ..cariEfaturami = json['CARI_EFATURAMI'] as String?
      ..cYedek6 = json['C_YEDEK6'] as String?
      ..duzeltmeyapankul = json['DUZELTMEYAPANKUL'] as String?
      ..plasiyerAciklama = json['PLASIYER_ACIKLAMA'] as String?
      ..projeAciklama = json['PROJE_ACIKLAMA'] as String?
      ..teslimCariAdi = json['TESLIM_CARI_ADI'] as String?
      ..kdvDahilmi = json['KDV_DAHILMI'] as bool?
      ..remoteTempBelge = json['REMOTE_TEMP_BELGE'] as bool?
      ..tempBelgeMi = json['TEMP_BELGE_MI'] as bool?
      ..cariModel = json['CARI_MODEL'] == null
          ? null
          : CariModel.fromJson(json['CARI_MODEL'] as Map<String, dynamic>)
      ..islemeBaslamaTarihi = json['ISLEME_BASLAMA_TARIHI'] == null
          ? null
          : DateTime.parse(json['ISLEME_BASLAMA_TARIHI'] as String)
      ..istenilenTeslimTarihi = json['ISTENILEN_TESLIM_TARIHI'] == null
          ? null
          : DateTime.parse(json['ISTENILEN_TESLIM_TARIHI'] as String)
      ..kayittarihi = json['KAYITTARIHI'] == null
          ? null
          : DateTime.parse(json['KAYITTARIHI'] as String)
      ..kosulTarihi = json['KOSUL_TARIHI'] == null
          ? null
          : DateTime.parse(json['KOSUL_TARIHI'] as String)
      ..tarih =
          json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String)
      ..teslimTarihi = json['TESLIM_TARIHI'] == null
          ? null
          : DateTime.parse(json['TESLIM_TARIHI'] as String)
      ..vadeTarihi = json['VADE_TARIHI'] == null
          ? null
          : DateTime.parse(json['VADE_TARIHI'] as String)
      ..araToplam = (json['ARA_TOPLAM'] as num?)?.toDouble()
      ..ekMaliyet1Tutari = (json['EK_MALIYET1_TUTARI'] as num?)?.toDouble()
      ..ekMaliyet2Tutari = (json['EK_MALIYET2_TUTARI'] as num?)?.toDouble()
      ..ekMaliyet3Tutari = (json['EK_MALIYET3_TUTARI'] as num?)?.toDouble()
      ..genelIskonto1 = (json['GENEL_ISKONTO1'] as num?)?.toDouble()
      ..genelIskonto2 = (json['GENEL_ISKONTO2'] as num?)?.toDouble()
      ..genelIskonto3 = (json['GENEL_ISKONTO3'] as num?)?.toDouble()
      ..genelToplam = (json['GENEL_TOPLAM'] as num?)?.toDouble()
      ..genIsk1O = (json['GEN_ISK1_O'] as num?)?.toDouble()
      ..genIsk1T = (json['GEN_ISK1_T'] as num?)?.toDouble()
      ..genIsk2O = (json['GEN_ISK2_O'] as num?)?.toDouble()
      ..genIsk2T = (json['GEN_ISK2_T'] as num?)?.toDouble()
      ..genIsk3O = (json['GEN_ISK3_O'] as num?)?.toDouble()
      ..genIsk3T = (json['GEN_ISK3_T'] as num?)?.toDouble()
      ..kdv = (json['KDV'] as num?)?.toDouble()
      ..belgeTipi = json['BELGE_TIPI'] as int?
      ..cikisDepoKodu = json['CIKIS_DEPO_KODU'] as int?
      ..genisk1Tipi = json['GENISK1_TIPI'] as int?
      ..genisk2Tipi = json['GENISK2_TIPI'] as int?
      ..genisk3Tipi = json['GENISK3_TIPI'] as int?
      ..kalemModelAdedi = json['KALEM_MODEL_ADEDI'] as int?
      ..tempBelgeId = json['TEMP_BELGE_ID'] as int?
      ..tempKayitTipi = json['TEMP_KAYIT_TIPI'] as int?
      ..tipi = json['TIPI'] as int?
      ..topluDepo = json['TOPLU_DEPO'] as int?
      ..vadeGunu = json['VADE_GUNU'] as int?
      ..tempSipList = json['TEMP_SIP_LIST'] as List<dynamic>?
      ..kalemList = (json['KALEM_LIST'] as List<dynamic>?)
          ?.map((e) => KalemModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..kalemModeller = (json['KALEM_MODELLER'] as List<dynamic>?)
          ?.map((e) => KalemModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..kalemModelList = (json['KALEM_MODEL_LIST'] as List<dynamic>?)
          ?.map((e) => KalemModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..acik1 = json['ACIK1'] as String?
      ..acik10 = json['ACIK10'] as String?
      ..acik11 = json['ACIK11'] as String?
      ..acik12 = json['ACIK12'] as String?
      ..acik13 = json['ACIK13'] as String?
      ..acik14 = json['ACIK14'] as String?
      ..acik15 = json['ACIK15'] as String?
      ..acik16 = json['ACIK16'] as String?
      ..acik2 = json['ACIK2'] as String?
      ..acik3 = json['ACIK3'] as String?
      ..acik4 = json['ACIK4'] as String?
      ..acik5 = json['ACIK5'] as String?
      ..acik6 = json['ACIK6'] as String?
      ..acik7 = json['ACIK7'] as String?
      ..acik8 = json['ACIK8'] as String?
      ..acik9 = json['ACIK9'] as String?
      ..belgeKodu = json['BELGE_KODU'] as String?
      ..belgeNo = json['BELGE_NO'] as String?
      ..belgeTuru = json['BELGE_TURU'] as String?
      ..cariAdi = json['CARI_ADI'] as String?
      ..cariKodu = json['CARI_KODU'] as String?
      ..ekAcik1 = json['EK_ACIK1'] as String?
      ..ekAcik10 = json['EK_ACIK10'] as String?
      ..ekAcik11 = json['EK_ACIK11'] as String?
      ..ekAcik12 = json['EK_ACIK12'] as String?
      ..ekAcik13 = json['EK_ACIK13'] as String?
      ..ekAcik14 = json['EK_ACIK14'] as String?
      ..ekAcik15 = json['EK_ACIK15'] as String?
      ..ekAcik16 = json['EK_ACIK16'] as String?
      ..ekAcik2 = json['EK_ACIK2'] as String?
      ..ekAcik3 = json['EK_ACIK3'] as String?
      ..ekAcik4 = json['EK_ACIK4'] as String?
      ..ekAcik5 = json['EK_ACIK5'] as String?
      ..ekAcik6 = json['EK_ACIK6'] as String?
      ..ekAcik7 = json['EK_ACIK7'] as String?
      ..ekAcik8 = json['EK_ACIK8'] as String?
      ..ekAcik9 = json['EK_ACIK9'] as String?
      ..ekAciklama = json['EK_ACIKLAMA'] as String?
      ..islemId = json['ISLEM_ID'] as String?
      ..kayityapankul = json['KAYITYAPANKUL'] as String?
      ..kdvDahil = json['KDV_DAHIL'] as String?
      ..kosulKodu = json['KOSUL_KODU'] as String?
      ..mevcutBelgeNo = json['MEVCUT_BELGE_NO'] as String?
      ..mevcutCariKodu = json['MEVCUT_CARI_KODU'] as String?
      ..odemeKodu = json['ODEME_KODU'] as String?
      ..ozelKod1 = json['OZEL_KOD1'] as String?
      ..ozelKod2 = json['OZEL_KOD2'] as String?
      ..pickerBelgeTuru = json['PICKER_BELGE_TURU'] as String?
      ..plasiyerKodu = json['PLASIYER_KODU'] as String?
      ..projeKodu = json['PROJE_KODU'] as String?
      ..remoteTempBelgeEtiketi = json['REMOTE_TEMP_BELGE_ETIKETI'] as String?
      ..tag = json['TAG'] as String?;

Map<String, dynamic> _$BaseSiparisEditModelToJson(
    BaseSiparisEditModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DUZELTMETARIHI', instance.duzeltmetarihi?.toIso8601String());
  writeNotNull('KALEM_ADEDI', instance.kalemAdedi);
  writeNotNull('CARI_EFATURAMI', instance.cariEfaturami);
  writeNotNull('C_YEDEK6', instance.cYedek6);
  writeNotNull('DUZELTMEYAPANKUL', instance.duzeltmeyapankul);
  writeNotNull('PLASIYER_ACIKLAMA', instance.plasiyerAciklama);
  writeNotNull('PROJE_ACIKLAMA', instance.projeAciklama);
  writeNotNull('TESLIM_CARI_ADI', instance.teslimCariAdi);
  writeNotNull('KDV_DAHILMI', instance.kdvDahilmi);
  writeNotNull('REMOTE_TEMP_BELGE', instance.remoteTempBelge);
  writeNotNull('TEMP_BELGE_MI', instance.tempBelgeMi);
  writeNotNull('CARI_MODEL', instance.cariModel);
  writeNotNull(
      'ISLEME_BASLAMA_TARIHI', instance.islemeBaslamaTarihi?.toIso8601String());
  writeNotNull('ISTENILEN_TESLIM_TARIHI',
      instance.istenilenTeslimTarihi?.toIso8601String());
  writeNotNull('KAYITTARIHI', instance.kayittarihi?.toIso8601String());
  writeNotNull('KOSUL_TARIHI', instance.kosulTarihi?.toIso8601String());
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('TESLIM_TARIHI', instance.teslimTarihi?.toIso8601String());
  writeNotNull('VADE_TARIHI', instance.vadeTarihi?.toIso8601String());
  writeNotNull('ARA_TOPLAM', instance.araToplam);
  writeNotNull('EK_MALIYET1_TUTARI', instance.ekMaliyet1Tutari);
  writeNotNull('EK_MALIYET2_TUTARI', instance.ekMaliyet2Tutari);
  writeNotNull('EK_MALIYET3_TUTARI', instance.ekMaliyet3Tutari);
  writeNotNull('GENEL_ISKONTO1', instance.genelIskonto1);
  writeNotNull('GENEL_ISKONTO2', instance.genelIskonto2);
  writeNotNull('GENEL_ISKONTO3', instance.genelIskonto3);
  writeNotNull('GENEL_TOPLAM', instance.genelToplam);
  writeNotNull('GEN_ISK1_O', instance.genIsk1O);
  writeNotNull('GEN_ISK1_T', instance.genIsk1T);
  writeNotNull('GEN_ISK2_O', instance.genIsk2O);
  writeNotNull('GEN_ISK2_T', instance.genIsk2T);
  writeNotNull('GEN_ISK3_O', instance.genIsk3O);
  writeNotNull('GEN_ISK3_T', instance.genIsk3T);
  writeNotNull('KDV', instance.kdv);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('CIKIS_DEPO_KODU', instance.cikisDepoKodu);
  writeNotNull('GENISK1_TIPI', instance.genisk1Tipi);
  writeNotNull('GENISK2_TIPI', instance.genisk2Tipi);
  writeNotNull('GENISK3_TIPI', instance.genisk3Tipi);
  writeNotNull('KALEM_MODEL_ADEDI', instance.kalemModelAdedi);
  writeNotNull('TEMP_BELGE_ID', instance.tempBelgeId);
  writeNotNull('TEMP_KAYIT_TIPI', instance.tempKayitTipi);
  writeNotNull('TIPI', instance.tipi);
  writeNotNull('TOPLU_DEPO', instance.topluDepo);
  writeNotNull('VADE_GUNU', instance.vadeGunu);
  writeNotNull('TEMP_SIP_LIST', instance.tempSipList);
  writeNotNull('KALEM_LIST', instance.kalemList);
  writeNotNull('KALEM_MODELLER', instance.kalemModeller);
  writeNotNull('KALEM_MODEL_LIST', instance.kalemModelList);
  writeNotNull('ACIK1', instance.acik1);
  writeNotNull('ACIK10', instance.acik10);
  writeNotNull('ACIK11', instance.acik11);
  writeNotNull('ACIK12', instance.acik12);
  writeNotNull('ACIK13', instance.acik13);
  writeNotNull('ACIK14', instance.acik14);
  writeNotNull('ACIK15', instance.acik15);
  writeNotNull('ACIK16', instance.acik16);
  writeNotNull('ACIK2', instance.acik2);
  writeNotNull('ACIK3', instance.acik3);
  writeNotNull('ACIK4', instance.acik4);
  writeNotNull('ACIK5', instance.acik5);
  writeNotNull('ACIK6', instance.acik6);
  writeNotNull('ACIK7', instance.acik7);
  writeNotNull('ACIK8', instance.acik8);
  writeNotNull('ACIK9', instance.acik9);
  writeNotNull('BELGE_KODU', instance.belgeKodu);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('BELGE_TURU', instance.belgeTuru);
  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('EK_ACIK1', instance.ekAcik1);
  writeNotNull('EK_ACIK10', instance.ekAcik10);
  writeNotNull('EK_ACIK11', instance.ekAcik11);
  writeNotNull('EK_ACIK12', instance.ekAcik12);
  writeNotNull('EK_ACIK13', instance.ekAcik13);
  writeNotNull('EK_ACIK14', instance.ekAcik14);
  writeNotNull('EK_ACIK15', instance.ekAcik15);
  writeNotNull('EK_ACIK16', instance.ekAcik16);
  writeNotNull('EK_ACIK2', instance.ekAcik2);
  writeNotNull('EK_ACIK3', instance.ekAcik3);
  writeNotNull('EK_ACIK4', instance.ekAcik4);
  writeNotNull('EK_ACIK5', instance.ekAcik5);
  writeNotNull('EK_ACIK6', instance.ekAcik6);
  writeNotNull('EK_ACIK7', instance.ekAcik7);
  writeNotNull('EK_ACIK8', instance.ekAcik8);
  writeNotNull('EK_ACIK9', instance.ekAcik9);
  writeNotNull('EK_ACIKLAMA', instance.ekAciklama);
  writeNotNull('ISLEM_ID', instance.islemId);
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('KDV_DAHIL', instance.kdvDahil);
  writeNotNull('KOSUL_KODU', instance.kosulKodu);
  writeNotNull('MEVCUT_BELGE_NO', instance.mevcutBelgeNo);
  writeNotNull('MEVCUT_CARI_KODU', instance.mevcutCariKodu);
  writeNotNull('ODEME_KODU', instance.odemeKodu);
  writeNotNull('OZEL_KOD1', instance.ozelKod1);
  writeNotNull('OZEL_KOD2', instance.ozelKod2);
  writeNotNull('PICKER_BELGE_TURU', instance.pickerBelgeTuru);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('REMOTE_TEMP_BELGE_ETIKETI', instance.remoteTempBelgeEtiketi);
  writeNotNull('TAG', instance.tag);
  return val;
}

CariModel _$CariModelFromJson(Map<String, dynamic> json) => CariModel()
  ..duzeltmetarihi = json['DUZELTMETARIHI'] == null
      ? null
      : DateTime.parse(json['DUZELTMETARIHI'] as String)
  ..kayittarihi = json['KAYITTARIHI'] == null
      ? null
      : DateTime.parse(json['KAYITTARIHI'] as String)
  ..alacakToplami = (json['ALACAK_TOPLAMI'] as num?)?.toDouble()
  ..bakiye = (json['BAKIYE'] as num?)?.toDouble()
  ..borcToplami = (json['BORC_TOPLAMI'] as num?)?.toDouble()
  ..boylam = (json['BOYLAM'] as num?)?.toDouble()
  ..enlem = (json['ENLEM'] as num?)?.toDouble()
  ..subeKodu = json['SUBE_KODU'] as int?
  ..cariAdi = json['CARI_ADI'] as String?
  ..cariAdres = json['CARI_ADRES'] as String?
  ..cariIl = json['CARI_IL'] as String?
  ..cariIlce = json['CARI_ILCE'] as String?
  ..cariKodu = json['CARI_KODU'] as String?
  ..cariTel = json['CARI_TEL'] as String?
  ..cariTip = json['CARI_TIP'] as String?
  ..cariTipAciklama = json['CARI_TIP_ACIKLAMA'] as String?
  ..duzeltmeyapankul = json['DUZELTMEYAPANKUL'] as String?
  ..efaturaCarisi = json['EFATURA_CARISI'] as String?
  ..efaturaTipi = json['EFATURA_TIPI'] as String?
  ..email = json['EMAIL'] as String?
  ..fax = json['FAX'] as String?
  ..hesaptutmasekli = json['HESAPTUTMASEKLI'] as String?
  ..kayityapankul = json['KAYITYAPANKUL'] as String?
  ..kilit = json['KILIT'] as String?
  ..kosulKodu = json['KOSUL_KODU'] as String?
  ..kull1S = json['KULL1_S'] as String?
  ..kull2S = json['KULL2_S'] as String?
  ..odemeTipi = json['ODEME_TIPI'] as String?
  ..plasiyerAciklama = json['PLASIYER_ACIKLAMA'] as String?
  ..plasiyerKodu = json['PLASIYER_KODU'] as String?
  ..riskTakibi = json['RISK_TAKIBI'] as String?
  ..ulkeAdi = json['ULKE_ADI'] as String?
  ..ulkeKodu = json['ULKE_KODU'] as String?
  ..vergiDairesi = json['VERGI_DAIRESI'] as String?
  ..vergiNumarasi = json['VERGI_NUMARASI'] as String?
  ..web = json['WEB'] as String?;

Map<String, dynamic> _$CariModelToJson(CariModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DUZELTMETARIHI', instance.duzeltmetarihi?.toIso8601String());
  writeNotNull('KAYITTARIHI', instance.kayittarihi?.toIso8601String());
  writeNotNull('ALACAK_TOPLAMI', instance.alacakToplami);
  writeNotNull('BAKIYE', instance.bakiye);
  writeNotNull('BORC_TOPLAMI', instance.borcToplami);
  writeNotNull('BOYLAM', instance.boylam);
  writeNotNull('ENLEM', instance.enlem);
  writeNotNull('SUBE_KODU', instance.subeKodu);
  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('CARI_ADRES', instance.cariAdres);
  writeNotNull('CARI_IL', instance.cariIl);
  writeNotNull('CARI_ILCE', instance.cariIlce);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('CARI_TEL', instance.cariTel);
  writeNotNull('CARI_TIP', instance.cariTip);
  writeNotNull('CARI_TIP_ACIKLAMA', instance.cariTipAciklama);
  writeNotNull('DUZELTMEYAPANKUL', instance.duzeltmeyapankul);
  writeNotNull('EFATURA_CARISI', instance.efaturaCarisi);
  writeNotNull('EFATURA_TIPI', instance.efaturaTipi);
  writeNotNull('EMAIL', instance.email);
  writeNotNull('FAX', instance.fax);
  writeNotNull('HESAPTUTMASEKLI', instance.hesaptutmasekli);
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('KILIT', instance.kilit);
  writeNotNull('KOSUL_KODU', instance.kosulKodu);
  writeNotNull('KULL1_S', instance.kull1S);
  writeNotNull('KULL2_S', instance.kull2S);
  writeNotNull('ODEME_TIPI', instance.odemeTipi);
  writeNotNull('PLASIYER_ACIKLAMA', instance.plasiyerAciklama);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('RISK_TAKIBI', instance.riskTakibi);
  writeNotNull('ULKE_ADI', instance.ulkeAdi);
  writeNotNull('ULKE_KODU', instance.ulkeKodu);
  writeNotNull('VERGI_DAIRESI', instance.vergiDairesi);
  writeNotNull('VERGI_NUMARASI', instance.vergiNumarasi);
  writeNotNull('WEB', instance.web);
  return val;
}

KalemModel _$KalemModelFromJson(Map<String, dynamic> json) => KalemModel()
  ..iskonto1OranMi = json['ISKONTO1_ORAN_MI'] as bool?
  ..tarih =
      json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String)
  ..teslimTarihi = json['TESLIM_TARIHI'] == null
      ? null
      : DateTime.parse(json['TESLIM_TARIHI'] as String)
  ..brutFiyat = (json['BRUT_FIYAT'] as num?)?.toDouble()
  ..depoKodu = json['DEPO_KODU'] as int?
  ..kdvOrani = (json['KDV_ORANI'] as num?)?.toDouble()
  ..miktar = (json['MIKTAR'] as num?)?.toDouble()
  ..olcuBirimKodu = json['OLCU_BIRIM_KODU'] as int?
  ..sira = json['SIRA'] as int?
  ..hucreList = json['HUCRE_LIST'] as List<dynamic>?
  ..kalemModelHucreList = json['KALEM_MODEL_HUCRE_LIST'] as List<dynamic>?
  ..seriList = json['SERI_LIST'] as List<dynamic>?
  ..tempBarkodList = json['TEMP_BARKOD_LIST'] as List<dynamic>?
  ..belgeNo = json['BELGE_NO'] as String?
  ..belgeTipi = json['BELGE_TIPI'] as String?
  ..cariKodu = json['CARI_KODU'] as String?
  ..depoTanimi = json['DEPO_TANIMI'] as String?
  ..olcuBirimAdi = json['OLCU_BIRIM_ADI'] as String?
  ..stokAdi = json['STOK_ADI'] as String?
  ..stokKodu = json['STOK_KODU'] as String?
  ..stokOlcuBirimi = json['STOK_OLCU_BIRIMI'] as String?;

Map<String, dynamic> _$KalemModelToJson(KalemModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ISKONTO1_ORAN_MI', instance.iskonto1OranMi);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('TESLIM_TARIHI', instance.teslimTarihi?.toIso8601String());
  writeNotNull('BRUT_FIYAT', instance.brutFiyat);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('KDV_ORANI', instance.kdvOrani);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('OLCU_BIRIM_KODU', instance.olcuBirimKodu);
  writeNotNull('SIRA', instance.sira);
  writeNotNull('HUCRE_LIST', instance.hucreList);
  writeNotNull('KALEM_MODEL_HUCRE_LIST', instance.kalemModelHucreList);
  writeNotNull('SERI_LIST', instance.seriList);
  writeNotNull('TEMP_BARKOD_LIST', instance.tempBarkodList);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('DEPO_TANIMI', instance.depoTanimi);
  writeNotNull('OLCU_BIRIM_ADI', instance.olcuBirimAdi);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_OLCU_BIRIMI', instance.stokOlcuBirimi);
  return val;
}

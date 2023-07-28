// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_siparis_edit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseSiparisEditModel _$BaseSiparisEditModelFromJson(
        Map<String, dynamic> json) =>
    BaseSiparisEditModel()
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
      ..ekMaliyet2Tutari = (json['EK_MALIYET2_TUTARI'] as num?)?.toDouble()
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
      ..ekMaliyet1Tutari = (json['EK_MALIYET1_TUTARI'] as num?)?.toDouble()
      ..ekMaliyet3Tutari = (json['EK_MALIYET3_TUTARI'] as num?)?.toDouble()
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
      ..tag = json['TAG'] as String?
      ..kalemAdedi = json['KALEM_ADEDI'] as int?
      ..teslimCariAdi = json['TESLIM_CARI_ADI'] as String?
      ..projeAciklama = json['PROJE_ACIKLAMA'] as String?
      ..plasiyerAciklama = json['PLASIYER_ACIKLAMA'] as String?
      ..cYedek6 = json['C_YEDEK6'] as String?
      ..cariEfaturami = json['CARI_EFATURAMI'] as String?;

Map<String, dynamic> _$BaseSiparisEditModelToJson(
        BaseSiparisEditModel instance) =>
    <String, dynamic>{
      'KDV_DAHILMI': instance.kdvDahilmi,
      'REMOTE_TEMP_BELGE': instance.remoteTempBelge,
      'TEMP_BELGE_MI': instance.tempBelgeMi,
      'CARI_MODEL': instance.cariModel,
      'ISLEME_BASLAMA_TARIHI': instance.islemeBaslamaTarihi?.toIso8601String(),
      'ISTENILEN_TESLIM_TARIHI':
          instance.istenilenTeslimTarihi?.toIso8601String(),
      'KAYITTARIHI': instance.kayittarihi?.toIso8601String(),
      'KOSUL_TARIHI': instance.kosulTarihi?.toIso8601String(),
      'TARIH': instance.tarih?.toIso8601String(),
      'TESLIM_TARIHI': instance.teslimTarihi?.toIso8601String(),
      'VADE_TARIHI': instance.vadeTarihi?.toIso8601String(),
      'ARA_TOPLAM': instance.araToplam,
      'EK_MALIYET2_TUTARI': instance.ekMaliyet2Tutari,
      'GENEL_ISKONTO1': instance.genelIskonto1,
      'GENEL_ISKONTO2': instance.genelIskonto2,
      'GENEL_ISKONTO3': instance.genelIskonto3,
      'GENEL_TOPLAM': instance.genelToplam,
      'GEN_ISK1_O': instance.genIsk1O,
      'GEN_ISK1_T': instance.genIsk1T,
      'GEN_ISK2_O': instance.genIsk2O,
      'GEN_ISK2_T': instance.genIsk2T,
      'GEN_ISK3_O': instance.genIsk3O,
      'GEN_ISK3_T': instance.genIsk3T,
      'KDV': instance.kdv,
      'BELGE_TIPI': instance.belgeTipi,
      'CIKIS_DEPO_KODU': instance.cikisDepoKodu,
      'EK_MALIYET1_TUTARI': instance.ekMaliyet1Tutari,
      'EK_MALIYET3_TUTARI': instance.ekMaliyet3Tutari,
      'GENISK1_TIPI': instance.genisk1Tipi,
      'GENISK2_TIPI': instance.genisk2Tipi,
      'GENISK3_TIPI': instance.genisk3Tipi,
      'KALEM_MODEL_ADEDI': instance.kalemModelAdedi,
      'TEMP_BELGE_ID': instance.tempBelgeId,
      'TEMP_KAYIT_TIPI': instance.tempKayitTipi,
      'TIPI': instance.tipi,
      'TOPLU_DEPO': instance.topluDepo,
      'VADE_GUNU': instance.vadeGunu,
      'TEMP_SIP_LIST': instance.tempSipList,
      'KALEM_MODELLER': instance.kalemModeller,
      'KALEM_MODEL_LIST': instance.kalemModelList,
      'ACIK1': instance.acik1,
      'ACIK10': instance.acik10,
      'ACIK11': instance.acik11,
      'ACIK12': instance.acik12,
      'ACIK13': instance.acik13,
      'ACIK14': instance.acik14,
      'ACIK15': instance.acik15,
      'ACIK16': instance.acik16,
      'ACIK2': instance.acik2,
      'ACIK3': instance.acik3,
      'ACIK4': instance.acik4,
      'ACIK5': instance.acik5,
      'ACIK6': instance.acik6,
      'ACIK7': instance.acik7,
      'ACIK8': instance.acik8,
      'ACIK9': instance.acik9,
      'BELGE_KODU': instance.belgeKodu,
      'BELGE_NO': instance.belgeNo,
      'BELGE_TURU': instance.belgeTuru,
      'CARI_ADI': instance.cariAdi,
      'CARI_KODU': instance.cariKodu,
      'EK_ACIK1': instance.ekAcik1,
      'EK_ACIK10': instance.ekAcik10,
      'EK_ACIK11': instance.ekAcik11,
      'EK_ACIK12': instance.ekAcik12,
      'EK_ACIK13': instance.ekAcik13,
      'EK_ACIK14': instance.ekAcik14,
      'EK_ACIK15': instance.ekAcik15,
      'EK_ACIK16': instance.ekAcik16,
      'EK_ACIK2': instance.ekAcik2,
      'EK_ACIK3': instance.ekAcik3,
      'EK_ACIK4': instance.ekAcik4,
      'EK_ACIK5': instance.ekAcik5,
      'EK_ACIK6': instance.ekAcik6,
      'EK_ACIK7': instance.ekAcik7,
      'EK_ACIK8': instance.ekAcik8,
      'EK_ACIK9': instance.ekAcik9,
      'EK_ACIKLAMA': instance.ekAciklama,
      'ISLEM_ID': instance.islemId,
      'KAYITYAPANKUL': instance.kayityapankul,
      'KDV_DAHIL': instance.kdvDahil,
      'KOSUL_KODU': instance.kosulKodu,
      'MEVCUT_BELGE_NO': instance.mevcutBelgeNo,
      'MEVCUT_CARI_KODU': instance.mevcutCariKodu,
      'ODEME_KODU': instance.odemeKodu,
      'OZEL_KOD1': instance.ozelKod1,
      'OZEL_KOD2': instance.ozelKod2,
      'PICKER_BELGE_TURU': instance.pickerBelgeTuru,
      'PLASIYER_KODU': instance.plasiyerKodu,
      'PROJE_KODU': instance.projeKodu,
      'REMOTE_TEMP_BELGE_ETIKETI': instance.remoteTempBelgeEtiketi,
      'TAG': instance.tag,
      'KALEM_ADEDI': instance.kalemAdedi,
      'TESLIM_CARI_ADI': instance.teslimCariAdi,
      'PROJE_ACIKLAMA': instance.projeAciklama,
      'PLASIYER_ACIKLAMA': instance.plasiyerAciklama,
      'C_YEDEK6': instance.cYedek6,
      'CARI_EFATURAMI': instance.cariEfaturami,
    };

CariModel _$CariModelFromJson(Map<String, dynamic> json) => CariModel()
  ..cariKodu = json['CARI_KODU'] as String?
  ..cariAdi = json['CARI_ADI'] as String?
  ..cariTip = json['CARI_TIP'] as String?
  ..cariTipAciklama = json['CARI_TIP_ACIKLAMA'] as String?
  ..kilit = json['KILIT'] as String?
  ..odemeTipi = json['ODEME_TIPI'] as String?
  ..hesaptutmasekli = json['HESAPTUTMASEKLI'] as String?
  ..subeKodu = json['SUBE_KODU'] as int?
  ..plasiyerKodu = json['PLASIYER_KODU'] as String?
  ..plasiyerAciklama = json['PLASIYER_ACIKLAMA'] as String?
  ..borcToplami = (json['BORC_TOPLAMI'] as num?)?.toDouble()
  ..alacakToplami = (json['ALACAK_TOPLAMI'] as num?)?.toDouble()
  ..bakiye = (json['BAKIYE'] as num?)?.toDouble()
  ..kosulKodu = json['KOSUL_KODU'] as String?
  ..ulkeKodu = json['ULKE_KODU'] as String?
  ..ulkeAdi = json['ULKE_ADI'] as String?
  ..cariIl = json['CARI_IL'] as String?
  ..cariIlce = json['CARI_ILCE'] as String?
  ..cariTel = json['CARI_TEL'] as String?
  ..fax = json['FAX'] as String?
  ..email = json['EMAIL'] as String?
  ..web = json['WEB'] as String?
  ..cariAdres = json['CARI_ADRES'] as String?
  ..vergiDairesi = json['VERGI_DAIRESI'] as String?
  ..vergiNumarasi = json['VERGI_NUMARASI'] as String?
  ..kayityapankul = json['KAYITYAPANKUL'] as String?
  ..kayittarihi = json['KAYITTARIHI'] == null
      ? null
      : DateTime.parse(json['KAYITTARIHI'] as String)
  ..duzeltmeyapankul = json['DUZELTMEYAPANKUL'] as String?
  ..duzeltmetarihi = json['DUZELTMETARIHI'] == null
      ? null
      : DateTime.parse(json['DUZELTMETARIHI'] as String)
  ..efaturaTipi = json['EFATURA_TIPI'] as String?
  ..enlem = (json['ENLEM'] as num?)?.toDouble()
  ..boylam = (json['BOYLAM'] as num?)?.toDouble()
  ..kull1S = json['KULL1_S'] as String?
  ..kull2S = json['KULL2_S'] as String?
  ..riskTakibi = json['RISK_TAKIBI'] as String?
  ..efaturaCarisi = json['EFATURA_CARISI'] as String?;

Map<String, dynamic> _$CariModelToJson(CariModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('CARI_TIP', instance.cariTip);
  writeNotNull('CARI_TIP_ACIKLAMA', instance.cariTipAciklama);
  writeNotNull('KILIT', instance.kilit);
  writeNotNull('ODEME_TIPI', instance.odemeTipi);
  writeNotNull('HESAPTUTMASEKLI', instance.hesaptutmasekli);
  writeNotNull('SUBE_KODU', instance.subeKodu);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('PLASIYER_ACIKLAMA', instance.plasiyerAciklama);
  writeNotNull('BORC_TOPLAMI', instance.borcToplami);
  writeNotNull('ALACAK_TOPLAMI', instance.alacakToplami);
  writeNotNull('BAKIYE', instance.bakiye);
  writeNotNull('KOSUL_KODU', instance.kosulKodu);
  writeNotNull('ULKE_KODU', instance.ulkeKodu);
  writeNotNull('ULKE_ADI', instance.ulkeAdi);
  writeNotNull('CARI_IL', instance.cariIl);
  writeNotNull('CARI_ILCE', instance.cariIlce);
  writeNotNull('CARI_TEL', instance.cariTel);
  writeNotNull('FAX', instance.fax);
  writeNotNull('EMAIL', instance.email);
  writeNotNull('WEB', instance.web);
  writeNotNull('CARI_ADRES', instance.cariAdres);
  writeNotNull('VERGI_DAIRESI', instance.vergiDairesi);
  writeNotNull('VERGI_NUMARASI', instance.vergiNumarasi);
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('KAYITTARIHI', instance.kayittarihi?.toIso8601String());
  writeNotNull('DUZELTMEYAPANKUL', instance.duzeltmeyapankul);
  writeNotNull('DUZELTMETARIHI', instance.duzeltmetarihi?.toIso8601String());
  writeNotNull('EFATURA_TIPI', instance.efaturaTipi);
  writeNotNull('ENLEM', instance.enlem);
  writeNotNull('BOYLAM', instance.boylam);
  writeNotNull('KULL1_S', instance.kull1S);
  writeNotNull('KULL2_S', instance.kull2S);
  writeNotNull('RISK_TAKIBI', instance.riskTakibi);
  writeNotNull('EFATURA_CARISI', instance.efaturaCarisi);
  return val;
}

KalemModel _$KalemModelFromJson(Map<String, dynamic> json) => KalemModel()
  ..tempBarkodList = json['TEMP_BARKOD_LIST'] as List<dynamic>?
  ..sira = json['SIRA'] as int?
  ..tarih =
      json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String)
  ..teslimTarihi = json['TESLIM_TARIHI'] == null
      ? null
      : DateTime.parse(json['TESLIM_TARIHI'] as String)
  ..belgeNo = json['BELGE_NO'] as String?
  ..belgeTipi = json['BELGE_TIPI'] as String?
  ..stokKodu = json['STOK_KODU'] as String?
  ..stokAdi = json['STOK_ADI'] as String?
  ..cariKodu = json['CARI_KODU'] as String?
  ..depoKodu = json['DEPO_KODU'] as int?
  ..depoTanimi = json['DEPO_TANIMI'] as String?
  ..miktar = json['MIKTAR'] as int?
  ..seriList = json['SERI_LIST'] as List<dynamic>?
  ..kdvOrani = json['KDV_ORANI'] as int?
  ..brutFiyat = json['BRUT_FIYAT'] as int?
  ..iskonto1OranMi = json['ISKONTO1_ORAN_MI'] as bool?
  ..olcuBirimKodu = json['OLCU_BIRIM_KODU'] as int?
  ..olcuBirimAdi = json['OLCU_BIRIM_ADI'] as String?
  ..stokOlcuBirimi = json['STOK_OLCU_BIRIMI'] as String?
  ..kalemModelHucreList = json['KALEM_MODEL_HUCRE_LIST'] as List<dynamic>?
  ..hucreList = json['HUCRE_LIST'] as List<dynamic>?;

Map<String, dynamic> _$KalemModelToJson(KalemModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TEMP_BARKOD_LIST', instance.tempBarkodList);
  writeNotNull('SIRA', instance.sira);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('TESLIM_TARIHI', instance.teslimTarihi?.toIso8601String());
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('DEPO_TANIMI', instance.depoTanimi);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('SERI_LIST', instance.seriList);
  writeNotNull('KDV_ORANI', instance.kdvOrani);
  writeNotNull('BRUT_FIYAT', instance.brutFiyat);
  writeNotNull('ISKONTO1_ORAN_MI', instance.iskonto1OranMi);
  writeNotNull('OLCU_BIRIM_KODU', instance.olcuBirimKodu);
  writeNotNull('OLCU_BIRIM_ADI', instance.olcuBirimAdi);
  writeNotNull('STOK_OLCU_BIRIMI', instance.stokOlcuBirimi);
  writeNotNull('KALEM_MODEL_HUCRE_LIST', instance.kalemModelHucreList);
  writeNotNull('HUCRE_LIST', instance.hucreList);
  return val;
}

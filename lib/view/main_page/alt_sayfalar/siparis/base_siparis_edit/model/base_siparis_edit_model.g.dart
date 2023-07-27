// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_siparis_edit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseSiparisEditModel _$BaseSiparisEditModelFromJson(
        Map<String, dynamic> json) =>
    BaseSiparisEditModel()
      ..islemId = json['ISLEM_ID'] as String?
      ..tempKayitTipi = json['TEMP_KAYIT_TIPI'] as int?
      ..tempBelgeId = json['TEMP_BELGE_ID'] as int?
      ..tempBelgeMi = json['TEMP_BELGE_MI'] as bool?
      ..remoteTempBelge = json['REMOTE_TEMP_BELGE'] as bool?
      ..remoteTempBelgeEtiketi = json['REMOTE_TEMP_BELGE_ETIKETI'] as String?
      ..cariModel = json['CARI_MODEL'] == null
          ? null
          : CariModel.fromJson(json['CARI_MODEL'] as Map<String, dynamic>)
      ..tempSipList = json['TEMP_SIP_LIST'] as List<dynamic>?
      ..kalemModelList = (json['KALEM_MODEL_LIST'] as List<dynamic>?)
          ?.map((e) => KalemModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..tarih =
          json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String)
      ..teslimTarihi = json['TESLIM_TARIHI'] == null
          ? null
          : DateTime.parse(json['TESLIM_TARIHI'] as String)
      ..istenilenTeslimTarihi = json['ISTENILEN_TESLIM_TARIHI'] == null
          ? null
          : DateTime.parse(json['ISTENILEN_TESLIM_TARIHI'] as String)
      ..belgeNo = json['BELGE_NO'] as String?
      ..belgeTuru = json['BELGE_TURU'] as String?
      ..belgeKodu = json['BELGE_KODU'] as String?
      ..acik1 = json['ACIK1'] as String?
      ..acik2 = json['ACIK2'] as String?
      ..acik7 = json['ACIK7'] as String?
      ..acik8 = json['ACIK8'] as String?
      ..kalemModelAdedi = json['KALEM_MODEL_ADEDI'] as int?
      ..cariKodu = json['CARI_KODU'] as String?
      ..cariAdi = json['CARI_ADI'] as String?
      ..tipi = json['TIPI'] as int?
      ..vadeTarihi = json['VADE_TARIHI'] == null
          ? null
          : DateTime.parse(json['VADE_TARIHI'] as String)
      ..kdvDahil = json['KDV_DAHIL'] as String?
      ..kayityapankul = json['KAYITYAPANKUL'] as String?
      ..kayittarihi = json['KAYITTARIHI'] == null
          ? null
          : DateTime.parse(json['KAYITTARIHI'] as String)
      ..kdv = (json['KDV'] as num?)?.toDouble()
      ..genelToplam = (json['GENEL_TOPLAM'] as num?)?.toDouble()
      ..kalemModeller = (json['KALEM_MODELLER'] as List<dynamic>?)
          ?.map((e) => KalemModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$BaseSiparisEditModelToJson(
        BaseSiparisEditModel instance) =>
    <String, dynamic>{
      'ISLEM_ID': instance.islemId,
      'TEMP_KAYIT_TIPI': instance.tempKayitTipi,
      'TEMP_BELGE_ID': instance.tempBelgeId,
      'TEMP_BELGE_MI': instance.tempBelgeMi,
      'REMOTE_TEMP_BELGE': instance.remoteTempBelge,
      'REMOTE_TEMP_BELGE_ETIKETI': instance.remoteTempBelgeEtiketi,
      'CARI_MODEL': instance.cariModel,
      'TEMP_SIP_LIST': instance.tempSipList,
      'KALEM_MODEL_LIST': instance.kalemModelList,
      'TARIH': instance.tarih?.toIso8601String(),
      'TESLIM_TARIHI': instance.teslimTarihi?.toIso8601String(),
      'ISTENILEN_TESLIM_TARIHI':
          instance.istenilenTeslimTarihi?.toIso8601String(),
      'BELGE_NO': instance.belgeNo,
      'BELGE_TURU': instance.belgeTuru,
      'BELGE_KODU': instance.belgeKodu,
      'ACIK1': instance.acik1,
      'ACIK2': instance.acik2,
      'ACIK7': instance.acik7,
      'ACIK8': instance.acik8,
      'KALEM_MODEL_ADEDI': instance.kalemModelAdedi,
      'CARI_KODU': instance.cariKodu,
      'CARI_ADI': instance.cariAdi,
      'TIPI': instance.tipi,
      'VADE_TARIHI': instance.vadeTarihi?.toIso8601String(),
      'KDV_DAHIL': instance.kdvDahil,
      'KAYITYAPANKUL': instance.kayityapankul,
      'KAYITTARIHI': instance.kayittarihi?.toIso8601String(),
      'KDV': instance.kdv,
      'GENEL_TOPLAM': instance.genelToplam,
      'KALEM_MODELLER': instance.kalemModeller,
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

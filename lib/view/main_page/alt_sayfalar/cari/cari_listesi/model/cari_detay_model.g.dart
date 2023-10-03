// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_detay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariDetayModel _$CariDetayModelFromJson(Map<String, dynamic> json) =>
    CariDetayModel()
      ..cariKodu = json['CARI_KODU'] as String?
      ..cariAdi = json['CARI_ADI'] as String?
      ..riskBorcToplami = (json['RISK_BORC_TOPLAMI'] as num?)?.toDouble()
      ..riskAlacakToplami = (json['RISK_ALACAK_TOPLAMI'] as num?)?.toDouble()
      ..riskBakiye = (json['RISK_BAKIYE'] as num?)?.toDouble()
      ..teminatRiski = (json['TEMINAT_RISKI'] as num?)?.toDouble()
      ..cekAsilRiski = (json['CEK_ASIL_RISKI'] as num?)?.toDouble()
      ..cekCiroRiski = (json['CEK_CIRO_RISKI'] as num?)?.toDouble()
      ..senetAsilRiski = (json['SENET_ASIL_RISKI'] as num?)?.toDouble()
      ..senetCiroRiski = (json['SENET_CIRO_RISKI'] as num?)?.toDouble()
      ..irsaliyeRiski = (json['IRSALIYE_RISKI'] as num?)?.toDouble()
      ..siparisRiski = (json['SIPARIS_RISKI'] as num?)?.toDouble()
      ..sevkRiski = (json['SEVK_RISKI'] as num?)?.toDouble()
      ..yuklemeRiski = (json['YUKLEME_RISKI'] as num?)?.toDouble()
      ..bilinmeyenRiskField =
          (json['BILINMEYEN_RISK_FIELD'] as num?)?.toDouble()
      ..brutRiskToplami = (json['BRUT_RISK_TOPLAMI'] as num?)?.toDouble()
      ..hareketBakiyeRiskO = (json['HAREKET_BAKIYE_RISK_O'] as num?)?.toDouble()
      ..teminatRiskO = (json['TEMINAT_RISK_O'] as num?)?.toDouble()
      ..senetAsilRiskO = (json['SENET_ASIL_RISK_O'] as num?)?.toDouble()
      ..senetCiroRiskO = (json['SENET_CIRO_RISK_O'] as num?)?.toDouble()
      ..cekAsilRiskO = (json['CEK_ASIL_RISK_O'] as num?)?.toDouble()
      ..cekCiroRiskO = (json['CEK_CIRO_RISK_O'] as num?)?.toDouble()
      ..siparisRiskO = (json['SIPARIS_RISK_O'] as num?)?.toDouble()
      ..sevkRiskO = (json['SEVK_RISK_O'] as num?)?.toDouble()
      ..yuklemeRiskO = (json['YUKLEME_RISK_O'] as num?)?.toDouble()
      ..irsaliyeRiskO = (json['IRSALIYE_RISK_O'] as num?)?.toDouble()
      ..riskLimiti = (json['RISK_LIMITI'] as num?)?.toDouble()
      ..teminatTutari = (json['TEMINAT_TUTARI'] as num?)?.toDouble()
      ..irtibatList = (json['IrtibatList'] as List<dynamic>?)
          ?.map((e) => IrtibatList.fromJson(e as Map<String, dynamic>))
          .toList()
      ..bankaList = (json['BankaList'] as List<dynamic>?)
          ?.map((e) => BankaList.fromJson(e as Map<String, dynamic>))
          .toList()
      ..cariList = (json['CariList'] as List<dynamic>?)
          ?.map((e) => CariList.fromJson(e as Map<String, dynamic>))
          .toList()
      ..bakiyeList = (json['BakiyeList'] as List<dynamic>?)
          ?.map((e) => BakiyeList.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$CariDetayModelToJson(CariDetayModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('RISK_BORC_TOPLAMI', instance.riskBorcToplami);
  writeNotNull('RISK_ALACAK_TOPLAMI', instance.riskAlacakToplami);
  writeNotNull('RISK_BAKIYE', instance.riskBakiye);
  writeNotNull('TEMINAT_RISKI', instance.teminatRiski);
  writeNotNull('CEK_ASIL_RISKI', instance.cekAsilRiski);
  writeNotNull('CEK_CIRO_RISKI', instance.cekCiroRiski);
  writeNotNull('SENET_ASIL_RISKI', instance.senetAsilRiski);
  writeNotNull('SENET_CIRO_RISKI', instance.senetCiroRiski);
  writeNotNull('IRSALIYE_RISKI', instance.irsaliyeRiski);
  writeNotNull('SIPARIS_RISKI', instance.siparisRiski);
  writeNotNull('SEVK_RISKI', instance.sevkRiski);
  writeNotNull('YUKLEME_RISKI', instance.yuklemeRiski);
  writeNotNull('BILINMEYEN_RISK_FIELD', instance.bilinmeyenRiskField);
  writeNotNull('BRUT_RISK_TOPLAMI', instance.brutRiskToplami);
  writeNotNull('HAREKET_BAKIYE_RISK_O', instance.hareketBakiyeRiskO);
  writeNotNull('TEMINAT_RISK_O', instance.teminatRiskO);
  writeNotNull('SENET_ASIL_RISK_O', instance.senetAsilRiskO);
  writeNotNull('SENET_CIRO_RISK_O', instance.senetCiroRiskO);
  writeNotNull('CEK_ASIL_RISK_O', instance.cekAsilRiskO);
  writeNotNull('CEK_CIRO_RISK_O', instance.cekCiroRiskO);
  writeNotNull('SIPARIS_RISK_O', instance.siparisRiskO);
  writeNotNull('SEVK_RISK_O', instance.sevkRiskO);
  writeNotNull('YUKLEME_RISK_O', instance.yuklemeRiskO);
  writeNotNull('IRSALIYE_RISK_O', instance.irsaliyeRiskO);
  writeNotNull('RISK_LIMITI', instance.riskLimiti);
  writeNotNull('TEMINAT_TUTARI', instance.teminatTutari);
  writeNotNull(
      'IrtibatList', instance.irtibatList?.map((e) => e.toJson()).toList());
  writeNotNull(
      'BankaList', instance.bankaList?.map((e) => e.toJson()).toList());
  writeNotNull('CariList', instance.cariList?.map((e) => e.toJson()).toList());
  writeNotNull(
      'BakiyeList', instance.bakiyeList?.map((e) => e.toJson()).toList());
  return val;
}

BakiyeList _$BakiyeListFromJson(Map<String, dynamic> json) => BakiyeList()
  ..cariKodu = json['CARI_KODU'] as String?
  ..dovizTipi = json['DOVIZ_TIPI'] as int?
  ..borcToplami = (json['BORC_TOPLAMI'] as num?)?.toDouble()
  ..alacakToplami = (json['ALACAK_TOPLAMI'] as num?)?.toDouble()
  ..bakiye = (json['BAKIYE'] as num?)?.toDouble()
  ..dovizAdi = json['DOVIZ_ADI'] as String?;

Map<String, dynamic> _$BakiyeListToJson(BakiyeList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('BORC_TOPLAMI', instance.borcToplami);
  writeNotNull('ALACAK_TOPLAMI', instance.alacakToplami);
  writeNotNull('BAKIYE', instance.bakiye);
  writeNotNull('DOVIZ_ADI', instance.dovizAdi);
  return val;
}

BankaList _$BankaListFromJson(Map<String, dynamic> json) => BankaList()
  ..cariKodu = json['CARI_KODU'] as String?
  ..ibanno = json['IBANNO'] as String?
  ..bankakodu = json['BANKAKODU'] as String?
  ..subekodu = json['SUBEKODU'] as String?
  ..bankahesno = json['BANKAHESNO'] as String?
  ..bankaAdi = json['BANKA_ADI'] as String?
  ..subeAdi = json['SUBE_ADI'] as String?
  ..dovizTipi = json['DOVIZ_TIPI'] as int?
  ..dovizAdi = json['DOVIZ_ADI'] as String?;

Map<String, dynamic> _$BankaListToJson(BankaList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('IBANNO', instance.ibanno);
  writeNotNull('BANKAKODU', instance.bankakodu);
  writeNotNull('SUBEKODU', instance.subekodu);
  writeNotNull('BANKAHESNO', instance.bankahesno);
  writeNotNull('BANKA_ADI', instance.bankaAdi);
  writeNotNull('SUBE_ADI', instance.subeAdi);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('DOVIZ_ADI', instance.dovizAdi);
  return val;
}

CariList _$CariListFromJson(Map<String, dynamic> json) => CariList()
  ..cariKodu = json['CARI_KODU'] as String?
  ..cariAdi = json['CARI_ADI'] as String?
  ..cariTip = json['CARI_TIP'] as String?
  ..cariTipAciklama = json['CARI_TIP_ACIKLAMA'] as String?
  ..kilit = json['KILIT'] as String?
  ..vadeGunu = json['VADE_GUNU'] as int?
  ..bilgi = json['BILGI'] as String?
  ..odemeTipi = json['ODEME_TIPI'] as String?
  ..hesaptutmasekli = json['HESAPTUTMASEKLI'] as String?
  ..plasiyerKodu = json['PLASIYER_KODU'] as String?
  ..plasiyerAciklama = json['PLASIYER_ACIKLAMA'] as String?
  ..muhKodu = json['MUH_KODU'] as String?
  ..borcToplami = (json['BORC_TOPLAMI'] as num?)?.toDouble()
  ..alacakToplami = (json['ALACAK_TOPLAMI'] as num?)?.toDouble()
  ..bakiye = (json['BAKIYE'] as num?)?.toDouble()
  ..ulkeKodu = json['ULKE_KODU'] as String?
  ..ulkeAdi = json['ULKE_ADI'] as String?
  ..cariIl = json['CARI_IL'] as String?
  ..cariIlce = json['CARI_ILCE'] as String?
  ..cariTel = json['CARI_TEL'] as String?
  ..postakodu = json['POSTAKODU'] as String?
  ..email = json['EMAIL'] as String?
  ..web = json['WEB'] as String?
  ..cariAdres = json['CARI_ADRES'] as String?
  ..vergiDairesi = json['VERGI_DAIRESI'] as String?
  ..vergiNumarasi = json['VERGI_NUMARASI'] as String?
  ..grupKodu = json['GRUP_KODU'] as String?
  ..grupTanimi = json['GRUP_TANIMI'] as String?
  ..kod1 = json['KOD1'] as String?
  ..kod1Tanimi = json['KOD1_TANIMI'] as String?
  ..kod2 = json['KOD2'] as String?
  ..kod2Tanimi = json['KOD2_TANIMI'] as String?
  ..kod3 = json['KOD3'] as String?
  ..kod3Tanimi = json['KOD3_TANIMI'] as String?
  ..kayittarihi = json['KAYITTARIHI'] as String?
  ..duzeltmeyapankul = json['DUZELTMEYAPANKUL'] as String?
  ..duzeltmetarihi = json['DUZELTMETARIHI'] as String?
  ..efaturaMi = json['EFATURA_MI'] as bool?
  ..efaturaTipi = json['EFATURA_TIPI'] as String?
  ..efatGecisTarihi = json['EFAT_GECIS_TARIHI'] as String?
  ..efatAktif = json['EFAT_AKTIF'] as bool?
  ..enlem = (json['ENLEM'] as num?)?.toDouble()
  ..boylam = (json['BOYLAM'] as num?)?.toDouble()
  ..riskTakibi = json['RISK_TAKIBI'] as String?
  ..efaturaCarisi = json['EFATURA_CARISI'] as String?
  ..depoKodlari =
      (json['DEPO_KODLARI'] as List<dynamic>?)?.map((e) => e as int).toList();

Map<String, dynamic> _$CariListToJson(CariList instance) {
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
  writeNotNull('VADE_GUNU', instance.vadeGunu);
  writeNotNull('BILGI', instance.bilgi);
  writeNotNull('ODEME_TIPI', instance.odemeTipi);
  writeNotNull('HESAPTUTMASEKLI', instance.hesaptutmasekli);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('PLASIYER_ACIKLAMA', instance.plasiyerAciklama);
  writeNotNull('MUH_KODU', instance.muhKodu);
  writeNotNull('BORC_TOPLAMI', instance.borcToplami);
  writeNotNull('ALACAK_TOPLAMI', instance.alacakToplami);
  writeNotNull('BAKIYE', instance.bakiye);
  writeNotNull('ULKE_KODU', instance.ulkeKodu);
  writeNotNull('ULKE_ADI', instance.ulkeAdi);
  writeNotNull('CARI_IL', instance.cariIl);
  writeNotNull('CARI_ILCE', instance.cariIlce);
  writeNotNull('CARI_TEL', instance.cariTel);
  writeNotNull('POSTAKODU', instance.postakodu);
  writeNotNull('EMAIL', instance.email);
  writeNotNull('WEB', instance.web);
  writeNotNull('CARI_ADRES', instance.cariAdres);
  writeNotNull('VERGI_DAIRESI', instance.vergiDairesi);
  writeNotNull('VERGI_NUMARASI', instance.vergiNumarasi);
  writeNotNull('GRUP_KODU', instance.grupKodu);
  writeNotNull('GRUP_TANIMI', instance.grupTanimi);
  writeNotNull('KOD1', instance.kod1);
  writeNotNull('KOD1_TANIMI', instance.kod1Tanimi);
  writeNotNull('KOD2', instance.kod2);
  writeNotNull('KOD2_TANIMI', instance.kod2Tanimi);
  writeNotNull('KOD3', instance.kod3);
  writeNotNull('KOD3_TANIMI', instance.kod3Tanimi);
  writeNotNull('KAYITTARIHI', instance.kayittarihi);
  writeNotNull('DUZELTMEYAPANKUL', instance.duzeltmeyapankul);
  writeNotNull('DUZELTMETARIHI', instance.duzeltmetarihi);
  writeNotNull('EFATURA_MI', instance.efaturaMi);
  writeNotNull('EFATURA_TIPI', instance.efaturaTipi);
  writeNotNull('EFAT_GECIS_TARIHI', instance.efatGecisTarihi);
  writeNotNull('EFAT_AKTIF', instance.efatAktif);
  writeNotNull('ENLEM', instance.enlem);
  writeNotNull('BOYLAM', instance.boylam);
  writeNotNull('RISK_TAKIBI', instance.riskTakibi);
  writeNotNull('EFATURA_CARISI', instance.efaturaCarisi);
  writeNotNull('DEPO_KODLARI', instance.depoKodlari);
  return val;
}

IrtibatList _$IrtibatListFromJson(Map<String, dynamic> json) => IrtibatList()
  ..cariKodu = json['CARI_KODU'] as String?
  ..yetkiliKisi = json['YETKILI_KISI'] as String?
  ..gorev = json['GOREV'] as String?
  ..sabitTel1 = json['SABIT_TEL1'] as String?
  ..emailSplit = json['EMAIL_SPLIT'] as String?
  ..aktif = json['AKTIF'] as bool?;

Map<String, dynamic> _$IrtibatListToJson(IrtibatList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('YETKILI_KISI', instance.yetkiliKisi);
  writeNotNull('GOREV', instance.gorev);
  writeNotNull('SABIT_TEL1', instance.sabitTel1);
  writeNotNull('EMAIL_SPLIT', instance.emailSplit);
  writeNotNull('AKTIF', instance.aktif);
  return val;
}

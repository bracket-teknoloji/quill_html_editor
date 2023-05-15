// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'cari_detay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariDetayModel _$CariDetayModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CariDetayModel',
      json,
      ($checkedConvert) {
        final val = CariDetayModel();
        $checkedConvert('CARI_KODU', (v) => val.cariKodu = v as String?);
        $checkedConvert('CARI_ADI', (v) => val.cariAdi = v as String?);
        $checkedConvert('RISK_BORC_TOPLAMI',
            (v) => val.riskBorcToplami = (v as num?)?.toDouble());
        $checkedConvert('RISK_ALACAK_TOPLAMI',
            (v) => val.riskAlacakToplami = (v as num?)?.toDouble());
        $checkedConvert(
            'RISK_BAKIYE', (v) => val.riskBakiye = (v as num?)?.toDouble());
        $checkedConvert(
            'TEMINAT_RISKI', (v) => val.teminatRiski = (v as num?)?.toDouble());
        $checkedConvert('CEK_ASIL_RISKI',
            (v) => val.cekAsilRiski = (v as num?)?.toDouble());
        $checkedConvert('CEK_CIRO_RISKI',
            (v) => val.cekCiroRiski = (v as num?)?.toDouble());
        $checkedConvert('SENET_ASIL_RISKI',
            (v) => val.senetAsilRiski = (v as num?)?.toDouble());
        $checkedConvert('SENET_CIRO_RISKI',
            (v) => val.senetCiroRiski = (v as num?)?.toDouble());
        $checkedConvert('IRSALIYE_RISKI',
            (v) => val.irsaliyeRiski = (v as num?)?.toDouble());
        $checkedConvert(
            'SIPARIS_RISKI', (v) => val.siparisRiski = (v as num?)?.toDouble());
        $checkedConvert(
            'SEVK_RISKI', (v) => val.sevkRiski = (v as num?)?.toDouble());
        $checkedConvert(
            'YUKLEME_RISKI', (v) => val.yuklemeRiski = (v as num?)?.toDouble());
        $checkedConvert('BILINMEYEN_RISK_FIELD',
            (v) => val.bilinmeyenRiskField = (v as num?)?.toDouble());
        $checkedConvert('BRUT_RISK_TOPLAMI',
            (v) => val.brutRiskToplami = (v as num?)?.toDouble());
        $checkedConvert('HAREKET_BAKIYE_RISK_O',
            (v) => val.hareketBakiyeRiskO = (v as num?)?.toDouble());
        $checkedConvert('TEMINAT_RISK_O',
            (v) => val.teminatRiskO = (v as num?)?.toDouble());
        $checkedConvert('SENET_ASIL_RISK_O',
            (v) => val.senetAsilRiskO = (v as num?)?.toDouble());
        $checkedConvert('SENET_CIRO_RISK_O',
            (v) => val.senetCiroRiskO = (v as num?)?.toDouble());
        $checkedConvert('CEK_ASIL_RISK_O',
            (v) => val.cekAsilRiskO = (v as num?)?.toDouble());
        $checkedConvert('CEK_CIRO_RISK_O',
            (v) => val.cekCiroRiskO = (v as num?)?.toDouble());
        $checkedConvert('SIPARIS_RISK_O',
            (v) => val.siparisRiskO = (v as num?)?.toDouble());
        $checkedConvert(
            'SEVK_RISK_O', (v) => val.sevkRiskO = (v as num?)?.toDouble());
        $checkedConvert('YUKLEME_RISK_O',
            (v) => val.yuklemeRiskO = (v as num?)?.toDouble());
        $checkedConvert('IRSALIYE_RISK_O',
            (v) => val.irsaliyeRiskO = (v as num?)?.toDouble());
        $checkedConvert(
            'RISK_LIMITI', (v) => val.riskLimiti = (v as num?)?.toDouble());
        $checkedConvert('TEMINAT_TUTARI',
            (v) => val.teminatTutari = (v as num?)?.toDouble());
        $checkedConvert(
            'IrtibatList',
            (v) => val.irtibatList = (v as List<dynamic>?)
                ?.map((e) => IrtibatList.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'BankaList',
            (v) => val.bankaList = (v as List<dynamic>?)
                ?.map((e) => BankaList.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'CariList',
            (v) => val.cariList = (v as List<dynamic>?)
                ?.map((e) => CariList.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'BakiyeList',
            (v) => val.bakiyeList = (v as List<dynamic>?)
                ?.map((e) => BakiyeList.fromJson(e as Map<String, dynamic>))
                .toList());
        return val;
      },
      fieldKeyMap: const {
        'cariKodu': 'CARI_KODU',
        'cariAdi': 'CARI_ADI',
        'riskBorcToplami': 'RISK_BORC_TOPLAMI',
        'riskAlacakToplami': 'RISK_ALACAK_TOPLAMI',
        'riskBakiye': 'RISK_BAKIYE',
        'teminatRiski': 'TEMINAT_RISKI',
        'cekAsilRiski': 'CEK_ASIL_RISKI',
        'cekCiroRiski': 'CEK_CIRO_RISKI',
        'senetAsilRiski': 'SENET_ASIL_RISKI',
        'senetCiroRiski': 'SENET_CIRO_RISKI',
        'irsaliyeRiski': 'IRSALIYE_RISKI',
        'siparisRiski': 'SIPARIS_RISKI',
        'sevkRiski': 'SEVK_RISKI',
        'yuklemeRiski': 'YUKLEME_RISKI',
        'bilinmeyenRiskField': 'BILINMEYEN_RISK_FIELD',
        'brutRiskToplami': 'BRUT_RISK_TOPLAMI',
        'hareketBakiyeRiskO': 'HAREKET_BAKIYE_RISK_O',
        'teminatRiskO': 'TEMINAT_RISK_O',
        'senetAsilRiskO': 'SENET_ASIL_RISK_O',
        'senetCiroRiskO': 'SENET_CIRO_RISK_O',
        'cekAsilRiskO': 'CEK_ASIL_RISK_O',
        'cekCiroRiskO': 'CEK_CIRO_RISK_O',
        'siparisRiskO': 'SIPARIS_RISK_O',
        'sevkRiskO': 'SEVK_RISK_O',
        'yuklemeRiskO': 'YUKLEME_RISK_O',
        'irsaliyeRiskO': 'IRSALIYE_RISK_O',
        'riskLimiti': 'RISK_LIMITI',
        'teminatTutari': 'TEMINAT_TUTARI',
        'irtibatList': 'IrtibatList',
        'bankaList': 'BankaList',
        'cariList': 'CariList',
        'bakiyeList': 'BakiyeList'
      },
    );

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

BakiyeList _$BakiyeListFromJson(Map<String, dynamic> json) => $checkedCreate(
      'BakiyeList',
      json,
      ($checkedConvert) {
        final val = BakiyeList();
        $checkedConvert('CARI_KODU', (v) => val.cariKodu = v as String?);
        $checkedConvert('DOVIZ_TIPI', (v) => val.dovizTipi = v as int?);
        $checkedConvert(
            'BORC_TOPLAMI', (v) => val.borcToplami = (v as num?)?.toDouble());
        $checkedConvert('ALACAK_TOPLAMI',
            (v) => val.alacakToplami = (v as num?)?.toDouble());
        $checkedConvert('BAKIYE', (v) => val.bakiye = (v as num?)?.toDouble());
        $checkedConvert('DOVIZ_ADI', (v) => val.dovizAdi = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'cariKodu': 'CARI_KODU',
        'dovizTipi': 'DOVIZ_TIPI',
        'borcToplami': 'BORC_TOPLAMI',
        'alacakToplami': 'ALACAK_TOPLAMI',
        'bakiye': 'BAKIYE',
        'dovizAdi': 'DOVIZ_ADI'
      },
    );

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

BankaList _$BankaListFromJson(Map<String, dynamic> json) => $checkedCreate(
      'BankaList',
      json,
      ($checkedConvert) {
        final val = BankaList();
        $checkedConvert('CARI_KODU', (v) => val.cariKodu = v as String?);
        $checkedConvert('IBANNO', (v) => val.ibanno = v as String?);
        $checkedConvert('BANKAKODU', (v) => val.bankakodu = v as String?);
        $checkedConvert('SUBEKODU', (v) => val.subekodu = v as String?);
        $checkedConvert('BANKAHESNO', (v) => val.bankahesno = v as String?);
        $checkedConvert('BANKA_ADI', (v) => val.bankaAdi = v as String?);
        $checkedConvert('SUBE_ADI', (v) => val.subeAdi = v as String?);
        $checkedConvert('DOVIZ_TIPI', (v) => val.dovizTipi = v as String?);
        $checkedConvert('DOVIZ_ADI', (v) => val.dovizAdi = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'cariKodu': 'CARI_KODU',
        'ibanno': 'IBANNO',
        'bankakodu': 'BANKAKODU',
        'subekodu': 'SUBEKODU',
        'bankahesno': 'BANKAHESNO',
        'bankaAdi': 'BANKA_ADI',
        'subeAdi': 'SUBE_ADI',
        'dovizTipi': 'DOVIZ_TIPI',
        'dovizAdi': 'DOVIZ_ADI'
      },
    );

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

CariList _$CariListFromJson(Map<String, dynamic> json) => $checkedCreate(
      'CariList',
      json,
      ($checkedConvert) {
        final val = CariList();
        $checkedConvert('CARI_KODU', (v) => val.cariKodu = v as String?);
        $checkedConvert('CARI_ADI', (v) => val.cariAdi = v as String?);
        $checkedConvert('CARI_TIP', (v) => val.cariTip = v as String?);
        $checkedConvert(
            'CARI_TIP_ACIKLAMA', (v) => val.cariTipAciklama = v as String?);
        $checkedConvert('KILIT', (v) => val.kilit = v as String?);
        $checkedConvert('VADE_GUNU', (v) => val.vadeGunu = v as int?);
        $checkedConvert('BILGI', (v) => val.bilgi = v as String?);
        $checkedConvert('ODEME_TIPI', (v) => val.odemeTipi = v as String?);
        $checkedConvert(
            'HESAPTUTMASEKLI', (v) => val.hesaptutmasekli = v as String?);
        $checkedConvert(
            'PLASIYER_KODU', (v) => val.plasiyerKodu = v as String?);
        $checkedConvert(
            'PLASIYER_ACIKLAMA', (v) => val.plasiyerAciklama = v as String?);
        $checkedConvert('MUH_KODU', (v) => val.muhKodu = v as String?);
        $checkedConvert(
            'BORC_TOPLAMI', (v) => val.borcToplami = (v as num?)?.toDouble());
        $checkedConvert('ALACAK_TOPLAMI',
            (v) => val.alacakToplami = (v as num?)?.toDouble());
        $checkedConvert('BAKIYE', (v) => val.bakiye = (v as num?)?.toDouble());
        $checkedConvert('ULKE_KODU', (v) => val.ulkeKodu = v as String?);
        $checkedConvert('ULKE_ADI', (v) => val.ulkeAdi = v as String?);
        $checkedConvert('CARI_IL', (v) => val.cariIl = v as String?);
        $checkedConvert('CARI_ILCE', (v) => val.cariIlce = v as String?);
        $checkedConvert('CARI_TEL', (v) => val.cariTel = v as String?);
        $checkedConvert('POSTAKODU', (v) => val.postakodu = v as String?);
        $checkedConvert('EMAIL', (v) => val.email = v as String?);
        $checkedConvert('WEB', (v) => val.web = v as String?);
        $checkedConvert('CARI_ADRES', (v) => val.cariAdres = v as String?);
        $checkedConvert(
            'VERGI_DAIRESI', (v) => val.vergiDairesi = v as String?);
        $checkedConvert(
            'VERGI_NUMARASI', (v) => val.vergiNumarasi = v as String?);
        $checkedConvert('GRUP_KODU', (v) => val.grupKodu = v as String?);
        $checkedConvert('GRUP_TANIMI', (v) => val.grupTanimi = v as String?);
        $checkedConvert('KOD1', (v) => val.kod1 = v as String?);
        $checkedConvert('KOD1_TANIMI', (v) => val.kod1Tanimi = v as String?);
        $checkedConvert('KOD2', (v) => val.kod2 = v as String?);
        $checkedConvert('KOD2_TANIMI', (v) => val.kod2Tanimi = v as String?);
        $checkedConvert('KOD3', (v) => val.kod3 = v as String?);
        $checkedConvert('KOD3_TANIMI', (v) => val.kod3Tanimi = v as String?);
        $checkedConvert('KAYITTARIHI', (v) => val.kayittarihi = v as String?);
        $checkedConvert(
            'DUZELTMEYAPANKUL', (v) => val.duzeltmeyapankul = v as String?);
        $checkedConvert(
            'DUZELTMETARIHI', (v) => val.duzeltmetarihi = v as String?);
        $checkedConvert('EFATURA_MI', (v) => val.efaturaMi = v as bool?);
        $checkedConvert('EFATURA_TIPI', (v) => val.efaturaTipi = v as String?);
        $checkedConvert(
            'EFAT_GECIS_TARIHI', (v) => val.efatGecisTarihi = v as String?);
        $checkedConvert('EFAT_AKTIF', (v) => val.efatAktif = v as bool?);
        $checkedConvert('ENLEM', (v) => val.enlem = (v as num?)?.toDouble());
        $checkedConvert('BOYLAM', (v) => val.boylam = (v as num?)?.toDouble());
        $checkedConvert('RISK_TAKIBI', (v) => val.riskTakibi = v as String?);
        $checkedConvert(
            'EFATURA_CARISI', (v) => val.efaturaCarisi = v as String?);
        $checkedConvert(
            'DEPO_KODLARI',
            (v) => val.depoKodlari =
                (v as List<dynamic>?)?.map((e) => e as int).toList());
        return val;
      },
      fieldKeyMap: const {
        'cariKodu': 'CARI_KODU',
        'cariAdi': 'CARI_ADI',
        'cariTip': 'CARI_TIP',
        'cariTipAciklama': 'CARI_TIP_ACIKLAMA',
        'kilit': 'KILIT',
        'vadeGunu': 'VADE_GUNU',
        'bilgi': 'BILGI',
        'odemeTipi': 'ODEME_TIPI',
        'hesaptutmasekli': 'HESAPTUTMASEKLI',
        'plasiyerKodu': 'PLASIYER_KODU',
        'plasiyerAciklama': 'PLASIYER_ACIKLAMA',
        'muhKodu': 'MUH_KODU',
        'borcToplami': 'BORC_TOPLAMI',
        'alacakToplami': 'ALACAK_TOPLAMI',
        'bakiye': 'BAKIYE',
        'ulkeKodu': 'ULKE_KODU',
        'ulkeAdi': 'ULKE_ADI',
        'cariIl': 'CARI_IL',
        'cariIlce': 'CARI_ILCE',
        'cariTel': 'CARI_TEL',
        'postakodu': 'POSTAKODU',
        'email': 'EMAIL',
        'web': 'WEB',
        'cariAdres': 'CARI_ADRES',
        'vergiDairesi': 'VERGI_DAIRESI',
        'vergiNumarasi': 'VERGI_NUMARASI',
        'grupKodu': 'GRUP_KODU',
        'grupTanimi': 'GRUP_TANIMI',
        'kod1': 'KOD1',
        'kod1Tanimi': 'KOD1_TANIMI',
        'kod2': 'KOD2',
        'kod2Tanimi': 'KOD2_TANIMI',
        'kod3': 'KOD3',
        'kod3Tanimi': 'KOD3_TANIMI',
        'kayittarihi': 'KAYITTARIHI',
        'duzeltmeyapankul': 'DUZELTMEYAPANKUL',
        'duzeltmetarihi': 'DUZELTMETARIHI',
        'efaturaMi': 'EFATURA_MI',
        'efaturaTipi': 'EFATURA_TIPI',
        'efatGecisTarihi': 'EFAT_GECIS_TARIHI',
        'efatAktif': 'EFAT_AKTIF',
        'enlem': 'ENLEM',
        'boylam': 'BOYLAM',
        'riskTakibi': 'RISK_TAKIBI',
        'efaturaCarisi': 'EFATURA_CARISI',
        'depoKodlari': 'DEPO_KODLARI'
      },
    );

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

IrtibatList _$IrtibatListFromJson(Map<String, dynamic> json) => $checkedCreate(
      'IrtibatList',
      json,
      ($checkedConvert) {
        final val = IrtibatList();
        $checkedConvert('CARI_KODU', (v) => val.cariKodu = v as String?);
        $checkedConvert('YETKILI_KISI', (v) => val.yetkiliKisi = v as String?);
        $checkedConvert('GOREV', (v) => val.gorev = v as String?);
        $checkedConvert('SABIT_TEL1', (v) => val.sabitTel1 = v as String?);
        $checkedConvert('EMAIL_SPLIT', (v) => val.emailSplit = v as String?);
        $checkedConvert('AKTIF', (v) => val.aktif = v as bool?);
        return val;
      },
      fieldKeyMap: const {
        'cariKodu': 'CARI_KODU',
        'yetkiliKisi': 'YETKILI_KISI',
        'gorev': 'GOREV',
        'sabitTel1': 'SABIT_TEL1',
        'emailSplit': 'EMAIL_SPLIT',
        'aktif': 'AKTIF'
      },
    );

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

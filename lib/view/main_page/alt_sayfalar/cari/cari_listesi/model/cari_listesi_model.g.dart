// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'cari_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariListesiModel _$CariListesiModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CariListesiModel',
      json,
      ($checkedConvert) {
        final val = CariListesiModel();
        $checkedConvert('CARI_KODU', (v) => val.cariKodu = v as String?);
        $checkedConvert('CARI_ADI', (v) => val.cariAdi = v as String?);
        $checkedConvert('BAGLI_CARI', (v) => val.bagliCari = v as String?);
        $checkedConvert(
            'BAGLI_CARI_ADI', (v) => val.bagliCariAdi = v as String?);
        $checkedConvert('CARI_TIP', (v) => val.cariTip = v as String?);
        $checkedConvert(
            'CARI_TIP_ACIKLAMA', (v) => val.cariTipAciklama = v as String?);
        $checkedConvert('KILIT', (v) => val.kilit = v as String?);
        $checkedConvert('VADE_GUNU', (v) => val.vadeGunu = v as int?);
        $checkedConvert('ODEME_TIPI', (v) => val.odemeTipi = v as String?);
        $checkedConvert(
            'HESAPTUTMASEKLI', (v) => val.hesaptutmasekli = v as String?);
        $checkedConvert(
            'PLASIYER_KODU', (v) => val.plasiyerKodu = v as String?);
        $checkedConvert(
            'PLASIYER_ACIKLAMA', (v) => val.plasiyerAciklama = v as String?);
        $checkedConvert(
            'BORC_TOPLAMI', (v) => val.borcToplami = (v as num?)?.toDouble());
        $checkedConvert('ALACAK_TOPLAMI',
            (v) => val.alacakToplami = (v as num?)?.toDouble());
        $checkedConvert('GENISK1_ORANI', (v) => val.genisk1Orani = v as int?);
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
        $checkedConvert(
            'KAYITYAPANKUL', (v) => val.kayityapankul = v as String?);
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
        $checkedConvert('RISK_TAKIBI', (v) => val.riskTakibi = v as String?);
        $checkedConvert(
            'EFATURA_CARISI', (v) => val.efaturaCarisi = v as String?);
        $checkedConvert('BAKIYE', (v) => val.bakiye = (v as num?)?.toDouble());
        $checkedConvert('ENLEM', (v) => val.enlem = (v as num?)?.toDouble());
        $checkedConvert('BOYLAM', (v) => val.boylam = (v as num?)?.toDouble());
        $checkedConvert('KULL1_S', (v) => val.kull1S = v as String?);
        $checkedConvert('KULL2_S', (v) => val.kull2S = v as String?);
        $checkedConvert('KULL3_S', (v) => val.kull3S = v as String?);
        $checkedConvert('KULL4_S', (v) => val.kull4S = v as String?);
        $checkedConvert('KULL5_S', (v) => val.kull5S = v as String?);
        $checkedConvert('KULL6_S', (v) => val.kull6S = v as String?);
        $checkedConvert('KULL7_S', (v) => val.kull7S = v as String?);
        $checkedConvert('KULL8_S', (v) => val.kull8S = v as String?);
        $checkedConvert('KULL1_N', (v) => val.kull1N = v as int?);
        $checkedConvert('KULL2_N', (v) => val.kull2N = v as int?);
        $checkedConvert('KULL3_N', (v) => val.kull3N = v as int?);
        $checkedConvert('KULL4_N', (v) => val.kull4N = v as int?);
        $checkedConvert('KULL5_N', (v) => val.kull5N = v as int?);
        $checkedConvert('KULL6_N', (v) => val.kull6N = v as int?);
        $checkedConvert('KULL7_N', (v) => val.kull7N = v as int?);
        $checkedConvert('KULL8_N', (v) => val.kull8N = v as int?);
        $checkedConvert('FAX', (v) => val.fax = v as String?);
        $checkedConvert(
            'SAHIS_FIRMASI_MI', (v) => val.sahisFirmasiMi = v as bool?);
        $checkedConvert('DOVIZLI', (v) => val.dovizli = v as bool?);
        $checkedConvert('DOVIZ_KODU', (v) => val.dovizKodu = v as int?);
        $checkedConvert('DOVIZ_ADI', (v) => val.dovizAdi = v as String?);
        $checkedConvert('SUBE_KODU', (v) => val.subeKodu = v as int?);
        $checkedConvert('KOSUL_KODU', (v) => val.kosulKodu = v as String?);
        $checkedConvert('FIYAT_GRUBU', (v) => val.fiyatGrubu = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'cariKodu': 'CARI_KODU',
        'cariAdi': 'CARI_ADI',
        'bagliCari': 'BAGLI_CARI',
        'bagliCariAdi': 'BAGLI_CARI_ADI',
        'cariTip': 'CARI_TIP',
        'cariTipAciklama': 'CARI_TIP_ACIKLAMA',
        'kilit': 'KILIT',
        'vadeGunu': 'VADE_GUNU',
        'odemeTipi': 'ODEME_TIPI',
        'hesaptutmasekli': 'HESAPTUTMASEKLI',
        'plasiyerKodu': 'PLASIYER_KODU',
        'plasiyerAciklama': 'PLASIYER_ACIKLAMA',
        'borcToplami': 'BORC_TOPLAMI',
        'alacakToplami': 'ALACAK_TOPLAMI',
        'genisk1Orani': 'GENISK1_ORANI',
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
        'kayityapankul': 'KAYITYAPANKUL',
        'kayittarihi': 'KAYITTARIHI',
        'duzeltmeyapankul': 'DUZELTMEYAPANKUL',
        'duzeltmetarihi': 'DUZELTMETARIHI',
        'efaturaMi': 'EFATURA_MI',
        'efaturaTipi': 'EFATURA_TIPI',
        'efatGecisTarihi': 'EFAT_GECIS_TARIHI',
        'efatAktif': 'EFAT_AKTIF',
        'riskTakibi': 'RISK_TAKIBI',
        'efaturaCarisi': 'EFATURA_CARISI',
        'bakiye': 'BAKIYE',
        'enlem': 'ENLEM',
        'boylam': 'BOYLAM',
        'kull1S': 'KULL1_S',
        'kull2S': 'KULL2_S',
        'kull3S': 'KULL3_S',
        'kull4S': 'KULL4_S',
        'kull5S': 'KULL5_S',
        'kull6S': 'KULL6_S',
        'kull7S': 'KULL7_S',
        'kull8S': 'KULL8_S',
        'kull1N': 'KULL1_N',
        'kull2N': 'KULL2_N',
        'kull3N': 'KULL3_N',
        'kull4N': 'KULL4_N',
        'kull5N': 'KULL5_N',
        'kull6N': 'KULL6_N',
        'kull7N': 'KULL7_N',
        'kull8N': 'KULL8_N',
        'fax': 'FAX',
        'sahisFirmasiMi': 'SAHIS_FIRMASI_MI',
        'dovizli': 'DOVIZLI',
        'dovizKodu': 'DOVIZ_KODU',
        'dovizAdi': 'DOVIZ_ADI',
        'subeKodu': 'SUBE_KODU',
        'kosulKodu': 'KOSUL_KODU',
        'fiyatGrubu': 'FIYAT_GRUBU'
      },
    );

Map<String, dynamic> _$CariListesiModelToJson(CariListesiModel instance) =>
    <String, dynamic>{
      'CARI_KODU': instance.cariKodu,
      'CARI_ADI': instance.cariAdi,
      'BAGLI_CARI': instance.bagliCari,
      'BAGLI_CARI_ADI': instance.bagliCariAdi,
      'CARI_TIP': instance.cariTip,
      'CARI_TIP_ACIKLAMA': instance.cariTipAciklama,
      'KILIT': instance.kilit,
      'VADE_GUNU': instance.vadeGunu,
      'ODEME_TIPI': instance.odemeTipi,
      'HESAPTUTMASEKLI': instance.hesaptutmasekli,
      'PLASIYER_KODU': instance.plasiyerKodu,
      'PLASIYER_ACIKLAMA': instance.plasiyerAciklama,
      'BORC_TOPLAMI': instance.borcToplami,
      'ALACAK_TOPLAMI': instance.alacakToplami,
      'GENISK1_ORANI': instance.genisk1Orani,
      'ULKE_KODU': instance.ulkeKodu,
      'ULKE_ADI': instance.ulkeAdi,
      'CARI_IL': instance.cariIl,
      'CARI_ILCE': instance.cariIlce,
      'CARI_TEL': instance.cariTel,
      'POSTAKODU': instance.postakodu,
      'EMAIL': instance.email,
      'WEB': instance.web,
      'CARI_ADRES': instance.cariAdres,
      'VERGI_DAIRESI': instance.vergiDairesi,
      'VERGI_NUMARASI': instance.vergiNumarasi,
      'GRUP_KODU': instance.grupKodu,
      'GRUP_TANIMI': instance.grupTanimi,
      'KOD1': instance.kod1,
      'KOD1_TANIMI': instance.kod1Tanimi,
      'KOD2': instance.kod2,
      'KOD2_TANIMI': instance.kod2Tanimi,
      'KOD3': instance.kod3,
      'KOD3_TANIMI': instance.kod3Tanimi,
      'KAYITYAPANKUL': instance.kayityapankul,
      'KAYITTARIHI': instance.kayittarihi,
      'DUZELTMEYAPANKUL': instance.duzeltmeyapankul,
      'DUZELTMETARIHI': instance.duzeltmetarihi,
      'EFATURA_MI': instance.efaturaMi,
      'EFATURA_TIPI': instance.efaturaTipi,
      'EFAT_GECIS_TARIHI': instance.efatGecisTarihi,
      'EFAT_AKTIF': instance.efatAktif,
      'RISK_TAKIBI': instance.riskTakibi,
      'EFATURA_CARISI': instance.efaturaCarisi,
      'BAKIYE': instance.bakiye,
      'ENLEM': instance.enlem,
      'BOYLAM': instance.boylam,
      'KULL1_S': instance.kull1S,
      'KULL2_S': instance.kull2S,
      'KULL3_S': instance.kull3S,
      'KULL4_S': instance.kull4S,
      'KULL5_S': instance.kull5S,
      'KULL6_S': instance.kull6S,
      'KULL7_S': instance.kull7S,
      'KULL8_S': instance.kull8S,
      'KULL1_N': instance.kull1N,
      'KULL2_N': instance.kull2N,
      'KULL3_N': instance.kull3N,
      'KULL4_N': instance.kull4N,
      'KULL5_N': instance.kull5N,
      'KULL6_N': instance.kull6N,
      'KULL7_N': instance.kull7N,
      'KULL8_N': instance.kull8N,
      'FAX': instance.fax,
      'SAHIS_FIRMASI_MI': instance.sahisFirmasiMi,
      'DOVIZLI': instance.dovizli,
      'DOVIZ_KODU': instance.dovizKodu,
      'DOVIZ_ADI': instance.dovizAdi,
      'SUBE_KODU': instance.subeKodu,
      'KOSUL_KODU': instance.kosulKodu,
      'FIYAT_GRUBU': instance.fiyatGrubu,
    };

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
        $checkedConvert('BILGI', (v) => val.bilgi = v as String?);
        $checkedConvert('ACIKLAMA1', (v) => val.aciklama1 = v as String?);
        $checkedConvert('ACIKLAMA2', (v) => val.aciklama2 = v as String?);
        $checkedConvert('ACIKLAMA3', (v) => val.aciklama3 = v as String?);
        $checkedConvert('KODU', (v) => val.kodu = v as String?);
        $checkedConvert('KOD1', (v) => val.kod1 = v as String?);
        $checkedConvert('KOD1_TANIMI', (v) => val.kod1Tanimi = v as String?);
        $checkedConvert('KOD2', (v) => val.kod2 = v as String?);
        $checkedConvert('KOD2_TANIMI', (v) => val.kod2Tanimi = v as String?);
        $checkedConvert('KOD3', (v) => val.kod3 = v as String?);
        $checkedConvert('KOD3_TANIMI', (v) => val.kod3Tanimi = v as String?);
        $checkedConvert('KOD4', (v) => val.kod4 = v as String?);
        $checkedConvert('KOD4_TANIMI', (v) => val.kod4Tanimi = v as String?);
        $checkedConvert('KOD5', (v) => val.kod5 = v as String?);
        $checkedConvert('KOD5_TANIMI', (v) => val.kod5Tanimi = v as String?);
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
        $checkedConvert('KULL1S', (v) => val.kull1s = v as String?);
        $checkedConvert('KULL2S', (v) => val.kull2s = v as String?);
        $checkedConvert('KULL3S', (v) => val.kull3s = v as String?);
        $checkedConvert('KULL4S', (v) => val.kull4s = v as String?);
        $checkedConvert('KULL5S', (v) => val.kull5s = v as String?);
        $checkedConvert('KULL6S', (v) => val.kull6s = v as String?);
        $checkedConvert('KULL7S', (v) => val.kull7s = v as String?);
        $checkedConvert('KULL8S', (v) => val.kull8s = v as String?);
        $checkedConvert('KULL1N', (v) => val.kull1n = (v as num?)?.toDouble());
        $checkedConvert('KULL2N', (v) => val.kull2n = (v as num?)?.toDouble());
        $checkedConvert('KULL3N', (v) => val.kull3n = (v as num?)?.toDouble());
        $checkedConvert('KULL4N', (v) => val.kull4n = (v as num?)?.toDouble());
        $checkedConvert('KULL5N', (v) => val.kull5n = (v as num?)?.toDouble());
        $checkedConvert('KULL6N', (v) => val.kull6n = (v as num?)?.toDouble());
        $checkedConvert('KULL7N', (v) => val.kull7n = (v as num?)?.toDouble());
        $checkedConvert('KULL8N', (v) => val.kull8n = (v as num?)?.toDouble());
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
        'bilgi': 'BILGI',
        'aciklama1': 'ACIKLAMA1',
        'aciklama2': 'ACIKLAMA2',
        'aciklama3': 'ACIKLAMA3',
        'kodu': 'KODU',
        'kod1': 'KOD1',
        'kod1Tanimi': 'KOD1_TANIMI',
        'kod2': 'KOD2',
        'kod2Tanimi': 'KOD2_TANIMI',
        'kod3': 'KOD3',
        'kod3Tanimi': 'KOD3_TANIMI',
        'kod4': 'KOD4',
        'kod4Tanimi': 'KOD4_TANIMI',
        'kod5': 'KOD5',
        'kod5Tanimi': 'KOD5_TANIMI',
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
        'kull1s': 'KULL1S',
        'kull2s': 'KULL2S',
        'kull3s': 'KULL3S',
        'kull4s': 'KULL4S',
        'kull5s': 'KULL5S',
        'kull6s': 'KULL6S',
        'kull7s': 'KULL7S',
        'kull8s': 'KULL8S',
        'kull1n': 'KULL1N',
        'kull2n': 'KULL2N',
        'kull3n': 'KULL3N',
        'kull4n': 'KULL4N',
        'kull5n': 'KULL5N',
        'kull6n': 'KULL6N',
        'kull7n': 'KULL7N',
        'kull8n': 'KULL8N',
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
      'BILGI': instance.bilgi,
      'ACIKLAMA1': instance.aciklama1,
      'ACIKLAMA2': instance.aciklama2,
      'ACIKLAMA3': instance.aciklama3,
      'KODU': instance.kodu,
      'KOD1': instance.kod1,
      'KOD1_TANIMI': instance.kod1Tanimi,
      'KOD2': instance.kod2,
      'KOD2_TANIMI': instance.kod2Tanimi,
      'KOD3': instance.kod3,
      'KOD3_TANIMI': instance.kod3Tanimi,
      'KOD4': instance.kod4,
      'KOD4_TANIMI': instance.kod4Tanimi,
      'KOD5': instance.kod5,
      'KOD5_TANIMI': instance.kod5Tanimi,
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
      'KULL1S': instance.kull1s,
      'KULL2S': instance.kull2s,
      'KULL3S': instance.kull3s,
      'KULL4S': instance.kull4s,
      'KULL5S': instance.kull5s,
      'KULL6S': instance.kull6s,
      'KULL7S': instance.kull7s,
      'KULL8S': instance.kull8s,
      'KULL1N': instance.kull1n,
      'KULL2N': instance.kull2n,
      'KULL3N': instance.kull3n,
      'KULL4N': instance.kull4n,
      'KULL5N': instance.kull5n,
      'KULL6N': instance.kull6n,
      'KULL7N': instance.kull7n,
      'KULL8N': instance.kull8n,
      'FAX': instance.fax,
      'SAHIS_FIRMASI_MI': instance.sahisFirmasiMi,
      'DOVIZLI': instance.dovizli,
      'DOVIZ_KODU': instance.dovizKodu,
      'DOVIZ_ADI': instance.dovizAdi,
      'SUBE_KODU': instance.subeKodu,
      'KOSUL_KODU': instance.kosulKodu,
      'FIYAT_GRUBU': instance.fiyatGrubu,
    };

BakiyeModel _$BakiyeModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'BakiyeModel',
      json,
      ($checkedConvert) {
        final val = BakiyeModel();
        $checkedConvert('CARI_KODU', (v) => val.cariKodu = v as String?);
        $checkedConvert('DOVIZ_TIPI', (v) => val.dovizTipi = v as int?);
        $checkedConvert(
            'BORC_TOPLAMI', (v) => val.borcToplami = (v as num?)?.toDouble());
        $checkedConvert('ALACAK_TOPLAMI', (v) => val.alacakToplami = v as int?);
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

Map<String, dynamic> _$BakiyeModelToJson(BakiyeModel instance) =>
    <String, dynamic>{
      'CARI_KODU': instance.cariKodu,
      'DOVIZ_TIPI': instance.dovizTipi,
      'BORC_TOPLAMI': instance.borcToplami,
      'ALACAK_TOPLAMI': instance.alacakToplami,
      'BAKIYE': instance.bakiye,
      'DOVIZ_ADI': instance.dovizAdi,
    };

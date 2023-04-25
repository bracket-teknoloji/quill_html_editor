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
        $checkedConvert('CARI_TIP', (v) => val.cariTip = v as String?);
        $checkedConvert(
            'CARI_TIP_ACIKLAMA', (v) => val.cariTipAciklama = v as String?);
        $checkedConvert('KILIT', (v) => val.kilit = v as String?);
        $checkedConvert('ODEME_TIPI', (v) => val.odemeTipi = v as String?);
        $checkedConvert(
            'HESAPTUTMASEKLI', (v) => val.hesaptutmasekli = v as String?);
        $checkedConvert('SUBE_KODU', (v) => val.subeKodu = v as int?);
        $checkedConvert(
            'PLASIYER_KODU', (v) => val.plasiyerKodu = v as String?);
        $checkedConvert('MUH_KODU', (v) => val.muhKodu = v as String?);
        $checkedConvert('ULKE_KODU', (v) => val.ulkeKodu = v as String?);
        $checkedConvert('ULKE_ADI', (v) => val.ulkeAdi = v as String?);
        $checkedConvert('CARI_IL', (v) => val.cariIl = v as String?);
        $checkedConvert('CARI_ILCE', (v) => val.cariIlce = v as String?);
        $checkedConvert(
            'VERGI_NUMARASI', (v) => val.vergiNumarasi = v as String?);
        $checkedConvert(
            'KAYITYAPANKUL', (v) => val.kayityapankul = v as String?);
        $checkedConvert('KAYITTARIHI', (v) => val.kayittarihi = v as String?);
        $checkedConvert(
            'DUZELTMETARIHI', (v) => val.duzeltmetarihi = v as String?);
        $checkedConvert('RISK_TAKIBI', (v) => val.riskTakibi = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'cariKodu': 'CARI_KODU',
        'cariAdi': 'CARI_ADI',
        'cariTip': 'CARI_TIP',
        'cariTipAciklama': 'CARI_TIP_ACIKLAMA',
        'kilit': 'KILIT',
        'odemeTipi': 'ODEME_TIPI',
        'hesaptutmasekli': 'HESAPTUTMASEKLI',
        'subeKodu': 'SUBE_KODU',
        'plasiyerKodu': 'PLASIYER_KODU',
        'muhKodu': 'MUH_KODU',
        'ulkeKodu': 'ULKE_KODU',
        'ulkeAdi': 'ULKE_ADI',
        'cariIl': 'CARI_IL',
        'cariIlce': 'CARI_ILCE',
        'vergiNumarasi': 'VERGI_NUMARASI',
        'kayityapankul': 'KAYITYAPANKUL',
        'kayittarihi': 'KAYITTARIHI',
        'duzeltmetarihi': 'DUZELTMETARIHI',
        'riskTakibi': 'RISK_TAKIBI'
      },
    );

Map<String, dynamic> _$CariListesiModelToJson(CariListesiModel instance) =>
    <String, dynamic>{
      'CARI_KODU': instance.cariKodu,
      'CARI_ADI': instance.cariAdi,
      'CARI_TIP': instance.cariTip,
      'CARI_TIP_ACIKLAMA': instance.cariTipAciklama,
      'KILIT': instance.kilit,
      'ODEME_TIPI': instance.odemeTipi,
      'HESAPTUTMASEKLI': instance.hesaptutmasekli,
      'SUBE_KODU': instance.subeKodu,
      'PLASIYER_KODU': instance.plasiyerKodu,
      'MUH_KODU': instance.muhKodu,
      'ULKE_KODU': instance.ulkeKodu,
      'ULKE_ADI': instance.ulkeAdi,
      'CARI_IL': instance.cariIl,
      'CARI_ILCE': instance.cariIlce,
      'VERGI_NUMARASI': instance.vergiNumarasi,
      'KAYITYAPANKUL': instance.kayityapankul,
      'KAYITTARIHI': instance.kayittarihi,
      'DUZELTMETARIHI': instance.duzeltmetarihi,
      'RISK_TAKIBI': instance.riskTakibi,
    };

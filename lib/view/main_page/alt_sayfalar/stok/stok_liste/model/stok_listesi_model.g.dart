// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'stok_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokListesiModel _$StokListesiModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'StokListesiModel',
      json,
      ($checkedConvert) {
        final val = StokListesiModel();
        $checkedConvert('STOK_KODU', (v) => val.stokKodu = v as String?);
        $checkedConvert('STOK_ADI', (v) => val.stokAdi = v as String?);
        $checkedConvert('DEPO_KODU', (v) => val.depoKodu = v as int?);
        $checkedConvert('BAKIYE', (v) => val.bakiye = (v as num?)?.toDouble());
        $checkedConvert('SUBE_KODU', (v) => val.subeKodu = v as int?);
        $checkedConvert('MUHDETAY_ADI', (v) => val.muhdetayAdi = v as String?);
        $checkedConvert('RESIM_URL', (v) => val.resimUrl = v as String?);
        $checkedConvert(
            'RESIM_URL_KUCUK', (v) => val.resimUrlKucuk = v as String?);
        $checkedConvert(
            'ALIS_FIAT1', (v) => val.alisFiat1 = (v as num?)?.toDouble());
        $checkedConvert(
            'ALIS_KDV', (v) => val.alisKdv = (v as num?)?.toDouble());
        $checkedConvert(
            'SATIS_FIAT1', (v) => val.satisFiat1 = (v as num?)?.toDouble());
        $checkedConvert(
            'SATIS_KDV', (v) => val.satisKdv = (v as num?)?.toDouble());
        $checkedConvert('OLCU_BIRIMI', (v) => val.olcuBirimi = v as String?);
        $checkedConvert('OLCU_BIRIMI2', (v) => val.olcuBirimi2 = v as String?);
        $checkedConvert('OLCU_BIRIMI2_PAY',
            (v) => val.olcuBirimi2Pay = (v as num?)?.toDouble());
        $checkedConvert('OLCU_BIRIMI2_PAYDA',
            (v) => val.olcuBirimi2Payda = (v as num?)?.toDouble());
        $checkedConvert('OLCU_BIRIMI3', (v) => val.olcuBirimi3 = v as String?);
        $checkedConvert('OLCU_BIRIMI3_PAY',
            (v) => val.olcuBirimi3Pay = (v as num?)?.toDouble());
        $checkedConvert('OLCU_BIRIMI3_PAYDA',
            (v) => val.olcuBirimi3Payda = (v as num?)?.toDouble());
        $checkedConvert(
            'KAYITYAPANKUL', (v) => val.kayityapankul = v as String?);
        $checkedConvert('KAYITTARIHI', (v) => val.kayittarihi = v as String?);
        $checkedConvert('GRUP_KODU', (v) => val.grupKodu = v as String?);
        $checkedConvert('GRUP_TANIMI', (v) => val.grupTanimi = v as String?);
        $checkedConvert(
            'DUZELTMETARIHI', (v) => val.duzeltmetarihi = v as String?);
        $checkedConvert(
            'DUZELTMEYAPANKUL', (v) => val.duzeltmeyapankul = v as String?);
        $checkedConvert(
            'STOK_FIYAT_LIST', (v) => val.stokFiyatList = v as List<dynamic>?);
        $checkedConvert('STOK_LIST', (v) => val.stokList = v as List<dynamic>?);
        $checkedConvert('FIAT_BIRIMI', (v) => val.fiatBirimi = v as int?);
        $checkedConvert('KILIT_GENEL', (v) => val.kilitGenel = v as String?);
        $checkedConvert(
            'KILIT_SATICISIP', (v) => val.kilitSaticisip = v as String?);
        $checkedConvert('KILIT_MUSSIP', (v) => val.kilitMussip = v as String?);
        $checkedConvert('KILIT_ALIS', (v) => val.kilitAlis = v as String?);
        $checkedConvert('KILIT_SATIS', (v) => val.kilitSatis = v as String?);
        $checkedConvert(
            'BIRIM_AGIRLIK', (v) => val.birimAgirlik = (v as num?)?.toDouble());
        $checkedConvert('KOD1', (v) => val.kod1 = v as String?);
        $checkedConvert('KOD1_TANIMI', (v) => val.kod1Tanimi = v as String?);
        $checkedConvert('BARKOD1', (v) => val.barkod1 = v as String?);
        $checkedConvert('SAT_DOV_TIP', (v) => val.satDovTip = v as int?);
        $checkedConvert('DOV_SATIS_FIAT',
            (v) => val.dovSatisFiat = (v as num?)?.toDouble());
        $checkedConvert(
            'SATIS_DOVIZ_ADI', (v) => val.satisDovizAdi = v as String?);
        $checkedConvert('BARKOD2', (v) => val.barkod2 = v as String?);
        $checkedConvert('BARKOD3', (v) => val.barkod3 = v as String?);
        $checkedConvert('KOD2', (v) => val.kod2 = v as String?);
        $checkedConvert('KOD3', (v) => val.kod3 = v as String?);
        $checkedConvert('KOD4', (v) => val.kod4 = v as String?);
        $checkedConvert('SERI_CIKISTA_OTOMATIK_MI',
            (v) => val.seriCikistaOtomatikMi = v as bool?);
        $checkedConvert('SERI_GIRISTE_OTOMATIK_MI',
            (v) => val.seriGiristeOtomatikMi = v as bool?);
        $checkedConvert('ALIS_DOV_TIP', (v) => val.alisDovTip = v as int?);
        $checkedConvert(
            'ALIS_DOVIZ_ADI', (v) => val.alisDovizAdi = v as String?);
        $checkedConvert('URETICI_KODU', (v) => val.ureticiKodu = v as String?);
        $checkedConvert(
            'SATIS_FIAT2', (v) => val.satisFiat2 = (v as num?)?.toDouble());
        $checkedConvert(
            'SATIS_FIAT3', (v) => val.satisFiat3 = (v as num?)?.toDouble());
        $checkedConvert(
            'SATIS_FIAT4', (v) => val.satisFiat4 = (v as num?)?.toDouble());
        $checkedConvert('KOD5', (v) => val.kod5 = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'stokKodu': 'STOK_KODU',
        'stokAdi': 'STOK_ADI',
        'depoKodu': 'DEPO_KODU',
        'bakiye': 'BAKIYE',
        'subeKodu': 'SUBE_KODU',
        'muhdetayAdi': 'MUHDETAY_ADI',
        'resimUrl': 'RESIM_URL',
        'resimUrlKucuk': 'RESIM_URL_KUCUK',
        'alisFiat1': 'ALIS_FIAT1',
        'alisKdv': 'ALIS_KDV',
        'satisFiat1': 'SATIS_FIAT1',
        'satisKdv': 'SATIS_KDV',
        'olcuBirimi': 'OLCU_BIRIMI',
        'olcuBirimi2': 'OLCU_BIRIMI2',
        'olcuBirimi2Pay': 'OLCU_BIRIMI2_PAY',
        'olcuBirimi2Payda': 'OLCU_BIRIMI2_PAYDA',
        'olcuBirimi3': 'OLCU_BIRIMI3',
        'olcuBirimi3Pay': 'OLCU_BIRIMI3_PAY',
        'olcuBirimi3Payda': 'OLCU_BIRIMI3_PAYDA',
        'kayityapankul': 'KAYITYAPANKUL',
        'kayittarihi': 'KAYITTARIHI',
        'grupKodu': 'GRUP_KODU',
        'grupTanimi': 'GRUP_TANIMI',
        'duzeltmetarihi': 'DUZELTMETARIHI',
        'duzeltmeyapankul': 'DUZELTMEYAPANKUL',
        'stokFiyatList': 'STOK_FIYAT_LIST',
        'stokList': 'STOK_LIST',
        'fiatBirimi': 'FIAT_BIRIMI',
        'kilitGenel': 'KILIT_GENEL',
        'kilitSaticisip': 'KILIT_SATICISIP',
        'kilitMussip': 'KILIT_MUSSIP',
        'kilitAlis': 'KILIT_ALIS',
        'kilitSatis': 'KILIT_SATIS',
        'birimAgirlik': 'BIRIM_AGIRLIK',
        'kod1': 'KOD1',
        'kod1Tanimi': 'KOD1_TANIMI',
        'barkod1': 'BARKOD1',
        'satDovTip': 'SAT_DOV_TIP',
        'dovSatisFiat': 'DOV_SATIS_FIAT',
        'satisDovizAdi': 'SATIS_DOVIZ_ADI',
        'barkod2': 'BARKOD2',
        'barkod3': 'BARKOD3',
        'kod2': 'KOD2',
        'kod3': 'KOD3',
        'kod4': 'KOD4',
        'seriCikistaOtomatikMi': 'SERI_CIKISTA_OTOMATIK_MI',
        'seriGiristeOtomatikMi': 'SERI_GIRISTE_OTOMATIK_MI',
        'alisDovTip': 'ALIS_DOV_TIP',
        'alisDovizAdi': 'ALIS_DOVIZ_ADI',
        'ureticiKodu': 'URETICI_KODU',
        'satisFiat2': 'SATIS_FIAT2',
        'satisFiat3': 'SATIS_FIAT3',
        'satisFiat4': 'SATIS_FIAT4',
        'kod5': 'KOD5'
      },
    );

Map<String, dynamic> _$StokListesiModelToJson(StokListesiModel instance) =>
    <String, dynamic>{
      'STOK_KODU': instance.stokKodu,
      'STOK_ADI': instance.stokAdi,
      'DEPO_KODU': instance.depoKodu,
      'BAKIYE': instance.bakiye,
      'SUBE_KODU': instance.subeKodu,
      'MUHDETAY_ADI': instance.muhdetayAdi,
      'RESIM_URL': instance.resimUrl,
      'RESIM_URL_KUCUK': instance.resimUrlKucuk,
      'ALIS_FIAT1': instance.alisFiat1,
      'ALIS_KDV': instance.alisKdv,
      'SATIS_FIAT1': instance.satisFiat1,
      'SATIS_KDV': instance.satisKdv,
      'OLCU_BIRIMI': instance.olcuBirimi,
      'OLCU_BIRIMI2': instance.olcuBirimi2,
      'OLCU_BIRIMI2_PAY': instance.olcuBirimi2Pay,
      'OLCU_BIRIMI2_PAYDA': instance.olcuBirimi2Payda,
      'OLCU_BIRIMI3': instance.olcuBirimi3,
      'OLCU_BIRIMI3_PAY': instance.olcuBirimi3Pay,
      'OLCU_BIRIMI3_PAYDA': instance.olcuBirimi3Payda,
      'KAYITYAPANKUL': instance.kayityapankul,
      'KAYITTARIHI': instance.kayittarihi,
      'GRUP_KODU': instance.grupKodu,
      'GRUP_TANIMI': instance.grupTanimi,
      'DUZELTMETARIHI': instance.duzeltmetarihi,
      'DUZELTMEYAPANKUL': instance.duzeltmeyapankul,
      'STOK_FIYAT_LIST': instance.stokFiyatList,
      'STOK_LIST': instance.stokList,
      'FIAT_BIRIMI': instance.fiatBirimi,
      'KILIT_GENEL': instance.kilitGenel,
      'KILIT_SATICISIP': instance.kilitSaticisip,
      'KILIT_MUSSIP': instance.kilitMussip,
      'KILIT_ALIS': instance.kilitAlis,
      'KILIT_SATIS': instance.kilitSatis,
      'BIRIM_AGIRLIK': instance.birimAgirlik,
      'KOD1': instance.kod1,
      'KOD1_TANIMI': instance.kod1Tanimi,
      'BARKOD1': instance.barkod1,
      'SAT_DOV_TIP': instance.satDovTip,
      'DOV_SATIS_FIAT': instance.dovSatisFiat,
      'SATIS_DOVIZ_ADI': instance.satisDovizAdi,
      'BARKOD2': instance.barkod2,
      'BARKOD3': instance.barkod3,
      'KOD2': instance.kod2,
      'KOD3': instance.kod3,
      'KOD4': instance.kod4,
      'SERI_CIKISTA_OTOMATIK_MI': instance.seriCikistaOtomatikMi,
      'SERI_GIRISTE_OTOMATIK_MI': instance.seriGiristeOtomatikMi,
      'ALIS_DOV_TIP': instance.alisDovTip,
      'ALIS_DOVIZ_ADI': instance.alisDovizAdi,
      'URETICI_KODU': instance.ureticiKodu,
      'SATIS_FIAT2': instance.satisFiat2,
      'SATIS_FIAT3': instance.satisFiat3,
      'SATIS_FIAT4': instance.satisFiat4,
      'KOD5': instance.kod5,
    };

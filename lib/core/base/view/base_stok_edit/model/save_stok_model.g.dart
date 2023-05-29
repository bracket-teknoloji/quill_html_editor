// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'save_stok_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveStokModel _$SaveStokModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SaveStokModel',
      json,
      ($checkedConvert) {
        final val = SaveStokModel();
        $checkedConvert('ADI', (v) => val.adi = v as String?);
        $checkedConvert('ALIS_DOVIZ_FIYATI',
            (v) => val.alisDovizFiyati = (v as num?)?.toDouble());
        $checkedConvert(
            'ALIS_DOVIZ_TIPI', (v) => val.alisDovizTipi = v as int?);
        $checkedConvert(
            'ALIS_FIYATI1', (v) => val.alisFiyati1 = (v as num?)?.toDouble());
        $checkedConvert(
            'ALIS_FIYATI2', (v) => val.alisFiyati2 = (v as num?)?.toDouble());
        $checkedConvert(
            'ALIS_FIYATI3', (v) => val.alisFiyati3 = (v as num?)?.toDouble());
        $checkedConvert(
            'ALIS_FIYATI4', (v) => val.alisFiyati4 = (v as num?)?.toDouble());
        $checkedConvert('ALIS_KDV_ORANI',
            (v) => val.alisKdvOrani = (v as num?)?.toDouble());
        $checkedConvert('BARKOD1', (v) => val.barkod1 = v as String?);
        $checkedConvert('BARKOD2', (v) => val.barkod2 = v as String?);
        $checkedConvert('BARKOD3', (v) => val.barkod3 = v as String?);
        $checkedConvert('DEPO_KODU', (v) => val.depoKodu = v as int?);
        $checkedConvert('GRUP_KODU', (v) => val.grupKodu = v as String?);
        $checkedConvert('ISLEM_KODU', (v) => val.islemKodu = v as int?);
        $checkedConvert('KOD1', (v) => val.kod1 = v as String?);
        $checkedConvert('KOD2', (v) => val.kod2 = v as String?);
        $checkedConvert('KOD3', (v) => val.kod3 = v as String?);
        $checkedConvert('KOD4', (v) => val.kod4 = v as String?);
        $checkedConvert('KOD5', (v) => val.kod5 = v as String?);
        $checkedConvert('KODU', (v) => val.kodu = v as String?);
        $checkedConvert('MUHDETAY_KODU', (v) => val.muhdetayKodu = v as int?);
        $checkedConvert('OLCU_BIRIMI1', (v) => val.olcuBirimi1 = v as String?);
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
            'REQUEST_VERSION', (v) => val.requestVersion = v as int?);
        $checkedConvert('SATIS_DOVIZ_FIYATI',
            (v) => val.satisDovizFiyati = (v as num?)?.toDouble());
        $checkedConvert(
            'SATIS_DOVIZ_TIPI', (v) => val.satisDovizTipi = v as int?);
        $checkedConvert(
            'SATIS_FIYATI1', (v) => val.satisFiyati1 = (v as num?)?.toDouble());
        $checkedConvert(
            'SATIS_FIYATI2', (v) => val.satisFiyati2 = (v as num?)?.toDouble());
        $checkedConvert(
            'SATIS_FIYATI3', (v) => val.satisFiyati3 = (v as num?)?.toDouble());
        $checkedConvert(
            'SATIS_FIYATI4', (v) => val.satisFiyati4 = (v as num?)?.toDouble());
        $checkedConvert('SATIS_KDV_ORANI',
            (v) => val.satisKdvOrani = (v as num?)?.toDouble());
        $checkedConvert('SERI_GIRISTE_OTOMATIK',
            (v) => val.seriGiristeOtomatik = v as bool?);
        $checkedConvert(
            'SERI_CIKISTA_AKTIF', (v) => val.seriCikistaAktif = v as bool?);
        $checkedConvert('SERI_CIKISTA_OTOMATIK',
            (v) => val.seriCikistaOtomatik = v as bool?);
        $checkedConvert(
            'SERI_GIRISTE_AKTIF', (v) => val.seriGiristeAktif = v as bool?);
        $checkedConvert(
            'SERI_MIKTAR_KADAR', (v) => val.seriMiktarKadar = v as bool?);
        $checkedConvert('SUBE_KODU', (v) => val.subeKodu = v as int?);
        $checkedConvert('URETICI_KODU', (v) => val.ureticiKodu = v as String?);
        $checkedConvert('_YeniKayit', (v) => val.yeniKayit = v as bool?);
        return val;
      },
      fieldKeyMap: const {
        'adi': 'ADI',
        'alisDovizFiyati': 'ALIS_DOVIZ_FIYATI',
        'alisDovizTipi': 'ALIS_DOVIZ_TIPI',
        'alisFiyati1': 'ALIS_FIYATI1',
        'alisFiyati2': 'ALIS_FIYATI2',
        'alisFiyati3': 'ALIS_FIYATI3',
        'alisFiyati4': 'ALIS_FIYATI4',
        'alisKdvOrani': 'ALIS_KDV_ORANI',
        'barkod1': 'BARKOD1',
        'barkod2': 'BARKOD2',
        'barkod3': 'BARKOD3',
        'depoKodu': 'DEPO_KODU',
        'grupKodu': 'GRUP_KODU',
        'islemKodu': 'ISLEM_KODU',
        'kod1': 'KOD1',
        'kod2': 'KOD2',
        'kod3': 'KOD3',
        'kod4': 'KOD4',
        'kod5': 'KOD5',
        'kodu': 'KODU',
        'muhdetayKodu': 'MUHDETAY_KODU',
        'olcuBirimi1': 'OLCU_BIRIMI1',
        'olcuBirimi2': 'OLCU_BIRIMI2',
        'olcuBirimi2Pay': 'OLCU_BIRIMI2_PAY',
        'olcuBirimi2Payda': 'OLCU_BIRIMI2_PAYDA',
        'olcuBirimi3': 'OLCU_BIRIMI3',
        'olcuBirimi3Pay': 'OLCU_BIRIMI3_PAY',
        'olcuBirimi3Payda': 'OLCU_BIRIMI3_PAYDA',
        'requestVersion': 'REQUEST_VERSION',
        'satisDovizFiyati': 'SATIS_DOVIZ_FIYATI',
        'satisDovizTipi': 'SATIS_DOVIZ_TIPI',
        'satisFiyati1': 'SATIS_FIYATI1',
        'satisFiyati2': 'SATIS_FIYATI2',
        'satisFiyati3': 'SATIS_FIYATI3',
        'satisFiyati4': 'SATIS_FIYATI4',
        'satisKdvOrani': 'SATIS_KDV_ORANI',
        'seriGiristeOtomatik': 'SERI_GIRISTE_OTOMATIK',
        'seriCikistaAktif': 'SERI_CIKISTA_AKTIF',
        'seriCikistaOtomatik': 'SERI_CIKISTA_OTOMATIK',
        'seriGiristeAktif': 'SERI_GIRISTE_AKTIF',
        'seriMiktarKadar': 'SERI_MIKTAR_KADAR',
        'subeKodu': 'SUBE_KODU',
        'ureticiKodu': 'URETICI_KODU',
        'yeniKayit': '_YeniKayit'
      },
    );

Map<String, dynamic> _$SaveStokModelToJson(SaveStokModel instance) =>
    <String, dynamic>{
      'ADI': instance.adi,
      'ALIS_DOVIZ_FIYATI': instance.alisDovizFiyati,
      'ALIS_DOVIZ_TIPI': instance.alisDovizTipi,
      'ALIS_FIYATI1': instance.alisFiyati1,
      'ALIS_FIYATI2': instance.alisFiyati2,
      'ALIS_FIYATI3': instance.alisFiyati3,
      'ALIS_FIYATI4': instance.alisFiyati4,
      'ALIS_KDV_ORANI': instance.alisKdvOrani,
      'BARKOD1': instance.barkod1,
      'BARKOD2': instance.barkod2,
      'BARKOD3': instance.barkod3,
      'DEPO_KODU': instance.depoKodu,
      'GRUP_KODU': instance.grupKodu,
      'ISLEM_KODU': instance.islemKodu,
      'KOD1': instance.kod1,
      'KOD2': instance.kod2,
      'KOD3': instance.kod3,
      'KOD4': instance.kod4,
      'KOD5': instance.kod5,
      'KODU': instance.kodu,
      'MUHDETAY_KODU': instance.muhdetayKodu,
      'OLCU_BIRIMI1': instance.olcuBirimi1,
      'OLCU_BIRIMI2': instance.olcuBirimi2,
      'OLCU_BIRIMI2_PAY': instance.olcuBirimi2Pay,
      'OLCU_BIRIMI2_PAYDA': instance.olcuBirimi2Payda,
      'OLCU_BIRIMI3': instance.olcuBirimi3,
      'OLCU_BIRIMI3_PAY': instance.olcuBirimi3Pay,
      'OLCU_BIRIMI3_PAYDA': instance.olcuBirimi3Payda,
      'REQUEST_VERSION': instance.requestVersion,
      'SATIS_DOVIZ_FIYATI': instance.satisDovizFiyati,
      'SATIS_DOVIZ_TIPI': instance.satisDovizTipi,
      'SATIS_FIYATI1': instance.satisFiyati1,
      'SATIS_FIYATI2': instance.satisFiyati2,
      'SATIS_FIYATI3': instance.satisFiyati3,
      'SATIS_FIYATI4': instance.satisFiyati4,
      'SATIS_KDV_ORANI': instance.satisKdvOrani,
      'SERI_GIRISTE_OTOMATIK': instance.seriGiristeOtomatik,
      'SERI_CIKISTA_AKTIF': instance.seriCikistaAktif,
      'SERI_CIKISTA_OTOMATIK': instance.seriCikistaOtomatik,
      'SERI_GIRISTE_AKTIF': instance.seriGiristeAktif,
      'SERI_MIKTAR_KADAR': instance.seriMiktarKadar,
      'SUBE_KODU': instance.subeKodu,
      'URETICI_KODU': instance.ureticiKodu,
      '_YeniKayit': instance.yeniKayit,
    };

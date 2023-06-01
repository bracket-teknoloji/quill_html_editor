// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'save_stok_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveStokModel _$SaveStokModelFromJson(Map<String, dynamic> json) =>
    SaveStokModel()
      ..adi = json['ADI'] as String?
      ..alisDovizFiyati = (json['ALIS_DOVIZ_FIYATI'] as num?)?.toDouble()
      ..alisDovizTipi = json['ALIS_DOVIZ_TIPI'] as int?
      ..alisFiyati1 = (json['ALIS_FIYATI1'] as num?)?.toDouble()
      ..alisFiyati2 = (json['ALIS_FIYATI2'] as num?)?.toDouble()
      ..alisFiyati3 = (json['ALIS_FIYATI3'] as num?)?.toDouble()
      ..alisFiyati4 = (json['ALIS_FIYATI4'] as num?)?.toDouble()
      ..alisKdvOrani = (json['ALIS_KDV_ORANI'] as num?)?.toDouble()
      ..barkod1 = json['BARKOD1'] as String?
      ..barkod2 = json['BARKOD2'] as String?
      ..barkod3 = json['BARKOD3'] as String?
      ..depoKodu = json['DEPO_KODU'] as int?
      ..grupKodu = json['GRUP_KODU'] as String?
      ..islemKodu = json['ISLEM_KODU'] as int?
      ..kod1 = json['KOD1'] as String?
      ..kod2 = json['KOD2'] as String?
      ..kod3 = json['KOD3'] as String?
      ..kod4 = json['KOD4'] as String?
      ..kod5 = json['KOD5'] as String?
      ..kodu = json['KODU'] as String?
      ..muhdetayKodu = json['MUHDETAY_KODU'] as int?
      ..olcuBirimi1 = json['OLCU_BIRIMI1'] as String?
      ..olcuBirimi2 = json['OLCU_BIRIMI2'] as String?
      ..olcuBirimi2Pay = (json['OLCU_BIRIMI2_PAY'] as num?)?.toDouble()
      ..olcuBirimi2Payda = (json['OLCU_BIRIMI2_PAYDA'] as num?)?.toDouble()
      ..olcuBirimi3 = json['OLCU_BIRIMI3'] as String?
      ..olcuBirimi3Pay = (json['OLCU_BIRIMI3_PAY'] as num?)?.toDouble()
      ..olcuBirimi3Payda = (json['OLCU_BIRIMI3_PAYDA'] as num?)?.toDouble()
      ..requestVersion = json['REQUEST_VERSION'] as int?
      ..satisDovizFiyati = (json['SATIS_DOVIZ_FIYATI'] as num?)?.toDouble()
      ..satisDovizTipi = json['SATIS_DOVIZ_TIPI'] as int?
      ..satisFiyati1 = (json['SATIS_FIYATI1'] as num?)?.toDouble()
      ..satisFiyati2 = (json['SATIS_FIYATI2'] as num?)?.toDouble()
      ..satisFiyati3 = (json['SATIS_FIYATI3'] as num?)?.toDouble()
      ..satisFiyati4 = (json['SATIS_FIYATI4'] as num?)?.toDouble()
      ..satisKdvOrani = (json['SATIS_KDV_ORANI'] as num?)?.toDouble()
      ..seriGiristeOtomatik = json['SERI_GIRISTE_OTOMATIK'] as bool?
      ..seriCikistaAktif = json['SERI_CIKISTA_AKTIF'] as bool?
      ..seriCikistaOtomatik = json['SERI_CIKISTA_OTOMATIK'] as bool?
      ..seriGiristeAktif = json['SERI_GIRISTE_AKTIF'] as bool?
      ..seriMiktarKadar = json['SERI_MIKTAR_KADAR'] as bool?
      ..subeKodu = json['SUBE_KODU'] as int?
      ..ureticiKodu = json['URETICI_KODU'] as String?
      ..yeniKayit = json['_YeniKayit'] as bool?;

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

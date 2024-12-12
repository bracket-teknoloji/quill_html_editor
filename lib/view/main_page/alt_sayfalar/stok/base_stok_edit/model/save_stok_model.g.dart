// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_stok_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveStokModel _$SaveStokModelFromJson(Map<String, dynamic> json) =>
    SaveStokModel()
      ..adi = json['ADI'] as String?
      ..alisDovizFiyati = (json['ALIS_DOVIZ_FIYATI'] as num?)?.toDouble()
      ..alisDovizTipi = (json['ALIS_DOVIZ_TIPI'] as num?)?.toInt()
      ..alisFiyati1 = (json['ALIS_FIYATI1'] as num?)?.toDouble()
      ..alisFiyati2 = (json['ALIS_FIYATI2'] as num?)?.toDouble()
      ..alisFiyati3 = (json['ALIS_FIYATI3'] as num?)?.toDouble()
      ..alisFiyati4 = (json['ALIS_FIYATI4'] as num?)?.toDouble()
      ..alisKdvOrani = (json['ALIS_KDV_ORANI'] as num?)?.toDouble()
      ..barkod1 = json['BARKOD1'] as String?
      ..barkod2 = json['BARKOD2'] as String?
      ..barkod3 = json['BARKOD3'] as String?
      ..depoKodu = (json['DEPO_KODU'] as num?)?.toInt()
      ..grupKodu = json['GRUP_KODU'] as String?
      ..islemKodu = (json['ISLEM_KODU'] as num?)?.toInt()
      ..kod1 = json['KOD1'] as String?
      ..kod2 = json['KOD2'] as String?
      ..kod3 = json['KOD3'] as String?
      ..kod4 = json['KOD4'] as String?
      ..kod5 = json['KOD5'] as String?
      ..kodu = json['KODU'] as String?
      ..muhdetayKodu = (json['MUHDETAY_KODU'] as num?)?.toInt()
      ..olcuBirimi1 = json['OLCU_BIRIMI1'] as String?
      ..olcuBirimi2 = json['OLCU_BIRIMI2'] as String?
      ..olcuBirimi2Pay = (json['OLCU_BIRIMI2_PAY'] as num?)?.toDouble()
      ..olcuBirimi2Payda = (json['OLCU_BIRIMI2_PAYDA'] as num?)?.toDouble()
      ..olcuBirimi3 = json['OLCU_BIRIMI3'] as String?
      ..olcuBirimi3Pay = (json['OLCU_BIRIMI3_PAY'] as num?)?.toDouble()
      ..olcuBirimi3Payda = (json['OLCU_BIRIMI3_PAYDA'] as num?)?.toDouble()
      ..requestVersion = (json['REQUEST_VERSION'] as num?)?.toInt()
      ..satisDovizFiyati = (json['SATIS_DOVIZ_FIYATI'] as num?)?.toDouble()
      ..satisDovizTipi = (json['SATIS_DOVIZ_TIPI'] as num?)?.toInt()
      ..satisFiyati1 = (json['SATIS_FIYATI1'] as num?)?.toDouble()
      ..satisFiyati2 = (json['SATIS_FIYATI2'] as num?)?.toDouble()
      ..satisFiyati3 = (json['SATIS_FIYATI3'] as num?)?.toDouble()
      ..satisFiyati4 = (json['SATIS_FIYATI4'] as num?)?.toDouble()
      ..satisKdvOrani = (json['SATIS_KDV_ORANI'] as num?)?.toDouble()
      ..resimBase64 = json['RESIM_BASE64'] as String?
      ..seriGiristeOtomatik = json['SERI_GIRISTE_OTOMATIK'] as bool?
      ..seriCikistaAktif = json['SERI_CIKISTA_AKTIF'] as bool?
      ..seriCikistaOtomatik = json['SERI_CIKISTA_OTOMATIK'] as bool?
      ..seriGiristeAktif = json['SERI_GIRISTE_AKTIF'] as bool?
      ..seriMiktarKadar = json['SERI_MIKTAR_KADAR'] as bool?
      ..subeKodu = (json['SUBE_KODU'] as num?)?.toInt()
      ..ureticiKodu = json['URETICI_KODU'] as String?
      ..barkodTanimlamaIslemi = json['BARKOD_TANIMLAMA_ISLEMI'] as bool?
      ..yeniKayit = json['_YeniKayit'] as bool?
      ..stokBarkodModel = json['StokBarkodModel'] == null
          ? null
          : BarkodTanimlaKayitlariModel.fromJson(
              json['StokBarkodModel'] as Map<String, dynamic>);

Map<String, dynamic> _$SaveStokModelToJson(SaveStokModel instance) =>
    <String, dynamic>{
      if (instance.adi case final value?) 'ADI': value,
      if (instance.alisDovizFiyati case final value?)
        'ALIS_DOVIZ_FIYATI': value,
      if (instance.alisDovizTipi case final value?) 'ALIS_DOVIZ_TIPI': value,
      if (instance.alisFiyati1 case final value?) 'ALIS_FIYATI1': value,
      if (instance.alisFiyati2 case final value?) 'ALIS_FIYATI2': value,
      if (instance.alisFiyati3 case final value?) 'ALIS_FIYATI3': value,
      if (instance.alisFiyati4 case final value?) 'ALIS_FIYATI4': value,
      if (instance.alisKdvOrani case final value?) 'ALIS_KDV_ORANI': value,
      if (instance.barkod1 case final value?) 'BARKOD1': value,
      if (instance.barkod2 case final value?) 'BARKOD2': value,
      if (instance.barkod3 case final value?) 'BARKOD3': value,
      if (instance.depoKodu case final value?) 'DEPO_KODU': value,
      if (instance.grupKodu case final value?) 'GRUP_KODU': value,
      if (instance.islemKodu case final value?) 'ISLEM_KODU': value,
      if (instance.kod1 case final value?) 'KOD1': value,
      if (instance.kod2 case final value?) 'KOD2': value,
      if (instance.kod3 case final value?) 'KOD3': value,
      if (instance.kod4 case final value?) 'KOD4': value,
      if (instance.kod5 case final value?) 'KOD5': value,
      if (instance.kodu case final value?) 'KODU': value,
      if (instance.muhdetayKodu case final value?) 'MUHDETAY_KODU': value,
      if (instance.olcuBirimi1 case final value?) 'OLCU_BIRIMI1': value,
      if (instance.olcuBirimi2 case final value?) 'OLCU_BIRIMI2': value,
      if (instance.olcuBirimi2Pay case final value?) 'OLCU_BIRIMI2_PAY': value,
      if (instance.olcuBirimi2Payda case final value?)
        'OLCU_BIRIMI2_PAYDA': value,
      if (instance.olcuBirimi3 case final value?) 'OLCU_BIRIMI3': value,
      if (instance.olcuBirimi3Pay case final value?) 'OLCU_BIRIMI3_PAY': value,
      if (instance.olcuBirimi3Payda case final value?)
        'OLCU_BIRIMI3_PAYDA': value,
      if (instance.requestVersion case final value?) 'REQUEST_VERSION': value,
      if (instance.satisDovizFiyati case final value?)
        'SATIS_DOVIZ_FIYATI': value,
      if (instance.satisDovizTipi case final value?) 'SATIS_DOVIZ_TIPI': value,
      if (instance.satisFiyati1 case final value?) 'SATIS_FIYATI1': value,
      if (instance.satisFiyati2 case final value?) 'SATIS_FIYATI2': value,
      if (instance.satisFiyati3 case final value?) 'SATIS_FIYATI3': value,
      if (instance.satisFiyati4 case final value?) 'SATIS_FIYATI4': value,
      if (instance.satisKdvOrani case final value?) 'SATIS_KDV_ORANI': value,
      if (instance.resimBase64 case final value?) 'RESIM_BASE64': value,
      if (instance.seriGiristeOtomatik case final value?)
        'SERI_GIRISTE_OTOMATIK': value,
      if (instance.seriCikistaAktif case final value?)
        'SERI_CIKISTA_AKTIF': value,
      if (instance.seriCikistaOtomatik case final value?)
        'SERI_CIKISTA_OTOMATIK': value,
      if (instance.seriGiristeAktif case final value?)
        'SERI_GIRISTE_AKTIF': value,
      if (instance.seriMiktarKadar case final value?)
        'SERI_MIKTAR_KADAR': value,
      if (instance.subeKodu case final value?) 'SUBE_KODU': value,
      if (instance.ureticiKodu case final value?) 'URETICI_KODU': value,
      if (instance.barkodTanimlamaIslemi case final value?)
        'BARKOD_TANIMLAMA_ISLEMI': value,
      if (instance.yeniKayit case final value?) '_YeniKayit': value,
      if (instance.stokBarkodModel?.toJson() case final value?)
        'StokBarkodModel': value,
    };

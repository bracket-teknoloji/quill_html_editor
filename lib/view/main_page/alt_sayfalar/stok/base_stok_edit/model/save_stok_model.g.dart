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
      ..yeniKayit = json['_YeniKayit'] as bool?;

Map<String, dynamic> _$SaveStokModelToJson(SaveStokModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ADI', instance.adi);
  writeNotNull('ALIS_DOVIZ_FIYATI', instance.alisDovizFiyati);
  writeNotNull('ALIS_DOVIZ_TIPI', instance.alisDovizTipi);
  writeNotNull('ALIS_FIYATI1', instance.alisFiyati1);
  writeNotNull('ALIS_FIYATI2', instance.alisFiyati2);
  writeNotNull('ALIS_FIYATI3', instance.alisFiyati3);
  writeNotNull('ALIS_FIYATI4', instance.alisFiyati4);
  writeNotNull('ALIS_KDV_ORANI', instance.alisKdvOrani);
  writeNotNull('BARKOD1', instance.barkod1);
  writeNotNull('BARKOD2', instance.barkod2);
  writeNotNull('BARKOD3', instance.barkod3);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('GRUP_KODU', instance.grupKodu);
  writeNotNull('ISLEM_KODU', instance.islemKodu);
  writeNotNull('KOD1', instance.kod1);
  writeNotNull('KOD2', instance.kod2);
  writeNotNull('KOD3', instance.kod3);
  writeNotNull('KOD4', instance.kod4);
  writeNotNull('KOD5', instance.kod5);
  writeNotNull('KODU', instance.kodu);
  writeNotNull('MUHDETAY_KODU', instance.muhdetayKodu);
  writeNotNull('OLCU_BIRIMI1', instance.olcuBirimi1);
  writeNotNull('OLCU_BIRIMI2', instance.olcuBirimi2);
  writeNotNull('OLCU_BIRIMI2_PAY', instance.olcuBirimi2Pay);
  writeNotNull('OLCU_BIRIMI2_PAYDA', instance.olcuBirimi2Payda);
  writeNotNull('OLCU_BIRIMI3', instance.olcuBirimi3);
  writeNotNull('OLCU_BIRIMI3_PAY', instance.olcuBirimi3Pay);
  writeNotNull('OLCU_BIRIMI3_PAYDA', instance.olcuBirimi3Payda);
  writeNotNull('REQUEST_VERSION', instance.requestVersion);
  writeNotNull('SATIS_DOVIZ_FIYATI', instance.satisDovizFiyati);
  writeNotNull('SATIS_DOVIZ_TIPI', instance.satisDovizTipi);
  writeNotNull('SATIS_FIYATI1', instance.satisFiyati1);
  writeNotNull('SATIS_FIYATI2', instance.satisFiyati2);
  writeNotNull('SATIS_FIYATI3', instance.satisFiyati3);
  writeNotNull('SATIS_FIYATI4', instance.satisFiyati4);
  writeNotNull('SATIS_KDV_ORANI', instance.satisKdvOrani);
  writeNotNull('RESIM_BASE64', instance.resimBase64);
  writeNotNull('SERI_GIRISTE_OTOMATIK', instance.seriGiristeOtomatik);
  writeNotNull('SERI_CIKISTA_AKTIF', instance.seriCikistaAktif);
  writeNotNull('SERI_CIKISTA_OTOMATIK', instance.seriCikistaOtomatik);
  writeNotNull('SERI_GIRISTE_AKTIF', instance.seriGiristeAktif);
  writeNotNull('SERI_MIKTAR_KADAR', instance.seriMiktarKadar);
  writeNotNull('SUBE_KODU', instance.subeKodu);
  writeNotNull('URETICI_KODU', instance.ureticiKodu);
  writeNotNull('_YeniKayit', instance.yeniKayit);
  return val;
}

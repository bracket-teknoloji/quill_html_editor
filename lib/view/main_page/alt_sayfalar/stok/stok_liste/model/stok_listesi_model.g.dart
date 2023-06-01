// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokListesiModel _$StokListesiModelFromJson(Map<String, dynamic> json) =>
    StokListesiModel()
      ..stokKodu = json['STOK_KODU'] as String?
      ..stokAdi = json['STOK_ADI'] as String?
      ..depoKodu = json['DEPO_KODU'] as int?
      ..bakiye = (json['BAKIYE'] as num?)?.toDouble()
      ..subeKodu = json['SUBE_KODU'] as int?
      ..muhdetayAdi = json['MUHDETAY_ADI'] as String?
      ..resimUrl = json['RESIM_URL'] as String?
      ..resimUrlKucuk = json['RESIM_URL_KUCUK'] as String?
      ..alisFiat1 = (json['ALIS_FIAT1'] as num?)?.toDouble()
      ..alisKdv = (json['ALIS_KDV'] as num?)?.toDouble()
      ..satisKdv = (json['SATIS_KDV'] as num?)?.toDouble()
      ..olcuBirimi = json['OLCU_BIRIMI'] as String?
      ..olcuBirimi2 = json['OLCU_BIRIMI2'] as String?
      ..olcuBirimi2Pay = (json['OLCU_BIRIMI2_PAY'] as num?)?.toDouble()
      ..olcuBirimi2Payda = (json['OLCU_BIRIMI2_PAYDA'] as num?)?.toDouble()
      ..olcuBirimi3 = json['OLCU_BIRIMI3'] as String?
      ..olcuBirimi3Pay = (json['OLCU_BIRIMI3_PAY'] as num?)?.toDouble()
      ..olcuBirimi3Payda = (json['OLCU_BIRIMI3_PAYDA'] as num?)?.toDouble()
      ..kayityapankul = json['KAYITYAPANKUL'] as String?
      ..kayittarihi = json['KAYITTARIHI'] as String?
      ..grupKodu = json['GRUP_KODU'] as String?
      ..grupTanimi = json['GRUP_TANIMI'] as String?
      ..duzeltmetarihi = json['DUZELTMETARIHI'] == null
          ? null
          : DateTime.parse(json['DUZELTMETARIHI'] as String)
      ..duzeltmeyapankul = json['DUZELTMEYAPANKUL'] as String?
      ..stokFiyatList = json['STOK_FIYAT_LIST'] as List<dynamic>?
      ..stokList = json['STOK_LIST'] as List<dynamic>?
      ..fiatBirimi = json['FIAT_BIRIMI'] as int?
      ..kilitGenel = json['KILIT_GENEL'] as String?
      ..kilitSaticisip = json['KILIT_SATICISIP'] as String?
      ..kilitMussip = json['KILIT_MUSSIP'] as String?
      ..kilitAlis = json['KILIT_ALIS'] as String?
      ..kilitSatis = json['KILIT_SATIS'] as String?
      ..birimAgirlik = (json['BIRIM_AGIRLIK'] as num?)?.toDouble()
      ..kod1 = json['KOD1'] as String?
      ..kod1Tanimi = json['KOD1_TANIMI'] as String?
      ..barkod1 = json['BARKOD1'] as String?
      ..satDovTip = json['SAT_DOV_TIP'] as int?
      ..dovSatisFiat = (json['DOV_SATIS_FIAT'] as num?)?.toDouble()
      ..satisDovizAdi = json['SATIS_DOVIZ_ADI'] as String?
      ..barkod2 = json['BARKOD2'] as String?
      ..barkod3 = json['BARKOD3'] as String?
      ..kod2 = json['KOD2'] as String?
      ..kod3 = json['KOD3'] as String?
      ..kod4 = json['KOD4'] as String?
      ..seriCikistaOtomatikMi = json['SERI_CIKISTA_OTOMATIK_MI'] as bool?
      ..seriGiristeOtomatikMi = json['SERI_GIRISTE_OTOMATIK_MI'] as bool?
      ..alisDovTip = json['ALIS_DOV_TIP'] as int?
      ..alisDovizAdi = json['ALIS_DOVIZ_ADI'] as String?
      ..ureticiKodu = json['URETICI_KODU'] as String?
      ..satisFiat1 = (json['SATIS_FIAT1'] as num?)?.toDouble()
      ..satisFiat2 = (json['SATIS_FIAT2'] as num?)?.toDouble()
      ..satisFiat3 = (json['SATIS_FIAT3'] as num?)?.toDouble()
      ..satisFiat4 = (json['SATIS_FIAT4'] as num?)?.toDouble()
      ..kod5 = json['KOD5'] as String?
      ..alisFiat2 = (json['ALIS_FIAT2'] as num?)?.toDouble()
      ..alisFiat3 = (json['ALIS_FIAT3'] as num?)?.toDouble()
      ..alisFiat4 = (json['ALIS_FIAT4'] as num?)?.toDouble()
      ..kod2Tanimi = json['KOD2_TANIMI'] as String?
      ..kod3Tanimi = json['KOD3_TANIMI'] as String?
      ..kod4Tanimi = json['KOD4_TANIMI'] as String?
      ..kod5Tanimi = json['KOD5_TANIMI'] as String?
      ..seriCikislardaAcik = json['SERI_CIKISLARDA_ACIK'] as bool?
      ..seriGirislerdeAcik = json['SERI_GIRISLERDE_ACIK'] as bool?
      ..seriMiktarKadarSor = json['SERI_MIKTAR_KADAR_SOR'] as bool?
      ..seriBakiyeKontrolu = json['SERI_BAKIYE_KONTROLU'] as bool?
      ..muhdetayKodu = json['MUHDETAY_KODU'] as int?
      ..dovAlisFiat = (json['DOV_ALIS_FIAT'] as num?)?.toDouble();

Map<String, dynamic> _$StokListesiModelToJson(StokListesiModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('BAKIYE', instance.bakiye);
  writeNotNull('SUBE_KODU', instance.subeKodu);
  writeNotNull('MUHDETAY_ADI', instance.muhdetayAdi);
  writeNotNull('RESIM_URL', instance.resimUrl);
  writeNotNull('RESIM_URL_KUCUK', instance.resimUrlKucuk);
  writeNotNull('ALIS_FIAT1', instance.alisFiat1);
  writeNotNull('ALIS_KDV', instance.alisKdv);
  writeNotNull('SATIS_KDV', instance.satisKdv);
  writeNotNull('OLCU_BIRIMI', instance.olcuBirimi);
  writeNotNull('OLCU_BIRIMI2', instance.olcuBirimi2);
  writeNotNull('OLCU_BIRIMI2_PAY', instance.olcuBirimi2Pay);
  writeNotNull('OLCU_BIRIMI2_PAYDA', instance.olcuBirimi2Payda);
  writeNotNull('OLCU_BIRIMI3', instance.olcuBirimi3);
  writeNotNull('OLCU_BIRIMI3_PAY', instance.olcuBirimi3Pay);
  writeNotNull('OLCU_BIRIMI3_PAYDA', instance.olcuBirimi3Payda);
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('KAYITTARIHI', instance.kayittarihi);
  writeNotNull('GRUP_KODU', instance.grupKodu);
  writeNotNull('GRUP_TANIMI', instance.grupTanimi);
  writeNotNull('DUZELTMETARIHI', instance.duzeltmetarihi?.toIso8601String());
  writeNotNull('DUZELTMEYAPANKUL', instance.duzeltmeyapankul);
  writeNotNull('STOK_FIYAT_LIST', instance.stokFiyatList);
  writeNotNull('STOK_LIST', instance.stokList);
  writeNotNull('FIAT_BIRIMI', instance.fiatBirimi);
  writeNotNull('KILIT_GENEL', instance.kilitGenel);
  writeNotNull('KILIT_SATICISIP', instance.kilitSaticisip);
  writeNotNull('KILIT_MUSSIP', instance.kilitMussip);
  writeNotNull('KILIT_ALIS', instance.kilitAlis);
  writeNotNull('KILIT_SATIS', instance.kilitSatis);
  writeNotNull('BIRIM_AGIRLIK', instance.birimAgirlik);
  writeNotNull('KOD1', instance.kod1);
  writeNotNull('KOD1_TANIMI', instance.kod1Tanimi);
  writeNotNull('BARKOD1', instance.barkod1);
  writeNotNull('SAT_DOV_TIP', instance.satDovTip);
  writeNotNull('DOV_SATIS_FIAT', instance.dovSatisFiat);
  writeNotNull('SATIS_DOVIZ_ADI', instance.satisDovizAdi);
  writeNotNull('BARKOD2', instance.barkod2);
  writeNotNull('BARKOD3', instance.barkod3);
  writeNotNull('KOD2', instance.kod2);
  writeNotNull('KOD3', instance.kod3);
  writeNotNull('KOD4', instance.kod4);
  writeNotNull('SERI_CIKISTA_OTOMATIK_MI', instance.seriCikistaOtomatikMi);
  writeNotNull('SERI_GIRISTE_OTOMATIK_MI', instance.seriGiristeOtomatikMi);
  writeNotNull('ALIS_DOV_TIP', instance.alisDovTip);
  writeNotNull('ALIS_DOVIZ_ADI', instance.alisDovizAdi);
  writeNotNull('URETICI_KODU', instance.ureticiKodu);
  writeNotNull('SATIS_FIAT1', instance.satisFiat1);
  writeNotNull('SATIS_FIAT2', instance.satisFiat2);
  writeNotNull('SATIS_FIAT3', instance.satisFiat3);
  writeNotNull('SATIS_FIAT4', instance.satisFiat4);
  writeNotNull('KOD5', instance.kod5);
  writeNotNull('ALIS_FIAT2', instance.alisFiat2);
  writeNotNull('ALIS_FIAT3', instance.alisFiat3);
  writeNotNull('ALIS_FIAT4', instance.alisFiat4);
  writeNotNull('KOD2_TANIMI', instance.kod2Tanimi);
  writeNotNull('KOD3_TANIMI', instance.kod3Tanimi);
  writeNotNull('KOD4_TANIMI', instance.kod4Tanimi);
  writeNotNull('KOD5_TANIMI', instance.kod5Tanimi);
  writeNotNull('SERI_CIKISLARDA_ACIK', instance.seriCikislardaAcik);
  writeNotNull('SERI_GIRISLERDE_ACIK', instance.seriGirislerdeAcik);
  writeNotNull('SERI_MIKTAR_KADAR_SOR', instance.seriMiktarKadarSor);
  writeNotNull('SERI_BAKIYE_KONTROLU', instance.seriBakiyeKontrolu);
  writeNotNull('MUHDETAY_KODU', instance.muhdetayKodu);
  writeNotNull('DOV_ALIS_FIAT', instance.dovAlisFiat);
  return val;
}

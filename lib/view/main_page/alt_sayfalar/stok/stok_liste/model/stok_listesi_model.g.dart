// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokListesiModel _$StokListesiModelFromJson(Map<String, dynamic> json) =>
    StokListesiModel()
      ..seriBakiyeKontrolu = json['SERI_BAKIYE_KONTROLU'] as bool?
      ..seriCikislardaAcik = json['SERI_CIKISLARDA_ACIK'] as bool?
      ..seriCikistaOtomatikMi = json['SERI_CIKISTA_OTOMATIK_MI'] as bool?
      ..seriGirislerdeAcik = json['SERI_GIRISLERDE_ACIK'] as bool?
      ..seriGiristeOtomatikMi = json['SERI_GIRISTE_OTOMATIK_MI'] as bool?
      ..seriMiktarKadarSor = json['SERI_MIKTAR_KADAR_SOR'] as bool?
      ..duzeltmetarihi = json['DUZELTMETARIHI'] == null
          ? null
          : DateTime.parse(json['DUZELTMETARIHI'] as String)
      ..alisFiat1 = (json['ALIS_FIAT1'] as num?)?.toDouble()
      ..alisFiat2 = (json['ALIS_FIAT2'] as num?)?.toDouble()
      ..alisFiat3 = (json['ALIS_FIAT3'] as num?)?.toDouble()
      ..alisFiat4 = (json['ALIS_FIAT4'] as num?)?.toDouble()
      ..alisKdv = (json['ALIS_KDV'] as num?)?.toDouble()
      ..bakiye = (json['BAKIYE'] as num?)?.toDouble()
      ..birimAgirlik = (json['BIRIM_AGIRLIK'] as num?)?.toDouble()
      ..dovAlisFiat = (json['DOV_ALIS_FIAT'] as num?)?.toDouble()
      ..dovSatisFiat = (json['DOV_SATIS_FIAT'] as num?)?.toDouble()
      ..olcuBirimi2Pay = (json['OLCU_BIRIMI2_PAY'] as num?)?.toDouble()
      ..olcuBirimi2Payda = (json['OLCU_BIRIMI2_PAYDA'] as num?)?.toDouble()
      ..olcuBirimi3Pay = (json['OLCU_BIRIMI3_PAY'] as num?)?.toDouble()
      ..olcuBirimi3Payda = (json['OLCU_BIRIMI3_PAYDA'] as num?)?.toDouble()
      ..satisFiat1 = (json['SATIS_FIAT1'] as num?)?.toDouble()
      ..satisFiat2 = (json['SATIS_FIAT2'] as num?)?.toDouble()
      ..satisFiat3 = (json['SATIS_FIAT3'] as num?)?.toDouble()
      ..satisFiat4 = (json['SATIS_FIAT4'] as num?)?.toDouble()
      ..satisKdv = (json['SATIS_KDV'] as num?)?.toDouble()
      ..alisDovTip = json['ALIS_DOV_TIP'] as int?
      ..bulunanFiyat = (json['BULUNAN_FIYAT'] as num?)?.toDouble()
      ..depoKodu = json['DEPO_KODU'] as int?
      ..fiatBirimi = json['FIAT_BIRIMI'] as int?
      ..muhdetayKodu = json['MUHDETAY_KODU'] as int?
      ..satDovTip = json['SAT_DOV_TIP'] as int?
      ..subeKodu = json['SUBE_KODU'] as int?
      ..stokFiyatList = json['STOK_FIYAT_LIST'] as List<dynamic>?
      ..stokList = (json['STOK_LIST'] as List<dynamic>?)
          ?.map((e) => StokList.fromJson(e as Map<String, dynamic>))
          .toList()
      ..alisDovizAdi = json['ALIS_DOVIZ_ADI'] as String?
      ..barkod1 = json['BARKOD1'] as String?
      ..barkod2 = json['BARKOD2'] as String?
      ..barkod3 = json['BARKOD3'] as String?
      ..duzeltmeyapankul = json['DUZELTMEYAPANKUL'] as String?
      ..grupKodu = json['GRUP_KODU'] as String?
      ..grupTanimi = json['GRUP_TANIMI'] as String?
      ..kayittarihi = json['KAYITTARIHI'] as String?
      ..kayityapankul = json['KAYITYAPANKUL'] as String?
      ..kilitAlis = json['KILIT_ALIS'] as String?
      ..kilitGenel = json['KILIT_GENEL'] as String?
      ..kilitMussip = json['KILIT_MUSSIP'] as String?
      ..kilitSaticisip = json['KILIT_SATICISIP'] as String?
      ..kilitSatis = json['KILIT_SATIS'] as String?
      ..kod1 = json['KOD1'] as String?
      ..kod1Tanimi = json['KOD1_TANIMI'] as String?
      ..kod2 = json['KOD2'] as String?
      ..kod2Tanimi = json['KOD2_TANIMI'] as String?
      ..kod3 = json['KOD3'] as String?
      ..kod3Tanimi = json['KOD3_TANIMI'] as String?
      ..kod4 = json['KOD4'] as String?
      ..kod4Tanimi = json['KOD4_TANIMI'] as String?
      ..kod5 = json['KOD5'] as String?
      ..kod5Tanimi = json['KOD5_TANIMI'] as String?
      ..muhdetayAdi = json['MUHDETAY_ADI'] as String?
      ..olcuBirimi = json['OLCU_BIRIMI'] as String?
      ..olcuBirimi2 = json['OLCU_BIRIMI2'] as String?
      ..olcuBirimi3 = json['OLCU_BIRIMI3'] as String?
      ..paketMi = json['PAKET_MI'] as String?
      ..resimBase64 = json['RESIM_BASE64'] as String?
      ..resimUrl = json['RESIM_URL'] as String?
      ..resimUrlKucuk = json['RESIM_URL_KUCUK'] as String?
      ..satisDovizAdi = json['SATIS_DOVIZ_ADI'] as String?
      ..stokAdi = json['STOK_ADI'] as String?
      ..stokKodu = json['STOK_KODU'] as String?
      ..ureticiKodu = json['URETICI_KODU'] as String?;

Map<String, dynamic> _$StokListesiModelToJson(StokListesiModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SERI_BAKIYE_KONTROLU', instance.seriBakiyeKontrolu);
  writeNotNull('SERI_CIKISLARDA_ACIK', instance.seriCikislardaAcik);
  writeNotNull('SERI_CIKISTA_OTOMATIK_MI', instance.seriCikistaOtomatikMi);
  writeNotNull('SERI_GIRISLERDE_ACIK', instance.seriGirislerdeAcik);
  writeNotNull('SERI_GIRISTE_OTOMATIK_MI', instance.seriGiristeOtomatikMi);
  writeNotNull('SERI_MIKTAR_KADAR_SOR', instance.seriMiktarKadarSor);
  writeNotNull('DUZELTMETARIHI', instance.duzeltmetarihi?.toIso8601String());
  writeNotNull('ALIS_FIAT1', instance.alisFiat1);
  writeNotNull('ALIS_FIAT2', instance.alisFiat2);
  writeNotNull('ALIS_FIAT3', instance.alisFiat3);
  writeNotNull('ALIS_FIAT4', instance.alisFiat4);
  writeNotNull('ALIS_KDV', instance.alisKdv);
  writeNotNull('BAKIYE', instance.bakiye);
  writeNotNull('BIRIM_AGIRLIK', instance.birimAgirlik);
  writeNotNull('DOV_ALIS_FIAT', instance.dovAlisFiat);
  writeNotNull('DOV_SATIS_FIAT', instance.dovSatisFiat);
  writeNotNull('OLCU_BIRIMI2_PAY', instance.olcuBirimi2Pay);
  writeNotNull('OLCU_BIRIMI2_PAYDA', instance.olcuBirimi2Payda);
  writeNotNull('OLCU_BIRIMI3_PAY', instance.olcuBirimi3Pay);
  writeNotNull('OLCU_BIRIMI3_PAYDA', instance.olcuBirimi3Payda);
  writeNotNull('SATIS_FIAT1', instance.satisFiat1);
  writeNotNull('SATIS_FIAT2', instance.satisFiat2);
  writeNotNull('SATIS_FIAT3', instance.satisFiat3);
  writeNotNull('SATIS_FIAT4', instance.satisFiat4);
  writeNotNull('SATIS_KDV', instance.satisKdv);
  writeNotNull('ALIS_DOV_TIP', instance.alisDovTip);
  writeNotNull('BULUNAN_FIYAT', instance.bulunanFiyat);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('FIAT_BIRIMI', instance.fiatBirimi);
  writeNotNull('MUHDETAY_KODU', instance.muhdetayKodu);
  writeNotNull('SAT_DOV_TIP', instance.satDovTip);
  writeNotNull('SUBE_KODU', instance.subeKodu);
  writeNotNull('STOK_FIYAT_LIST', instance.stokFiyatList);
  writeNotNull('STOK_LIST', instance.stokList?.map((e) => e.toJson()).toList());
  writeNotNull('ALIS_DOVIZ_ADI', instance.alisDovizAdi);
  writeNotNull('BARKOD1', instance.barkod1);
  writeNotNull('BARKOD2', instance.barkod2);
  writeNotNull('BARKOD3', instance.barkod3);
  writeNotNull('DUZELTMEYAPANKUL', instance.duzeltmeyapankul);
  writeNotNull('GRUP_KODU', instance.grupKodu);
  writeNotNull('GRUP_TANIMI', instance.grupTanimi);
  writeNotNull('KAYITTARIHI', instance.kayittarihi);
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('KILIT_ALIS', instance.kilitAlis);
  writeNotNull('KILIT_GENEL', instance.kilitGenel);
  writeNotNull('KILIT_MUSSIP', instance.kilitMussip);
  writeNotNull('KILIT_SATICISIP', instance.kilitSaticisip);
  writeNotNull('KILIT_SATIS', instance.kilitSatis);
  writeNotNull('KOD1', instance.kod1);
  writeNotNull('KOD1_TANIMI', instance.kod1Tanimi);
  writeNotNull('KOD2', instance.kod2);
  writeNotNull('KOD2_TANIMI', instance.kod2Tanimi);
  writeNotNull('KOD3', instance.kod3);
  writeNotNull('KOD3_TANIMI', instance.kod3Tanimi);
  writeNotNull('KOD4', instance.kod4);
  writeNotNull('KOD4_TANIMI', instance.kod4Tanimi);
  writeNotNull('KOD5', instance.kod5);
  writeNotNull('KOD5_TANIMI', instance.kod5Tanimi);
  writeNotNull('MUHDETAY_ADI', instance.muhdetayAdi);
  writeNotNull('OLCU_BIRIMI', instance.olcuBirimi);
  writeNotNull('OLCU_BIRIMI2', instance.olcuBirimi2);
  writeNotNull('OLCU_BIRIMI3', instance.olcuBirimi3);
  writeNotNull('PAKET_MI', instance.paketMi);
  writeNotNull('RESIM_BASE64', instance.resimBase64);
  writeNotNull('RESIM_URL', instance.resimUrl);
  writeNotNull('RESIM_URL_KUCUK', instance.resimUrlKucuk);
  writeNotNull('SATIS_DOVIZ_ADI', instance.satisDovizAdi);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('URETICI_KODU', instance.ureticiKodu);
  return val;
}

StokList _$StokListFromJson(Map<String, dynamic> json) => StokList(
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      alisKdv: json['ALIS_KDV'] as int?,
      satisKdv: json['SATIS_KDV'] as int?,
      stokFiyatList: json['STOK_FIYAT_LIST'] as List<dynamic>?,
      stokList: json['STOK_LIST'] as List<dynamic>?,
      bulunanFiyat: json['BULUNAN_FIYAT'] as int?,
      paketMi: json['PAKET_MI'] as String?,
      koliBilesenMiktari: json['KOLI_BILESEN_MIKTARI'] as int?,
      koliBilesenOrani: json['KOLI_BILESEN_ORANI'] as int?,
      koliBilesenFiyatorandan: json['KOLI_BILESEN_FIYATORANDAN'] as String?,
      koliBilesenKolikdv: json['KOLI_BILESEN_KOLIKDV'] as String?,
    );

Map<String, dynamic> _$StokListToJson(StokList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ALIS_KDV', instance.alisKdv);
  writeNotNull('BULUNAN_FIYAT', instance.bulunanFiyat);
  writeNotNull('KOLI_BILESEN_FIYATORANDAN', instance.koliBilesenFiyatorandan);
  writeNotNull('KOLI_BILESEN_KOLIKDV', instance.koliBilesenKolikdv);
  writeNotNull('KOLI_BILESEN_MIKTARI', instance.koliBilesenMiktari);
  writeNotNull('KOLI_BILESEN_ORANI', instance.koliBilesenOrani);
  writeNotNull('PAKET_MI', instance.paketMi);
  writeNotNull('SATIS_KDV', instance.satisKdv);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('STOK_FIYAT_LIST', instance.stokFiyatList);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_LIST', instance.stokList);
  return val;
}

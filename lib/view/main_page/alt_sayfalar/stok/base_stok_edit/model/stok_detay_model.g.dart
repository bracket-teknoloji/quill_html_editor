// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_detay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokDetayModel _$StokDetayModelFromJson(Map<String, dynamic> json) =>
    StokDetayModel()
      ..stokKodu = json['STOK_KODU'] as String?
      ..stokAdi = json['STOK_ADI'] as String?
      ..seriList = json['SeriList'] as List<dynamic>?
      ..yapList = json['YapList'] as List<dynamic>?
      ..stokList = (json['StokList'] as List<dynamic>?)
          ?.map((e) => StokList.fromJson(e as Map<String, dynamic>))
          .toList()
      ..fiyatList = (json['FiyatList'] as List<dynamic>?)
          ?.map((e) => FiyatList.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$StokDetayModelToJson(StokDetayModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('SeriList', instance.seriList);
  writeNotNull('YapList', instance.yapList);
  writeNotNull('StokList', instance.stokList?.map((e) => e.toJson()).toList());
  writeNotNull(
      'FiyatList', instance.fiyatList?.map((e) => e.toJson()).toList());
  return val;
}

FiyatList _$FiyatListFromJson(Map<String, dynamic> json) => FiyatList()
  ..aS = json['A_S'] as String?
  ..stokKodu = json['STOK_KODU'] as String?
  ..dovizTipi = json['DOVIZ_TIPI'] as int?
  ..dovizKodu = json['DOVIZ_KODU'] as String?
  ..bastar =
      json['BASTAR'] == null ? null : DateTime.parse(json['BASTAR'] as String)
  ..bittar =
      json['BITTAR'] == null ? null : DateTime.parse(json['BITTAR'] as String)
  ..gecerli = json['GECERLI'] as String?
  ..fiyat1 = (json['FIYAT1'] as num?)?.toDouble()
  ..fiyat2 = (json['FIYAT2'] as num?)?.toDouble()
  ..fiyat3 = (json['FIYAT3'] as num?)?.toDouble()
  ..fiyat4 = (json['FIYAT4'] as num?)?.toDouble();

Map<String, dynamic> _$FiyatListToJson(FiyatList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('A_S', instance.aS);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('DOVIZ_KODU', instance.dovizKodu);
  writeNotNull('BASTAR', instance.bastar?.toIso8601String());
  writeNotNull('BITTAR', instance.bittar?.toIso8601String());
  writeNotNull('GECERLI', instance.gecerli);
  writeNotNull('FIYAT1', instance.fiyat1);
  writeNotNull('FIYAT2', instance.fiyat2);
  writeNotNull('FIYAT3', instance.fiyat3);
  writeNotNull('FIYAT4', instance.fiyat4);
  return val;
}

StokList _$StokListFromJson(Map<String, dynamic> json) => StokList()
  ..stokKodu = json['STOK_KODU'] as String?
  ..stokAdi = json['STOK_ADI'] as String?
  ..depoKodu = json['DEPO_KODU'] as int?
  ..bakiye = (json['BAKIYE'] as num?)?.toDouble()
  ..muhdetayAdi = json['MUHDETAY_ADI'] as String?
  ..alisFiat1 = (json['ALIS_FIAT1'] as num?)?.toDouble()
  ..alisFiat2 = (json['ALIS_FIAT2'] as num?)?.toDouble()
  ..alisFiat3 = (json['ALIS_FIAT3'] as num?)?.toDouble()
  ..alisFiat4 = (json['ALIS_FIAT4'] as num?)?.toDouble()
  ..alisKdv = (json['ALIS_KDV'] as num?)?.toDouble()
  ..satisFiat1 = (json['SATIS_FIAT1'] as num?)?.toDouble()
  ..satisFiat2 = (json['SATIS_FIAT2'] as num?)?.toDouble()
  ..satisFiat3 = (json['SATIS_FIAT3'] as num?)?.toDouble()
  ..satisFiat4 = (json['SATIS_FIAT4'] as num?)?.toDouble()
  ..satisKdv = (json['SATIS_KDV'] as num?)?.toDouble()
  ..olcuBirimi = json['OLCU_BIRIMI'] as String?
  ..olcuBirimi2 = json['OLCU_BIRIMI2'] as String?
  ..olcuBirimi3 = json['OLCU_BIRIMI3'] as String?
  ..olcuBirimi2Pay = (json['OLCU_BIRIMI2_PAY'] as num?)?.toDouble()
  ..olcuBirimi2Payda = (json['OLCU_BIRIMI2_PAYDA'] as num?)?.toDouble()
  ..olcuBirimi3Pay = (json['OLCU_BIRIMI3_PAY'] as num?)?.toDouble()
  ..olcuBirimi3Payda = (json['OLCU_BIRIMI3_PAYDA'] as num?)?.toDouble()
  ..barkod1 = json['BARKOD1'] as String?
  ..barkod2 = json['BARKOD2'] as String?
  ..barkod3 = json['BARKOD3'] as String?
  ..kayityapankul = json['KAYITYAPANKUL'] as String?
  ..kayittarihi = json['KAYITTARIHI'] == null
      ? null
      : DateTime.parse(json['KAYITTARIHI'] as String)
  ..grupKodu = json['GRUP_KODU'] as String?
  ..grupTanimi = json['GRUP_TANIMI'] as String?
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
  ..seriCikislardaAcik = json['SERI_CIKISLARDA_ACIK'] as bool?
  ..seriGirislerdeAcik = json['SERI_GIRISLERDE_ACIK'] as bool?
  ..seriMiktarKadarSor = json['SERI_MIKTAR_KADAR_SOR'] as bool?
  ..seriBakiyeKontrolu = json['SERI_BAKIYE_KONTROLU'] as bool?
  ..seriGiristeOtomatikMi = json['SERI_GIRISTE_OTOMATIK_MI'] as bool?
  ..seriCikistaOtomatikMi = json['SERI_CIKISTA_OTOMATIK_MI'] as bool?
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
  ..subeKodu = json['SUBE_KODU'] as int?
  ..muhdetayKodu = json['MUHDETAY_KODU'] as int?
  ..alisDovTip = json['ALIS_DOV_TIP'] as int?
  ..dovAlisFiat = (json['DOV_ALIS_FIAT'] as num?)?.toDouble()
  ..alisDovizAdi = json['ALIS_DOVIZ_ADI'] as String?
  ..satDovTip = json['SAT_DOV_TIP'] as int?
  ..dovSatisFiat = (json['DOV_SATIS_FIAT'] as num?)?.toDouble()
  ..satisDovizAdi = json['SATIS_DOVIZ_ADI'] as String?
  ..ureticiKodu = json['URETICI_KODU'] as String?
  ..birimAgirlik = (json['BIRIM_AGIRLIK'] as num?)?.toDouble();

Map<String, dynamic> _$StokListToJson(StokList instance) {
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
  writeNotNull('MUHDETAY_ADI', instance.muhdetayAdi);
  writeNotNull('ALIS_FIAT1', instance.alisFiat1);
  writeNotNull('ALIS_FIAT2', instance.alisFiat2);
  writeNotNull('ALIS_FIAT3', instance.alisFiat3);
  writeNotNull('ALIS_FIAT4', instance.alisFiat4);
  writeNotNull('ALIS_KDV', instance.alisKdv);
  writeNotNull('SATIS_FIAT1', instance.satisFiat1);
  writeNotNull('SATIS_FIAT2', instance.satisFiat2);
  writeNotNull('SATIS_FIAT3', instance.satisFiat3);
  writeNotNull('SATIS_FIAT4', instance.satisFiat4);
  writeNotNull('SATIS_KDV', instance.satisKdv);
  writeNotNull('OLCU_BIRIMI', instance.olcuBirimi);
  writeNotNull('OLCU_BIRIMI2', instance.olcuBirimi2);
  writeNotNull('OLCU_BIRIMI3', instance.olcuBirimi3);
  writeNotNull('OLCU_BIRIMI2_PAY', instance.olcuBirimi2Pay);
  writeNotNull('OLCU_BIRIMI2_PAYDA', instance.olcuBirimi2Payda);
  writeNotNull('OLCU_BIRIMI3_PAY', instance.olcuBirimi3Pay);
  writeNotNull('OLCU_BIRIMI3_PAYDA', instance.olcuBirimi3Payda);
  writeNotNull('BARKOD1', instance.barkod1);
  writeNotNull('BARKOD2', instance.barkod2);
  writeNotNull('BARKOD3', instance.barkod3);
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('KAYITTARIHI', instance.kayittarihi?.toIso8601String());
  writeNotNull('GRUP_KODU', instance.grupKodu);
  writeNotNull('GRUP_TANIMI', instance.grupTanimi);
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
  writeNotNull('SERI_CIKISLARDA_ACIK', instance.seriCikislardaAcik);
  writeNotNull('SERI_GIRISLERDE_ACIK', instance.seriGirislerdeAcik);
  writeNotNull('SERI_MIKTAR_KADAR_SOR', instance.seriMiktarKadarSor);
  writeNotNull('SERI_BAKIYE_KONTROLU', instance.seriBakiyeKontrolu);
  writeNotNull('SERI_GIRISTE_OTOMATIK_MI', instance.seriGiristeOtomatikMi);
  writeNotNull('SERI_CIKISTA_OTOMATIK_MI', instance.seriCikistaOtomatikMi);
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
  writeNotNull('SUBE_KODU', instance.subeKodu);
  writeNotNull('MUHDETAY_KODU', instance.muhdetayKodu);
  writeNotNull('ALIS_DOV_TIP', instance.alisDovTip);
  writeNotNull('DOV_ALIS_FIAT', instance.dovAlisFiat);
  writeNotNull('ALIS_DOVIZ_ADI', instance.alisDovizAdi);
  writeNotNull('SAT_DOV_TIP', instance.satDovTip);
  writeNotNull('DOV_SATIS_FIAT', instance.dovSatisFiat);
  writeNotNull('SATIS_DOVIZ_ADI', instance.satisDovizAdi);
  writeNotNull('URETICI_KODU', instance.ureticiKodu);
  writeNotNull('BIRIM_AGIRLIK', instance.birimAgirlik);
  return val;
}

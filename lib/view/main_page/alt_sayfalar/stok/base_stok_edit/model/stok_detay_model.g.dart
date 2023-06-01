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
  writeNotNull('StokList', instance.stokList);
  writeNotNull('FiyatList', instance.fiyatList);
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

Map<String, dynamic> _$FiyatListToJson(FiyatList instance) => <String, dynamic>{
      'A_S': instance.aS,
      'STOK_KODU': instance.stokKodu,
      'DOVIZ_TIPI': instance.dovizTipi,
      'DOVIZ_KODU': instance.dovizKodu,
      'BASTAR': instance.bastar?.toIso8601String(),
      'BITTAR': instance.bittar?.toIso8601String(),
      'GECERLI': instance.gecerli,
      'FIYAT1': instance.fiyat1,
      'FIYAT2': instance.fiyat2,
      'FIYAT3': instance.fiyat3,
      'FIYAT4': instance.fiyat4,
    };

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

Map<String, dynamic> _$StokListToJson(StokList instance) => <String, dynamic>{
      'STOK_KODU': instance.stokKodu,
      'STOK_ADI': instance.stokAdi,
      'DEPO_KODU': instance.depoKodu,
      'BAKIYE': instance.bakiye,
      'MUHDETAY_ADI': instance.muhdetayAdi,
      'ALIS_FIAT1': instance.alisFiat1,
      'ALIS_FIAT2': instance.alisFiat2,
      'ALIS_FIAT3': instance.alisFiat3,
      'ALIS_FIAT4': instance.alisFiat4,
      'ALIS_KDV': instance.alisKdv,
      'SATIS_FIAT1': instance.satisFiat1,
      'SATIS_FIAT2': instance.satisFiat2,
      'SATIS_FIAT3': instance.satisFiat3,
      'SATIS_FIAT4': instance.satisFiat4,
      'SATIS_KDV': instance.satisKdv,
      'OLCU_BIRIMI': instance.olcuBirimi,
      'OLCU_BIRIMI2': instance.olcuBirimi2,
      'OLCU_BIRIMI3': instance.olcuBirimi3,
      'OLCU_BIRIMI2_PAY': instance.olcuBirimi2Pay,
      'OLCU_BIRIMI2_PAYDA': instance.olcuBirimi2Payda,
      'OLCU_BIRIMI3_PAY': instance.olcuBirimi3Pay,
      'OLCU_BIRIMI3_PAYDA': instance.olcuBirimi3Payda,
      'BARKOD1': instance.barkod1,
      'BARKOD2': instance.barkod2,
      'BARKOD3': instance.barkod3,
      'KAYITYAPANKUL': instance.kayityapankul,
      'KAYITTARIHI': instance.kayittarihi?.toIso8601String(),
      'GRUP_KODU': instance.grupKodu,
      'GRUP_TANIMI': instance.grupTanimi,
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
      'SERI_CIKISLARDA_ACIK': instance.seriCikislardaAcik,
      'SERI_GIRISLERDE_ACIK': instance.seriGirislerdeAcik,
      'SERI_MIKTAR_KADAR_SOR': instance.seriMiktarKadarSor,
      'SERI_BAKIYE_KONTROLU': instance.seriBakiyeKontrolu,
      'SERI_GIRISTE_OTOMATIK_MI': instance.seriGiristeOtomatikMi,
      'SERI_CIKISTA_OTOMATIK_MI': instance.seriCikistaOtomatikMi,
      'DUZELTMETARIHI': instance.duzeltmetarihi?.toIso8601String(),
      'DUZELTMEYAPANKUL': instance.duzeltmeyapankul,
      'STOK_FIYAT_LIST': instance.stokFiyatList,
      'STOK_LIST': instance.stokList,
      'FIAT_BIRIMI': instance.fiatBirimi,
      'KILIT_GENEL': instance.kilitGenel,
      'KILIT_SATICISIP': instance.kilitSaticisip,
      'KILIT_MUSSIP': instance.kilitMussip,
      'KILIT_ALIS': instance.kilitAlis,
      'KILIT_SATIS': instance.kilitSatis,
      'SUBE_KODU': instance.subeKodu,
      'MUHDETAY_KODU': instance.muhdetayKodu,
      'ALIS_DOV_TIP': instance.alisDovTip,
      'DOV_ALIS_FIAT': instance.dovAlisFiat,
      'ALIS_DOVIZ_ADI': instance.alisDovizAdi,
      'SAT_DOV_TIP': instance.satDovTip,
      'DOV_SATIS_FIAT': instance.dovSatisFiat,
      'SATIS_DOVIZ_ADI': instance.satisDovizAdi,
      'URETICI_KODU': instance.ureticiKodu,
      'BIRIM_AGIRLIK': instance.birimAgirlik,
    };

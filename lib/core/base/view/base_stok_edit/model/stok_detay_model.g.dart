// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'stok_detay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokDetayModel _$StokDetayModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'StokDetayModel',
      json,
      ($checkedConvert) {
        final val = StokDetayModel();
        $checkedConvert('STOK_KODU', (v) => val.stokKodu = v as String?);
        $checkedConvert('STOK_ADI', (v) => val.stokAdi = v as String?);
        $checkedConvert('SERI_LIST', (v) => val.seriList = v as List<dynamic>?);
        $checkedConvert('YAP_LIST', (v) => val.yapList = v as List<dynamic>?);
        $checkedConvert(
            'STOK_LIST',
            (v) => val.stokList = (v as List<dynamic>?)
                ?.map((e) => StokList.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'FIYAT_LIST',
            (v) => val.fiyatList = (v as List<dynamic>?)
                ?.map((e) => FiyatList.fromJson(e as Map<String, dynamic>))
                .toList());
        return val;
      },
      fieldKeyMap: const {
        'stokKodu': 'STOK_KODU',
        'stokAdi': 'STOK_ADI',
        'seriList': 'SERI_LIST',
        'yapList': 'YAP_LIST',
        'stokList': 'STOK_LIST',
        'fiyatList': 'FIYAT_LIST'
      },
    );

Map<String, dynamic> _$StokDetayModelToJson(StokDetayModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('SERI_LIST', instance.seriList);
  writeNotNull('YAP_LIST', instance.yapList);
  writeNotNull('STOK_LIST', instance.stokList?.map((e) => e.toJson()).toList());
  writeNotNull(
      'FIYAT_LIST', instance.fiyatList?.map((e) => e.toJson()).toList());
  return val;
}

FiyatList _$FiyatListFromJson(Map<String, dynamic> json) => $checkedCreate(
      'FiyatList',
      json,
      ($checkedConvert) {
        final val = FiyatList();
        $checkedConvert('A_S', (v) => val.aS = v as String?);
        $checkedConvert('STOK_KODU', (v) => val.stokKodu = v as String?);
        $checkedConvert('DOVIZ_TIPI', (v) => val.dovizTipi = v as int?);
        $checkedConvert('DOVIZ_KODU', (v) => val.dovizKodu = v as String?);
        $checkedConvert('BASTAR',
            (v) => val.bastar = v == null ? null : DateTime.parse(v as String));
        $checkedConvert('GECERLI', (v) => val.gecerli = v as String?);
        $checkedConvert('FIYAT1', (v) => val.fiyat1 = (v as num?)?.toDouble());
        return val;
      },
      fieldKeyMap: const {
        'aS': 'A_S',
        'stokKodu': 'STOK_KODU',
        'dovizTipi': 'DOVIZ_TIPI',
        'dovizKodu': 'DOVIZ_KODU',
        'bastar': 'BASTAR',
        'gecerli': 'GECERLI',
        'fiyat1': 'FIYAT1'
      },
    );

Map<String, dynamic> _$FiyatListToJson(FiyatList instance) => <String, dynamic>{
      'A_S': instance.aS,
      'STOK_KODU': instance.stokKodu,
      'DOVIZ_TIPI': instance.dovizTipi,
      'DOVIZ_KODU': instance.dovizKodu,
      'BASTAR': instance.bastar?.toIso8601String(),
      'GECERLI': instance.gecerli,
      'FIYAT1': instance.fiyat1,
    };

StokList _$StokListFromJson(Map<String, dynamic> json) => $checkedCreate(
      'StokList',
      json,
      ($checkedConvert) {
        final val = StokList();
        $checkedConvert('STOK_KODU', (v) => val.stokKodu = v as String?);
        $checkedConvert('STOK_ADI', (v) => val.stokAdi = v as String?);
        $checkedConvert('DEPO_KODU', (v) => val.depoKodu = v as int?);
        $checkedConvert('BAKIYE', (v) => val.bakiye = v as int?);
        $checkedConvert('MUHDETAY_ADI', (v) => val.muhdetayAdi = v as String?);
        $checkedConvert('ALIS_FIAT1', (v) => val.alisFiat1 = v as int?);
        $checkedConvert('ALIS_KDV', (v) => val.alisKdv = v as int?);
        $checkedConvert(
            'SATIS_FIAT1', (v) => val.satisFiat1 = (v as num?)?.toDouble());
        $checkedConvert('SATIS_KDV', (v) => val.satisKdv = v as int?);
        $checkedConvert('OLCU_BIRIMI', (v) => val.olcuBirimi = v as String?);
        $checkedConvert('OLCU_BIRIMI2', (v) => val.olcuBirimi2 = v as String?);
        $checkedConvert('OLCU_BIRIMI3', (v) => val.olcuBirimi3 = v as String?);
        $checkedConvert(
            'OLCU_BIRIMI2_PAY', (v) => val.olcuBirimi2Pay = v as int?);
        $checkedConvert(
            'OLCU_BIRIMI2_PAYDA', (v) => val.olcuBirimi2Payda = v as int?);
        $checkedConvert(
            'OLCU_BIRIMI3_PAY', (v) => val.olcuBirimi3Pay = v as int?);
        $checkedConvert(
            'OLCU_BIRIMI3_PAYDA', (v) => val.olcuBirimi3Payda = v as int?);
        $checkedConvert('BARKOD1', (v) => val.barkod1 = v as String?);
        $checkedConvert('BARKOD2', (v) => val.barkod2 = v as String?);
        $checkedConvert('BARKOD3', (v) => val.barkod3 = v as String?);
        $checkedConvert(
            'KAYITYAPANKUL', (v) => val.kayityapankul = v as String?);
        $checkedConvert(
            'KAYITTARIHI',
            (v) => val.kayittarihi =
                v == null ? null : DateTime.parse(v as String));
        $checkedConvert('GRUP_KODU', (v) => val.grupKodu = v as String?);
        $checkedConvert('GRUP_TANIMI', (v) => val.grupTanimi = v as String?);
        $checkedConvert('KOD1', (v) => val.kod1 = v as String?);
        $checkedConvert('KOD1_TANIMI', (v) => val.kod1Tanimi = v as String?);
        $checkedConvert('KOD2', (v) => val.kod2 = v as String?);
        $checkedConvert('KOD2_TANIMI', (v) => val.kod2Tanimi = v as String?);
        $checkedConvert('KOD3', (v) => val.kod3 = v as String?);
        $checkedConvert('KOD3_TANIMI', (v) => val.kod3Tanimi = v as String?);
        $checkedConvert('KOD4', (v) => val.kod4 = v as String?);
        $checkedConvert('KOD4_TANIMI', (v) => val.kod4Tanimi = v as String?);
        $checkedConvert('KOD5', (v) => val.kod5 = v as String?);
        $checkedConvert('KOD5_TANIMI', (v) => val.kod5Tanimi = v as String?);
        $checkedConvert(
            'DUZELTMETARIHI',
            (v) => val.duzeltmetarihi =
                v == null ? null : DateTime.parse(v as String));
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
        return val;
      },
      fieldKeyMap: const {
        'stokKodu': 'STOK_KODU',
        'stokAdi': 'STOK_ADI',
        'depoKodu': 'DEPO_KODU',
        'bakiye': 'BAKIYE',
        'muhdetayAdi': 'MUHDETAY_ADI',
        'alisFiat1': 'ALIS_FIAT1',
        'alisKdv': 'ALIS_KDV',
        'satisFiat1': 'SATIS_FIAT1',
        'satisKdv': 'SATIS_KDV',
        'olcuBirimi': 'OLCU_BIRIMI',
        'olcuBirimi2': 'OLCU_BIRIMI2',
        'olcuBirimi3': 'OLCU_BIRIMI3',
        'olcuBirimi2Pay': 'OLCU_BIRIMI2_PAY',
        'olcuBirimi2Payda': 'OLCU_BIRIMI2_PAYDA',
        'olcuBirimi3Pay': 'OLCU_BIRIMI3_PAY',
        'olcuBirimi3Payda': 'OLCU_BIRIMI3_PAYDA',
        'barkod1': 'BARKOD1',
        'barkod2': 'BARKOD2',
        'barkod3': 'BARKOD3',
        'kayityapankul': 'KAYITYAPANKUL',
        'kayittarihi': 'KAYITTARIHI',
        'grupKodu': 'GRUP_KODU',
        'grupTanimi': 'GRUP_TANIMI',
        'kod1': 'KOD1',
        'kod1Tanimi': 'KOD1_TANIMI',
        'kod2': 'KOD2',
        'kod2Tanimi': 'KOD2_TANIMI',
        'kod3': 'KOD3',
        'kod3Tanimi': 'KOD3_TANIMI',
        'kod4': 'KOD4',
        'kod4Tanimi': 'KOD4_TANIMI',
        'kod5': 'KOD5',
        'kod5Tanimi': 'KOD5_TANIMI',
        'duzeltmetarihi': 'DUZELTMETARIHI',
        'duzeltmeyapankul': 'DUZELTMEYAPANKUL',
        'stokFiyatList': 'STOK_FIYAT_LIST',
        'stokList': 'STOK_LIST',
        'fiatBirimi': 'FIAT_BIRIMI',
        'kilitGenel': 'KILIT_GENEL',
        'kilitSaticisip': 'KILIT_SATICISIP',
        'kilitMussip': 'KILIT_MUSSIP',
        'kilitAlis': 'KILIT_ALIS',
        'kilitSatis': 'KILIT_SATIS'
      },
    );

Map<String, dynamic> _$StokListToJson(StokList instance) => <String, dynamic>{
      'STOK_KODU': instance.stokKodu,
      'STOK_ADI': instance.stokAdi,
      'DEPO_KODU': instance.depoKodu,
      'BAKIYE': instance.bakiye,
      'MUHDETAY_ADI': instance.muhdetayAdi,
      'ALIS_FIAT1': instance.alisFiat1,
      'ALIS_KDV': instance.alisKdv,
      'SATIS_FIAT1': instance.satisFiat1,
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
    };

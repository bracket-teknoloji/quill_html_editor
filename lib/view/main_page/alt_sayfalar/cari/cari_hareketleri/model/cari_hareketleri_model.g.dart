// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'cari_hareketleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariHareketleriModel _$CariHareketleriModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'CariHareketleriModel',
      json,
      ($checkedConvert) {
        final val = CariHareketleriModel();
        $checkedConvert('INCKEYNO', (v) => val.inckeyno = v as int?);
        $checkedConvert('CARI_KODU', (v) => val.cariKodu = v as String?);
        $checkedConvert('CARI_ADI', (v) => val.cariAdi = v as String?);
        $checkedConvert('TARIH',
            (v) => val.tarih = v == null ? null : DateTime.parse(v as String));
        $checkedConvert('ACIKLAMA', (v) => val.aciklama = v as String?);
        $checkedConvert('BORC', (v) => val.borc = (v as num?)?.toDouble());
        $checkedConvert(
            'HAREKET_ACIKLAMA', (v) => val.hareketAciklama = v as String?);
        $checkedConvert('HAREKET_KODU', (v) => val.hareketKodu = v as String?);
        $checkedConvert('BELGE_NO', (v) => val.belgeNo = v as String?);
        $checkedConvert(
            'PLASIYER_KODU', (v) => val.plasiyerKodu = v as String?);
        $checkedConvert(
            'PLASIYER_ACIKLAMA', (v) => val.plasiyerAciklama = v as String?);
        $checkedConvert('YURUYEN_BAKIYE',
            (v) => val.yuruyenBakiye = (v as num?)?.toDouble());
        $checkedConvert('PROJE_KODU', (v) => val.projeKodu = v as String?);
        $checkedConvert(
            'PROJE_ACIKLAMA', (v) => val.projeAciklama = v as String?);
        $checkedConvert(
            'DOVIZ_BORC', (v) => val.dovizBorc = (v as num?)?.toDouble());
        $checkedConvert('DOVIZ_TURU', (v) => val.dovizTuru = v as int?);
        $checkedConvert('DOVIZ_ADI', (v) => val.dovizAdi = v as String?);
        $checkedConvert('REFKEY', (v) => val.refkey = v as String?);
        $checkedConvert(
            'VADE_TARIHI',
            (v) => val.vadeTarihi =
                v == null ? null : DateTime.parse(v as String));
        $checkedConvert('BELGE_TIPI', (v) => val.belgeTipi = v as String?);
        $checkedConvert('ALACAK', (v) => val.alacak = (v as num?)?.toDouble());
        $checkedConvert('BORDRO_MU', (v) => val.bordroMu = v as bool?);
        $checkedConvert(
            'DOVIZ_ALACAK', (v) => val.dovizAlacak = (v as num?)?.toDouble());
        $checkedConvert('SUBE_KODU', (v) => val.subeKodu = v as int?);
        return val;
      },
      fieldKeyMap: const {
        'inckeyno': 'INCKEYNO',
        'cariKodu': 'CARI_KODU',
        'cariAdi': 'CARI_ADI',
        'tarih': 'TARIH',
        'aciklama': 'ACIKLAMA',
        'borc': 'BORC',
        'hareketAciklama': 'HAREKET_ACIKLAMA',
        'hareketKodu': 'HAREKET_KODU',
        'belgeNo': 'BELGE_NO',
        'plasiyerKodu': 'PLASIYER_KODU',
        'plasiyerAciklama': 'PLASIYER_ACIKLAMA',
        'yuruyenBakiye': 'YURUYEN_BAKIYE',
        'projeKodu': 'PROJE_KODU',
        'projeAciklama': 'PROJE_ACIKLAMA',
        'dovizBorc': 'DOVIZ_BORC',
        'dovizTuru': 'DOVIZ_TURU',
        'dovizAdi': 'DOVIZ_ADI',
        'refkey': 'REFKEY',
        'vadeTarihi': 'VADE_TARIHI',
        'belgeTipi': 'BELGE_TIPI',
        'alacak': 'ALACAK',
        'bordroMu': 'BORDRO_MU',
        'dovizAlacak': 'DOVIZ_ALACAK',
        'subeKodu': 'SUBE_KODU'
      },
    );

Map<String, dynamic> _$CariHareketleriModelToJson(
        CariHareketleriModel instance) =>
    <String, dynamic>{
      'INCKEYNO': instance.inckeyno,
      'CARI_KODU': instance.cariKodu,
      'CARI_ADI': instance.cariAdi,
      'TARIH': instance.tarih?.toIso8601String(),
      'ACIKLAMA': instance.aciklama,
      'BORC': instance.borc,
      'HAREKET_ACIKLAMA': instance.hareketAciklama,
      'HAREKET_KODU': instance.hareketKodu,
      'BELGE_NO': instance.belgeNo,
      'PLASIYER_KODU': instance.plasiyerKodu,
      'PLASIYER_ACIKLAMA': instance.plasiyerAciklama,
      'YURUYEN_BAKIYE': instance.yuruyenBakiye,
      'PROJE_KODU': instance.projeKodu,
      'PROJE_ACIKLAMA': instance.projeAciklama,
      'DOVIZ_BORC': instance.dovizBorc,
      'DOVIZ_TURU': instance.dovizTuru,
      'DOVIZ_ADI': instance.dovizAdi,
      'REFKEY': instance.refkey,
      'VADE_TARIHI': instance.vadeTarihi?.toIso8601String(),
      'BELGE_TIPI': instance.belgeTipi,
      'ALACAK': instance.alacak,
      'BORDRO_MU': instance.bordroMu,
      'DOVIZ_ALACAK': instance.dovizAlacak,
      'SUBE_KODU': instance.subeKodu,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'stok_yeni_kayit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokYeniKayitModel _$StokYeniKayitModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'StokYeniKayitModel',
      json,
      ($checkedConvert) {
        final val = StokYeniKayitModel();
        $checkedConvert('ACIKLAMA', (v) => val.aciklama = v as String?);
        $checkedConvert('BELGE_NO', (v) => val.belgeNo = v as String?);
        $checkedConvert('DEPO_KODU', (v) => val.depoKodu = v as int?);
        $checkedConvert('FIYAT', (v) => val.fiyat = v as int?);
        $checkedConvert('GC', (v) => val.gc = v as String?);
        $checkedConvert('HAREKET_TURU', (v) => val.hareketTuru = v as String?);
        $checkedConvert('MIKTAR', (v) => val.miktar = v as int?);
        $checkedConvert(
            'PLASIYER_KODU', (v) => val.plasiyerKodu = v as String?);
        $checkedConvert('PROJE_KODU', (v) => val.projeKodu = v as String?);
        $checkedConvert('STOK_KODU', (v) => val.stokKodu = v as String?);
        $checkedConvert('TARIH',
            (v) => val.tarih = v == null ? null : DateTime.parse(v as String));
        $checkedConvert('_YeniKayit', (v) => val.yeniKayit = v as bool?);
        return val;
      },
      fieldKeyMap: const {
        'aciklama': 'ACIKLAMA',
        'belgeNo': 'BELGE_NO',
        'depoKodu': 'DEPO_KODU',
        'fiyat': 'FIYAT',
        'gc': 'GC',
        'hareketTuru': 'HAREKET_TURU',
        'miktar': 'MIKTAR',
        'plasiyerKodu': 'PLASIYER_KODU',
        'projeKodu': 'PROJE_KODU',
        'stokKodu': 'STOK_KODU',
        'tarih': 'TARIH',
        'yeniKayit': '_YeniKayit'
      },
    );

Map<String, dynamic> _$StokYeniKayitModelToJson(StokYeniKayitModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('FIYAT', instance.fiyat);
  writeNotNull('GC', instance.gc);
  writeNotNull('HAREKET_TURU', instance.hareketTuru);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('_YeniKayit', instance.yeniKayit);
  return val;
}

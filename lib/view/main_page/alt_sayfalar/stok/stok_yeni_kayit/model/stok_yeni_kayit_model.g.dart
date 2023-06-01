// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'stok_yeni_kayit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokYeniKayitModel _$StokYeniKayitModelFromJson(Map<String, dynamic> json) =>
    StokYeniKayitModel()
      ..aciklama = json['ACIKLAMA'] as String?
      ..belgeNo = json['BELGE_NO'] as String?
      ..depoKodu = json['DEPO_KODU'] as int?
      ..fiyat = json['FIYAT'] as int?
      ..gc = json['GC'] as String?
      ..hareketTuru = json['HAREKET_TURU'] as String?
      ..miktar = json['MIKTAR'] as int?
      ..plasiyerKodu = json['PLASIYER_KODU'] as String?
      ..projeKodu = json['PROJE_KODU'] as String?
      ..stokKodu = json['STOK_KODU'] as String?
      ..tarih =
          json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String)
      ..yeniKayit = json['_YeniKayit'] as bool?;

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

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'cari_yeni_kayit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariYeniKayitModel _$CariYeniKayitModelFromJson(Map<String, dynamic> json) =>
    CariYeniKayitModel()
      ..aciklama = json['ACIKLAMA'] as String?
      ..alacak = (json['ALACAK'] as num?)?.toDouble()
      ..borc = (json['BORC'] as num?)?.toDouble()
      ..belgeNo = json['BELGE_NO'] as String?
      ..cariKodu = json['CARI_KODU'] as String?
      ..hareketKodu = json['HAREKET_KODU'] as String?
      ..plasiyerKodu = json['PLASIYER_KODU'] as String?
      ..projeKodu = json['PROJE_KODU'] as String?
      ..inckeyno = json['INCKEYNO'] as int?
      ..tarih =
          json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String)
      ..vadeTarihi = json['VADE_TARIHI'] == null
          ? null
          : DateTime.parse(json['VADE_TARIHI'] as String)
      ..yeniKayit = json['_YeniKayit'] as bool?;

Map<String, dynamic> _$CariYeniKayitModelToJson(CariYeniKayitModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('ALACAK', instance.alacak);
  writeNotNull('BORC', instance.borc);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('HAREKET_KODU', instance.hareketKodu);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('INCKEYNO', instance.inckeyno);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('VADE_TARIHI', instance.vadeTarihi?.toIso8601String());
  writeNotNull('_YeniKayit', instance.yeniKayit);
  return val;
}

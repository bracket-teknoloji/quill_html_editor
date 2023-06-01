// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'cari_yeni_kayit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariYeniKayitModel _$CariYeniKayitModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CariYeniKayitModel',
      json,
      ($checkedConvert) {
        final val = CariYeniKayitModel();
        $checkedConvert('ACIKLAMA', (v) => val.aciklama = v as String?);
        $checkedConvert('ALACAK', (v) => val.alacak = (v as num?)?.toDouble());
        $checkedConvert('BORC', (v) => val.borc = (v as num?)?.toDouble());
        $checkedConvert('BELGE_NO', (v) => val.belgeNo = v as String?);
        $checkedConvert('CARI_KODU', (v) => val.cariKodu = v as String?);
        $checkedConvert('HAREKET_KODU', (v) => val.hareketKodu = v as String?);
        $checkedConvert(
            'PLASIYER_KODU', (v) => val.plasiyerKodu = v as String?);
        $checkedConvert('PROJE_KODU', (v) => val.projeKodu = v as String?);
        $checkedConvert('INCKEYNO', (v) => val.inckeyno = v as int?);
        $checkedConvert('TARIH',
            (v) => val.tarih = v == null ? null : DateTime.parse(v as String));
        $checkedConvert(
            'VADE_TARIHI',
            (v) => val.vadeTarihi =
                v == null ? null : DateTime.parse(v as String));
        $checkedConvert('_YeniKayit', (v) => val.yeniKayit = v as bool?);
        return val;
      },
      fieldKeyMap: const {
        'aciklama': 'ACIKLAMA',
        'alacak': 'ALACAK',
        'borc': 'BORC',
        'belgeNo': 'BELGE_NO',
        'cariKodu': 'CARI_KODU',
        'hareketKodu': 'HAREKET_KODU',
        'plasiyerKodu': 'PLASIYER_KODU',
        'projeKodu': 'PROJE_KODU',
        'inckeyno': 'INCKEYNO',
        'tarih': 'TARIH',
        'vadeTarihi': 'VADE_TARIHI',
        'yeniKayit': '_YeniKayit'
      },
    );

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

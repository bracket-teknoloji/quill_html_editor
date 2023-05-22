// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'cari_save_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariSaveRequestModel _$CariSaveRequestModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'CariSaveRequestModel',
      json,
      ($checkedConvert) {
        final val = CariSaveRequestModel();
        $checkedConvert(
            'REQUEST_VERSION', (v) => val.requestVersion = v as int?);
        $checkedConvert('ISLEM_KODU', (v) => val.islemKodu = v as int?);
        $checkedConvert('_YeniKayit', (v) => val.yeniKayit = v as bool?);
        $checkedConvert('SAHIS_FIRMASI', (v) => val.sahisFirmasi = v as bool?);
        $checkedConvert('SUBE_KODU', (v) => val.subeKodu = v as int?);
        $checkedConvert('KODU', (v) => val.kodu = v as String?);
        $checkedConvert('TIPI', (v) => val.tipi = v as String?);
        $checkedConvert('ADI', (v) => val.adi = v as String?);
        $checkedConvert('ULKE_KODU', (v) => val.ulkeKodu = v as String?);
        $checkedConvert('SEHIR', (v) => val.sehir = v as String?);
        $checkedConvert('ILCE', (v) => val.ilce = v as String?);
        $checkedConvert('ADRES', (v) => val.adres = v as String?);
        $checkedConvert('TELEFON', (v) => val.telefon = v as String?);
        $checkedConvert('EPOSTA', (v) => val.eposta = v as String?);
        $checkedConvert('ENLEM', (v) => val.enlem = (v as num?)?.toDouble());
        $checkedConvert('BOYLAM', (v) => val.boylam = (v as num?)?.toDouble());
        $checkedConvert('POSTA_KODU', (v) => val.postaKodu = v as String?);
        $checkedConvert('WEBSITE', (v) => val.website = v as String?);
        $checkedConvert(
            'VERGI_DAIRESI', (v) => val.vergiDairesi = v as String?);
        $checkedConvert('VERGI_NO', (v) => val.vergiNo = v as String?);
        $checkedConvert(
            'PLASIYER_KODU', (v) => val.plasiyerKodu = v as String?);
        $checkedConvert('DOVIZLI', (v) => val.dovizli = v as bool?);
        $checkedConvert('DOVIZ_KODU', (v) => val.dovizKodu = v as int?);
        $checkedConvert('GRUP_KODU', (v) => val.grupKodu = v as String?);
        $checkedConvert('KOD1', (v) => val.kod1 = v as String?);
        $checkedConvert('KOD2', (v) => val.kod2 = v as String?);
        $checkedConvert('KOD3', (v) => val.kod3 = v as String?);
        $checkedConvert('KOD4', (v) => val.kod4 = v as String?);
        $checkedConvert('KOD5', (v) => val.kod5 = v as String?);
        $checkedConvert('BILGI', (v) => val.bilgi = v as String?);
        $checkedConvert('KILIT', (v) => val.kilit = v as String?);
        $checkedConvert('BAGLI_CARI', (v) => val.bagliCari = v as String?);
        $checkedConvert('KOSUL_KODU', (v) => val.kosulKodu = v as String?);
        $checkedConvert(
            'MUHASEBE_KODU', (v) => val.muhasebeKodu = v as String?);
        $checkedConvert(
            'KURFARKIBORC_KODU', (v) => val.kurfarkiborcKodu = v as String?);
        $checkedConvert('KURFARKIALACAK_KODU',
            (v) => val.kurfarkialacakKodu = v as String?);
        $checkedConvert('VADE_GUNU', (v) => val.vadeGunu = v as int?);
        $checkedConvert('ODEME_TIPI', (v) => val.odemeTipi = v as String?);
        $checkedConvert('MUHTELIF_CARI', (v) => val.muhtelifCari = v as bool?);
        $checkedConvert(
            'MUHTELIF_BELGE_TIPI', (v) => val.muhtelifBelgeTipi = v as String?);
        $checkedConvert(
            'MUHTELIF_BELGE_NO', (v) => val.muhtelifBelgeNo = v as String?);
        $checkedConvert(
            'EFATURA_SENARYO', (v) => val.efaturaSenaryo = v as String?);
        $checkedConvert('KULL1S', (v) => val.kull1s = v as String?);
        $checkedConvert('KULL2S', (v) => val.kull2s = v as String?);
        $checkedConvert('KULL3S', (v) => val.kull3s = v as String?);
        $checkedConvert('KULL4S', (v) => val.kull4s = v as String?);
        $checkedConvert('KULL5S', (v) => val.kull5s = v as String?);
        $checkedConvert('KULL6S', (v) => val.kull6s = v as String?);
        $checkedConvert('KULL7S', (v) => val.kull7s = v as String?);
        $checkedConvert('KULL8S', (v) => val.kull8s = v as String?);
        $checkedConvert('KULL1N', (v) => val.kull1n = (v as num?)?.toDouble());
        $checkedConvert('KULL2N', (v) => val.kull2n = (v as num?)?.toDouble());
        $checkedConvert('KULL3N', (v) => val.kull3n = (v as num?)?.toDouble());
        $checkedConvert('KULL4N', (v) => val.kull4n = (v as num?)?.toDouble());
        $checkedConvert('KULL5N', (v) => val.kull5n = (v as num?)?.toDouble());
        $checkedConvert('KULL6N', (v) => val.kull6n = (v as num?)?.toDouble());
        $checkedConvert('KULL7N', (v) => val.kull7n = (v as num?)?.toDouble());
        $checkedConvert('KULL8N', (v) => val.kull8n = (v as num?)?.toDouble());
        $checkedConvert('ACIKLAMA1', (v) => val.aciklama1 = v as String?);
        $checkedConvert('ACIKLAMA2', (v) => val.aciklama2 = v as String?);
        $checkedConvert('ACIKLAMA3', (v) => val.aciklama3 = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'requestVersion': 'REQUEST_VERSION',
        'islemKodu': 'ISLEM_KODU',
        'yeniKayit': '_YeniKayit',
        'sahisFirmasi': 'SAHIS_FIRMASI',
        'subeKodu': 'SUBE_KODU',
        'kodu': 'KODU',
        'tipi': 'TIPI',
        'adi': 'ADI',
        'ulkeKodu': 'ULKE_KODU',
        'sehir': 'SEHIR',
        'ilce': 'ILCE',
        'adres': 'ADRES',
        'telefon': 'TELEFON',
        'eposta': 'EPOSTA',
        'enlem': 'ENLEM',
        'boylam': 'BOYLAM',
        'postaKodu': 'POSTA_KODU',
        'website': 'WEBSITE',
        'vergiDairesi': 'VERGI_DAIRESI',
        'vergiNo': 'VERGI_NO',
        'plasiyerKodu': 'PLASIYER_KODU',
        'dovizli': 'DOVIZLI',
        'dovizKodu': 'DOVIZ_KODU',
        'grupKodu': 'GRUP_KODU',
        'kod1': 'KOD1',
        'kod2': 'KOD2',
        'kod3': 'KOD3',
        'kod4': 'KOD4',
        'kod5': 'KOD5',
        'bilgi': 'BILGI',
        'kilit': 'KILIT',
        'bagliCari': 'BAGLI_CARI',
        'kosulKodu': 'KOSUL_KODU',
        'muhasebeKodu': 'MUHASEBE_KODU',
        'kurfarkiborcKodu': 'KURFARKIBORC_KODU',
        'kurfarkialacakKodu': 'KURFARKIALACAK_KODU',
        'vadeGunu': 'VADE_GUNU',
        'odemeTipi': 'ODEME_TIPI',
        'muhtelifCari': 'MUHTELIF_CARI',
        'muhtelifBelgeTipi': 'MUHTELIF_BELGE_TIPI',
        'muhtelifBelgeNo': 'MUHTELIF_BELGE_NO',
        'efaturaSenaryo': 'EFATURA_SENARYO',
        'kull1s': 'KULL1S',
        'kull2s': 'KULL2S',
        'kull3s': 'KULL3S',
        'kull4s': 'KULL4S',
        'kull5s': 'KULL5S',
        'kull6s': 'KULL6S',
        'kull7s': 'KULL7S',
        'kull8s': 'KULL8S',
        'kull1n': 'KULL1N',
        'kull2n': 'KULL2N',
        'kull3n': 'KULL3N',
        'kull4n': 'KULL4N',
        'kull5n': 'KULL5N',
        'kull6n': 'KULL6N',
        'kull7n': 'KULL7N',
        'kull8n': 'KULL8N',
        'aciklama1': 'ACIKLAMA1',
        'aciklama2': 'ACIKLAMA2',
        'aciklama3': 'ACIKLAMA3'
      },
    );

Map<String, dynamic> _$CariSaveRequestModelToJson(
        CariSaveRequestModel instance) =>
    <String, dynamic>{
      'REQUEST_VERSION': instance.requestVersion,
      'ISLEM_KODU': instance.islemKodu,
      '_YeniKayit': instance.yeniKayit,
      'SAHIS_FIRMASI': instance.sahisFirmasi,
      'SUBE_KODU': instance.subeKodu,
      'KODU': instance.kodu,
      'TIPI': instance.tipi,
      'ADI': instance.adi,
      'ULKE_KODU': instance.ulkeKodu,
      'SEHIR': instance.sehir,
      'ILCE': instance.ilce,
      'ADRES': instance.adres,
      'TELEFON': instance.telefon,
      'EPOSTA': instance.eposta,
      'ENLEM': instance.enlem,
      'BOYLAM': instance.boylam,
      'POSTA_KODU': instance.postaKodu,
      'WEBSITE': instance.website,
      'VERGI_DAIRESI': instance.vergiDairesi,
      'VERGI_NO': instance.vergiNo,
      'PLASIYER_KODU': instance.plasiyerKodu,
      'DOVIZLI': instance.dovizli,
      'DOVIZ_KODU': instance.dovizKodu,
      'GRUP_KODU': instance.grupKodu,
      'KOD1': instance.kod1,
      'KOD2': instance.kod2,
      'KOD3': instance.kod3,
      'KOD4': instance.kod4,
      'KOD5': instance.kod5,
      'BILGI': instance.bilgi,
      'KILIT': instance.kilit,
      'BAGLI_CARI': instance.bagliCari,
      'KOSUL_KODU': instance.kosulKodu,
      'MUHASEBE_KODU': instance.muhasebeKodu,
      'KURFARKIBORC_KODU': instance.kurfarkiborcKodu,
      'KURFARKIALACAK_KODU': instance.kurfarkialacakKodu,
      'VADE_GUNU': instance.vadeGunu,
      'ODEME_TIPI': instance.odemeTipi,
      'MUHTELIF_CARI': instance.muhtelifCari,
      'MUHTELIF_BELGE_TIPI': instance.muhtelifBelgeTipi,
      'MUHTELIF_BELGE_NO': instance.muhtelifBelgeNo,
      'EFATURA_SENARYO': instance.efaturaSenaryo,
      'KULL1S': instance.kull1s,
      'KULL2S': instance.kull2s,
      'KULL3S': instance.kull3s,
      'KULL4S': instance.kull4s,
      'KULL5S': instance.kull5s,
      'KULL6S': instance.kull6s,
      'KULL7S': instance.kull7s,
      'KULL8S': instance.kull8s,
      'KULL1N': instance.kull1n,
      'KULL2N': instance.kull2n,
      'KULL3N': instance.kull3n,
      'KULL4N': instance.kull4n,
      'KULL5N': instance.kull5n,
      'KULL6N': instance.kull6n,
      'KULL7N': instance.kull7n,
      'KULL8N': instance.kull8n,
      'ACIKLAMA1': instance.aciklama1,
      'ACIKLAMA2': instance.aciklama2,
      'ACIKLAMA3': instance.aciklama3,
    };

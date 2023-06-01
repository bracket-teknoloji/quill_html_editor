// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'cari_save_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariSaveRequestModel _$CariSaveRequestModelFromJson(
        Map<String, dynamic> json) =>
    CariSaveRequestModel()
      ..requestVersion = json['REQUEST_VERSION'] as int?
      ..islemKodu = json['ISLEM_KODU'] as int?
      ..yeniKayit = json['_YeniKayit'] as bool?
      ..sahisFirmasi = json['SAHIS_FIRMASI'] as bool?
      ..subeKodu = json['SUBE_KODU'] as int?
      ..kodu = json['KODU'] as String?
      ..tipi = json['TIPI'] as String?
      ..adi = json['ADI'] as String?
      ..ulkeKodu = json['ULKE_KODU'] as String?
      ..sehir = json['SEHIR'] as String?
      ..ilce = json['ILCE'] as String?
      ..adres = json['ADRES'] as String?
      ..telefon = json['TELEFON'] as String?
      ..eposta = json['EPOSTA'] as String?
      ..enlem = (json['ENLEM'] as num?)?.toDouble()
      ..boylam = (json['BOYLAM'] as num?)?.toDouble()
      ..postaKodu = json['POSTA_KODU'] as String?
      ..website = json['WEBSITE'] as String?
      ..vergiDairesi = json['VERGI_DAIRESI'] as String?
      ..vergiNo = json['VERGI_NO'] as String?
      ..plasiyerKodu = json['PLASIYER_KODU'] as String?
      ..dovizli = json['DOVIZLI'] as bool?
      ..dovizKodu = json['DOVIZ_KODU'] as int?
      ..grupKodu = json['GRUP_KODU'] as String?
      ..kod1 = json['KOD1'] as String?
      ..kod2 = json['KOD2'] as String?
      ..kod3 = json['KOD3'] as String?
      ..kod4 = json['KOD4'] as String?
      ..kod5 = json['KOD5'] as String?
      ..bilgi = json['BILGI'] as String?
      ..kilit = json['KILIT'] as String?
      ..bagliCari = json['BAGLI_CARI'] as String?
      ..kosulKodu = json['KOSUL_KODU'] as String?
      ..muhasebeKodu = json['MUHASEBE_KODU'] as String?
      ..kurfarkiborcKodu = json['KURFARKIBORC_KODU'] as String?
      ..kurfarkialacakKodu = json['KURFARKIALACAK_KODU'] as String?
      ..vadeGunu = json['VADE_GUNU'] as int?
      ..odemeTipi = json['ODEME_TIPI'] as String?
      ..muhtelifCari = json['MUHTELIF_CARI'] as bool?
      ..muhtelifBelgeTipi = json['MUHTELIF_BELGE_TIPI'] as String?
      ..muhtelifBelgeNo = json['MUHTELIF_BELGE_NO'] as String?
      ..efaturaSenaryo = json['EFATURA_SENARYO'] as String?
      ..kull1s = json['KULL1S'] as String?
      ..kull2s = json['KULL2S'] as String?
      ..kull3s = json['KULL3S'] as String?
      ..kull4s = json['KULL4S'] as String?
      ..kull5s = json['KULL5S'] as String?
      ..kull6s = json['KULL6S'] as String?
      ..kull7s = json['KULL7S'] as String?
      ..kull8s = json['KULL8S'] as String?
      ..kull1n = (json['KULL1N'] as num?)?.toDouble()
      ..kull2n = (json['KULL2N'] as num?)?.toDouble()
      ..kull3n = (json['KULL3N'] as num?)?.toDouble()
      ..kull4n = (json['KULL4N'] as num?)?.toDouble()
      ..kull5n = (json['KULL5N'] as num?)?.toDouble()
      ..kull6n = (json['KULL6N'] as num?)?.toDouble()
      ..kull7n = (json['KULL7N'] as num?)?.toDouble()
      ..kull8n = (json['KULL8N'] as num?)?.toDouble()
      ..aciklama1 = json['ACIKLAMA1'] as String?
      ..aciklama2 = json['ACIKLAMA2'] as String?
      ..aciklama3 = json['ACIKLAMA3'] as String?;

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

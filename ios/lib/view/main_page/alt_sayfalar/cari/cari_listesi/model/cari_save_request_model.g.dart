// GENERATED CODE - DO NOT MODIFY BY HAND

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
    CariSaveRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('REQUEST_VERSION', instance.requestVersion);
  writeNotNull('ISLEM_KODU', instance.islemKodu);
  writeNotNull('_YeniKayit', instance.yeniKayit);
  writeNotNull('SAHIS_FIRMASI', instance.sahisFirmasi);
  writeNotNull('SUBE_KODU', instance.subeKodu);
  writeNotNull('KODU', instance.kodu);
  writeNotNull('TIPI', instance.tipi);
  writeNotNull('ADI', instance.adi);
  writeNotNull('ULKE_KODU', instance.ulkeKodu);
  writeNotNull('SEHIR', instance.sehir);
  writeNotNull('ILCE', instance.ilce);
  writeNotNull('ADRES', instance.adres);
  writeNotNull('TELEFON', instance.telefon);
  writeNotNull('EPOSTA', instance.eposta);
  writeNotNull('ENLEM', instance.enlem);
  writeNotNull('BOYLAM', instance.boylam);
  writeNotNull('POSTA_KODU', instance.postaKodu);
  writeNotNull('WEBSITE', instance.website);
  writeNotNull('VERGI_DAIRESI', instance.vergiDairesi);
  writeNotNull('VERGI_NO', instance.vergiNo);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('DOVIZLI', instance.dovizli);
  writeNotNull('DOVIZ_KODU', instance.dovizKodu);
  writeNotNull('GRUP_KODU', instance.grupKodu);
  writeNotNull('KOD1', instance.kod1);
  writeNotNull('KOD2', instance.kod2);
  writeNotNull('KOD3', instance.kod3);
  writeNotNull('KOD4', instance.kod4);
  writeNotNull('KOD5', instance.kod5);
  writeNotNull('BILGI', instance.bilgi);
  writeNotNull('KILIT', instance.kilit);
  writeNotNull('BAGLI_CARI', instance.bagliCari);
  writeNotNull('KOSUL_KODU', instance.kosulKodu);
  writeNotNull('MUHASEBE_KODU', instance.muhasebeKodu);
  writeNotNull('KURFARKIBORC_KODU', instance.kurfarkiborcKodu);
  writeNotNull('KURFARKIALACAK_KODU', instance.kurfarkialacakKodu);
  writeNotNull('VADE_GUNU', instance.vadeGunu);
  writeNotNull('ODEME_TIPI', instance.odemeTipi);
  writeNotNull('MUHTELIF_CARI', instance.muhtelifCari);
  writeNotNull('MUHTELIF_BELGE_TIPI', instance.muhtelifBelgeTipi);
  writeNotNull('MUHTELIF_BELGE_NO', instance.muhtelifBelgeNo);
  writeNotNull('EFATURA_SENARYO', instance.efaturaSenaryo);
  writeNotNull('KULL1S', instance.kull1s);
  writeNotNull('KULL2S', instance.kull2s);
  writeNotNull('KULL3S', instance.kull3s);
  writeNotNull('KULL4S', instance.kull4s);
  writeNotNull('KULL5S', instance.kull5s);
  writeNotNull('KULL6S', instance.kull6s);
  writeNotNull('KULL7S', instance.kull7s);
  writeNotNull('KULL8S', instance.kull8s);
  writeNotNull('KULL1N', instance.kull1n);
  writeNotNull('KULL2N', instance.kull2n);
  writeNotNull('KULL3N', instance.kull3n);
  writeNotNull('KULL4N', instance.kull4n);
  writeNotNull('KULL5N', instance.kull5n);
  writeNotNull('KULL6N', instance.kull6n);
  writeNotNull('KULL7N', instance.kull7n);
  writeNotNull('KULL8N', instance.kull8n);
  writeNotNull('ACIKLAMA1', instance.aciklama1);
  writeNotNull('ACIKLAMA2', instance.aciklama2);
  writeNotNull('ACIKLAMA3', instance.aciklama3);
  return val;
}

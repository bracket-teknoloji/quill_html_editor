// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariListesiModel _$CariListesiModelFromJson(Map<String, dynamic> json) =>
    CariListesiModel()
      ..cariKodu = json['CARI_KODU'] as String?
      ..cariAdi = json['CARI_ADI'] as String?
      ..bagliCari = json['BAGLI_CARI'] as String?
      ..bagliCariAdi = json['BAGLI_CARI_ADI'] as String?
      ..cariTip = json['CARI_TIP'] as String?
      ..cariTipAciklama = json['CARI_TIP_ACIKLAMA'] as String?
      ..kilit = json['KILIT'] as String?
      ..vadeGunu = json['VADE_GUNU'] as int?
      ..odemeTipi = json['ODEME_TIPI'] as String?
      ..hesaptutmasekli = json['HESAPTUTMASEKLI'] as String?
      ..plasiyerKodu = json['PLASIYER_KODU'] as String?
      ..plasiyerAciklama = json['PLASIYER_ACIKLAMA'] as String?
      ..borcToplami = (json['BORC_TOPLAMI'] as num?)?.toDouble()
      ..alacakToplami = (json['ALACAK_TOPLAMI'] as num?)?.toDouble()
      ..genisk1Orani = json['GENISK1_ORANI'] as int?
      ..ulkeKodu = json['ULKE_KODU'] as String?
      ..ulkeAdi = json['ULKE_ADI'] as String?
      ..cariIl = json['CARI_IL'] as String?
      ..cariIlce = json['CARI_ILCE'] as String?
      ..cariTel = json['CARI_TEL'] as String?
      ..postakodu = json['POSTAKODU'] as String?
      ..email = json['EMAIL'] as String?
      ..web = json['WEB'] as String?
      ..cariAdres = json['CARI_ADRES'] as String?
      ..vergiDairesi = json['VERGI_DAIRESI'] as String?
      ..vergiNumarasi = json['VERGI_NUMARASI'] as String?
      ..grupKodu = json['GRUP_KODU'] as String?
      ..grupTanimi = json['GRUP_TANIMI'] as String?
      ..bilgi = json['BILGI'] as String?
      ..aciklama1 = json['ACIKLAMA1'] as String?
      ..aciklama2 = json['ACIKLAMA2'] as String?
      ..aciklama3 = json['ACIKLAMA3'] as String?
      ..kodu = json['KODU'] as String?
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
      ..kayityapankul = json['KAYITYAPANKUL'] as String?
      ..kayittarihi = json['KAYITTARIHI'] as String?
      ..duzeltmeyapankul = json['DUZELTMEYAPANKUL'] as String?
      ..duzeltmetarihi = json['DUZELTMETARIHI'] as String?
      ..efaturaMi = json['EFATURA_MI'] as bool?
      ..efaturaTipi = json['EFATURA_TIPI'] as String?
      ..efatGecisTarihi = json['EFAT_GECIS_TARIHI'] as String?
      ..efatAktif = json['EFAT_AKTIF'] as bool?
      ..riskTakibi = json['RISK_TAKIBI'] as String?
      ..efaturaCarisi = json['EFATURA_CARISI'] as String?
      ..bakiye = (json['BAKIYE'] as num?)?.toDouble()
      ..enlem = (json['ENLEM'] as num?)?.toDouble()
      ..boylam = (json['BOYLAM'] as num?)?.toDouble()
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
      ..fax = json['FAX'] as String?
      ..sahisFirmasiMi = json['SAHIS_FIRMASI_MI'] as bool?
      ..dovizli = json['DOVIZLI'] as bool?
      ..dovizKodu = json['DOVIZ_KODU'] as int?
      ..dovizAdi = json['DOVIZ_ADI'] as String?
      ..subeKodu = json['SUBE_KODU'] as int?
      ..kosulKodu = json['KOSUL_KODU'] as String?
      ..fiyatGrubu = json['FIYAT_GRUBU'] as String?;

Map<String, dynamic> _$CariListesiModelToJson(CariListesiModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('BAGLI_CARI', instance.bagliCari);
  writeNotNull('BAGLI_CARI_ADI', instance.bagliCariAdi);
  writeNotNull('CARI_TIP', instance.cariTip);
  writeNotNull('CARI_TIP_ACIKLAMA', instance.cariTipAciklama);
  writeNotNull('KILIT', instance.kilit);
  writeNotNull('VADE_GUNU', instance.vadeGunu);
  writeNotNull('ODEME_TIPI', instance.odemeTipi);
  writeNotNull('HESAPTUTMASEKLI', instance.hesaptutmasekli);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('PLASIYER_ACIKLAMA', instance.plasiyerAciklama);
  writeNotNull('BORC_TOPLAMI', instance.borcToplami);
  writeNotNull('ALACAK_TOPLAMI', instance.alacakToplami);
  writeNotNull('GENISK1_ORANI', instance.genisk1Orani);
  writeNotNull('ULKE_KODU', instance.ulkeKodu);
  writeNotNull('ULKE_ADI', instance.ulkeAdi);
  writeNotNull('CARI_IL', instance.cariIl);
  writeNotNull('CARI_ILCE', instance.cariIlce);
  writeNotNull('CARI_TEL', instance.cariTel);
  writeNotNull('POSTAKODU', instance.postakodu);
  writeNotNull('EMAIL', instance.email);
  writeNotNull('WEB', instance.web);
  writeNotNull('CARI_ADRES', instance.cariAdres);
  writeNotNull('VERGI_DAIRESI', instance.vergiDairesi);
  writeNotNull('VERGI_NUMARASI', instance.vergiNumarasi);
  writeNotNull('GRUP_KODU', instance.grupKodu);
  writeNotNull('GRUP_TANIMI', instance.grupTanimi);
  writeNotNull('BILGI', instance.bilgi);
  writeNotNull('ACIKLAMA1', instance.aciklama1);
  writeNotNull('ACIKLAMA2', instance.aciklama2);
  writeNotNull('ACIKLAMA3', instance.aciklama3);
  writeNotNull('KODU', instance.kodu);
  writeNotNull('KOD1', instance.kod1);
  writeNotNull('KOD1_TANIMI', instance.kod1Tanimi);
  writeNotNull('KOD2', instance.kod2);
  writeNotNull('KOD2_TANIMI', instance.kod2Tanimi);
  writeNotNull('KOD3', instance.kod3);
  writeNotNull('KOD3_TANIMI', instance.kod3Tanimi);
  writeNotNull('KOD4', instance.kod4);
  writeNotNull('KOD4_TANIMI', instance.kod4Tanimi);
  writeNotNull('KOD5', instance.kod5);
  writeNotNull('KOD5_TANIMI', instance.kod5Tanimi);
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('KAYITTARIHI', instance.kayittarihi);
  writeNotNull('DUZELTMEYAPANKUL', instance.duzeltmeyapankul);
  writeNotNull('DUZELTMETARIHI', instance.duzeltmetarihi);
  writeNotNull('EFATURA_MI', instance.efaturaMi);
  writeNotNull('EFATURA_TIPI', instance.efaturaTipi);
  writeNotNull('EFAT_GECIS_TARIHI', instance.efatGecisTarihi);
  writeNotNull('EFAT_AKTIF', instance.efatAktif);
  writeNotNull('RISK_TAKIBI', instance.riskTakibi);
  writeNotNull('EFATURA_CARISI', instance.efaturaCarisi);
  writeNotNull('BAKIYE', instance.bakiye);
  writeNotNull('ENLEM', instance.enlem);
  writeNotNull('BOYLAM', instance.boylam);
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
  writeNotNull('FAX', instance.fax);
  writeNotNull('SAHIS_FIRMASI_MI', instance.sahisFirmasiMi);
  writeNotNull('DOVIZLI', instance.dovizli);
  writeNotNull('DOVIZ_KODU', instance.dovizKodu);
  writeNotNull('DOVIZ_ADI', instance.dovizAdi);
  writeNotNull('SUBE_KODU', instance.subeKodu);
  writeNotNull('KOSUL_KODU', instance.kosulKodu);
  writeNotNull('FIYAT_GRUBU', instance.fiyatGrubu);
  return val;
}

BakiyeModel _$BakiyeModelFromJson(Map<String, dynamic> json) => BakiyeModel()
  ..cariKodu = json['CARI_KODU'] as String?
  ..dovizTipi = json['DOVIZ_TIPI'] as int?
  ..borcToplami = (json['BORC_TOPLAMI'] as num?)?.toDouble()
  ..alacakToplami = json['ALACAK_TOPLAMI'] as int?
  ..bakiye = (json['BAKIYE'] as num?)?.toDouble()
  ..dovizAdi = json['DOVIZ_ADI'] as String?;

Map<String, dynamic> _$BakiyeModelToJson(BakiyeModel instance) =>
    <String, dynamic>{
      'CARI_KODU': instance.cariKodu,
      'DOVIZ_TIPI': instance.dovizTipi,
      'BORC_TOPLAMI': instance.borcToplami,
      'ALACAK_TOPLAMI': instance.alacakToplami,
      'BAKIYE': instance.bakiye,
      'DOVIZ_ADI': instance.dovizAdi,
    };

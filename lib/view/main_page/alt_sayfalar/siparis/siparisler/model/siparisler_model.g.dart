// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siparisler_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiparislerModel _$SiparislerModelFromJson(Map<String, dynamic> json) => SiparislerModel()
  ..islemId = json['ISLEM_ID'] as String?
  ..tempKayitTipi = json['TEMP_KAYIT_TIPI'] as int?
  ..tempBelgeId = json['TEMP_BELGE_ID'] as int?
  ..tempBelgeMi = json['TEMP_BELGE_MI'] as bool?
  ..remoteTempBelge = json['REMOTE_TEMP_BELGE'] as bool?
  ..remoteTempBelgeEtiketi = json['REMOTE_TEMP_BELGE_ETIKETI'] as String?
  ..tempJsonData = json['TEMP_JSON_DATA'] as String?
  ..tempSipList = json['TEMP_SIP_LIST'] as List<dynamic>?
  ..kalemList = (json['KALEM_LIST'] as List<dynamic>?)?.map((e) => KalemListModel.fromJson(e as Map<String, dynamic>)).toList()
  ..tarih = json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String)
  ..teslimTarihi = json['TESLIM_TARIHI'] == null ? null : DateTime.parse(json['TESLIM_TARIHI'] as String)
  ..istenilenTeslimTarihi = json['ISTENILEN_TESLIM_TARIHI'] == null ? null : DateTime.parse(json['ISTENILEN_TESLIM_TARIHI'] as String)
  ..belgeNo = json['BELGE_NO'] as String?
  ..belgeTuru = json['BELGE_TURU'] as String?
  ..belgeKodu = json['BELGE_KODU'] as String?
  ..kalemAdedi = json['KALEM_ADEDI'] as int?
  ..cariKodu = json['CARI_KODU'] as String?
  ..cariAdi = json['CARI_ADI'] as String?
  ..tipi = json['TIPI'] as int?
  ..vadeGunu = json['VADE_GUNU'] as int?
  ..vadeTarihi = json['VADE_TARIHI'] == null ? null : DateTime.parse(json['VADE_TARIHI'] as String)
  ..projeKodu = json['PROJE_KODU'] as String?
  ..projeAciklama = json['PROJE_ACIKLAMA'] as String?
  ..kdvDahil = json['KDV_DAHIL'] as String?
  ..ozelKod1 = json['OZEL_KOD1'] as String?
  ..ozelKod2 = json['OZEL_KOD2'] as String?
  ..kosulKodu = json['KOSUL_KODU'] as String?
  ..kayityapankul = json['KAYITYAPANKUL'] as String?
  ..kayittarihi = json['KAYITTARIHI'] == null ? null : DateTime.parse(json['KAYITTARIHI'] as String)
  ..kdv = (json['KDV'] as num?)?.toDouble()
  ..genelToplam = (json['GENEL_TOPLAM'] as num?)?.toDouble()
  ..plasiyerKodu = json['PLASIYER_KODU'] as String?
  ..plasiyerAciklama = json['PLASIYER_ACIKLAMA'] as String?
  ..kosulTarihi = json['KOSUL_TARIHI'] == null ? null : DateTime.parse(json['KOSUL_TARIHI'] as String)
  ..irsaliyelesti = json['IRSALIYELESTI'] as String?
  ..irslesenSayi = json['IRSLESEN_SAYI'] as int?
  ..faturalasti = json['FATURALASTI'] as String?
  ..cYedek6 = json['C_YEDEK6'] as String?
  ..topluDepo = json['TOPLU_DEPO'] as int?
  ..dovizTipi = json['DOVIZ_TIPI'] as int?
  ..dovizAdi = json['DOVIZ_ADI'] as String?
  ..kapatilmis = json['KAPATILMIS'] as String?
  ..aciklama = json['ACIKLAMA'] as String?
  ..acik4 = json['ACIK4'] as String?
  ..acik10 = json['ACIK10'] as String?
  ..dovizTutari = (json['DOVIZ_TUTARI'] as num?)?.toDouble()
  ..teslimCari = json['TESLIM_CARI'] as String?
  ..teslimCariAdi = json['TESLIM_CARI_ADI'] as String?
  ..duzeltmeyapankul = json['DUZELTMEYAPANKUL'] as String?
  ..duzeltmetarihi = json['DUZELTMETARIHI'] == null ? null : DateTime.parse(json['DUZELTMETARIHI'] as String)
  ..odemeKodu = json['ODEME_KODU'] as String?
  ..fYedek4 = (json['F_YEDEK4'] as num?)?.toDouble()
  ..acik12 = json['ACIK12'] as String?;

Map<String, dynamic> _$SiparislerModelToJson(SiparislerModel instance) => <String, dynamic>{
      'ISLEM_ID': instance.islemId,
      'TEMP_KAYIT_TIPI': instance.tempKayitTipi,
      'TEMP_BELGE_ID': instance.tempBelgeId,
      'TEMP_BELGE_MI': instance.tempBelgeMi,
      'REMOTE_TEMP_BELGE': instance.remoteTempBelge,
      'REMOTE_TEMP_BELGE_ETIKETI': instance.remoteTempBelgeEtiketi,
      'TEMP_JSON_DATA': instance.tempJsonData,
      'TEMP_SIP_LIST': instance.tempSipList,
      'KALEM_LIST': instance.kalemList?.map((e) => e.toJson()).toList(),
      'TARIH': instance.tarih?.toIso8601String(),
      'TESLIM_TARIHI': instance.teslimTarihi?.toIso8601String(),
      'ISTENILEN_TESLIM_TARIHI': instance.istenilenTeslimTarihi?.toIso8601String(),
      'BELGE_NO': instance.belgeNo,
      'BELGE_TURU': instance.belgeTuru,
      'BELGE_KODU': instance.belgeKodu,
      'KALEM_ADEDI': instance.kalemAdedi,
      'CARI_KODU': instance.cariKodu,
      'CARI_ADI': instance.cariAdi,
      'TIPI': instance.tipi,
      'VADE_GUNU': instance.vadeGunu,
      'VADE_TARIHI': instance.vadeTarihi?.toIso8601String(),
      'PROJE_KODU': instance.projeKodu,
      'PROJE_ACIKLAMA': instance.projeAciklama,
      'KDV_DAHIL': instance.kdvDahil,
      'OZEL_KOD1': instance.ozelKod1,
      'OZEL_KOD2': instance.ozelKod2,
      'KOSUL_KODU': instance.kosulKodu,
      'KAYITYAPANKUL': instance.kayityapankul,
      'KAYITTARIHI': instance.kayittarihi?.toIso8601String(),
      'KDV': instance.kdv,
      'GENEL_TOPLAM': instance.genelToplam,
      'PLASIYER_KODU': instance.plasiyerKodu,
      'PLASIYER_ACIKLAMA': instance.plasiyerAciklama,
      'KOSUL_TARIHI': instance.kosulTarihi?.toIso8601String(),
      'IRSALIYELESTI': instance.irsaliyelesti,
      'IRSLESEN_SAYI': instance.irslesenSayi,
      'FATURALASTI': instance.faturalasti,
      'C_YEDEK6': instance.cYedek6,
      'TOPLU_DEPO': instance.topluDepo,
      'DOVIZ_TIPI': instance.dovizTipi,
      'DOVIZ_ADI': instance.dovizAdi,
      'KAPATILMIS': instance.kapatilmis,
      'ACIKLAMA': instance.aciklama,
      'ACIK4': instance.acik4,
      'ACIK10': instance.acik10,
      'DOVIZ_TUTARI': instance.dovizTutari,
      'TESLIM_CARI': instance.teslimCari,
      'TESLIM_CARI_ADI': instance.teslimCariAdi,
      'DUZELTMEYAPANKUL': instance.duzeltmeyapankul,
      'DUZELTMETARIHI': instance.duzeltmetarihi?.toIso8601String(),
      'ODEME_KODU': instance.odemeKodu,
      'F_YEDEK4': instance.fYedek4,
      'ACIK12': instance.acik12,
    };

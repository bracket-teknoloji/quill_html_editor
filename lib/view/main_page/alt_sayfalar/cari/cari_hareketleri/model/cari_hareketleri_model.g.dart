// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_hareketleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariHareketleriModel _$CariHareketleriModelFromJson(
        Map<String, dynamic> json) =>
    CariHareketleriModel()
      ..inckeyno = json['INCKEYNO'] as int?
      ..cariKodu = json['CARI_KODU'] as String?
      ..cariAdi = json['CARI_ADI'] as String?
      ..tarih =
          json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String)
      ..aciklama = json['ACIKLAMA'] as String?
      ..borc = (json['BORC'] as num?)?.toDouble()
      ..hareketAciklama = json['HAREKET_ACIKLAMA'] as String?
      ..hareketKodu = json['HAREKET_KODU'] as String?
      ..belgeNo = json['BELGE_NO'] as String?
      ..plasiyerKodu = json['PLASIYER_KODU'] as String?
      ..plasiyerAciklama = json['PLASIYER_ACIKLAMA'] as String?
      ..yuruyenBakiye = (json['YURUYEN_BAKIYE'] as num?)?.toDouble()
      ..dovYuruyenBakiye = (json['DOV_YURUYEN_BAKIYE'] as num?)?.toDouble()
      ..projeKodu = json['PROJE_KODU'] as String?
      ..projeAciklama = json['PROJE_ACIKLAMA'] as String?
      ..dovizBorc = (json['DOVIZ_BORC'] as num?)?.toDouble()
      ..dovizTuru = json['DOVIZ_TURU'] as int?
      ..dovizAdi = json['DOVIZ_ADI'] as String?
      ..refkey = json['REFKEY'] as String?
      ..vadeTarihi = json['VADE_TARIHI'] == null
          ? null
          : DateTime.parse(json['VADE_TARIHI'] as String)
      ..belgeTipi = json['BELGE_TIPI'] as String?
      ..alacak = (json['ALACAK'] as num?)?.toDouble()
      ..bordroMu = json['BORDRO_MU'] as bool?
      ..dovizAlacak = (json['DOVIZ_ALACAK'] as num?)?.toDouble()
      ..subeKodu = json['SUBE_KODU'] as int?;

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
      'DOV_YURUYEN_BAKIYE': instance.dovYuruyenBakiye,
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

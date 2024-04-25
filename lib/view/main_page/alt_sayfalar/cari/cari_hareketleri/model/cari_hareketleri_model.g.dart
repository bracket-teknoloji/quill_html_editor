// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_hareketleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariHareketleriModel _$CariHareketleriModelFromJson(
        Map<String, dynamic> json) =>
    CariHareketleriModel()
      ..inckeyno = (json['INCKEYNO'] as num?)?.toInt()
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
      ..dovizTuru = (json['DOVIZ_TURU'] as num?)?.toInt()
      ..dovizAdi = json['DOVIZ_ADI'] as String?
      ..refkey = json['REFKEY'] as String?
      ..vadeTarihi = json['VADE_TARIHI'] == null
          ? null
          : DateTime.parse(json['VADE_TARIHI'] as String)
      ..belgeTipi = json['BELGE_TIPI'] as String?
      ..alacak = (json['ALACAK'] as num?)?.toDouble()
      ..bordroMu = json['BORDRO_MU'] as bool?
      ..dovizAlacak = (json['DOVIZ_ALACAK'] as num?)?.toDouble()
      ..subeKodu = (json['SUBE_KODU'] as num?)?.toInt()
      ..ebelgeTuru = json['EBELGE_TURU'] as String?
      ..resmiBelgeNo = json['RESMI_BELGE_NO'] as String?;

Map<String, dynamic> _$CariHareketleriModelToJson(
    CariHareketleriModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('INCKEYNO', instance.inckeyno);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('BORC', instance.borc);
  writeNotNull('HAREKET_ACIKLAMA', instance.hareketAciklama);
  writeNotNull('HAREKET_KODU', instance.hareketKodu);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('PLASIYER_ACIKLAMA', instance.plasiyerAciklama);
  writeNotNull('YURUYEN_BAKIYE', instance.yuruyenBakiye);
  writeNotNull('DOV_YURUYEN_BAKIYE', instance.dovYuruyenBakiye);
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('PROJE_ACIKLAMA', instance.projeAciklama);
  writeNotNull('DOVIZ_BORC', instance.dovizBorc);
  writeNotNull('DOVIZ_TURU', instance.dovizTuru);
  writeNotNull('DOVIZ_ADI', instance.dovizAdi);
  writeNotNull('REFKEY', instance.refkey);
  writeNotNull('VADE_TARIHI', instance.vadeTarihi?.toIso8601String());
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('ALACAK', instance.alacak);
  writeNotNull('BORDRO_MU', instance.bordroMu);
  writeNotNull('DOVIZ_ALACAK', instance.dovizAlacak);
  writeNotNull('SUBE_KODU', instance.subeKodu);
  writeNotNull('EBELGE_TURU', instance.ebelgeTuru);
  writeNotNull('RESMI_BELGE_NO', instance.resmiBelgeNo);
  return val;
}

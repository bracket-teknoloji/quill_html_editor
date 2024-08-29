// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_hareketleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankaHareketleriModelImpl _$$BankaHareketleriModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BankaHareketleriModelImpl(
      inckeyno: (json['INCKEYNO'] as num?)?.toInt(),
      netheskodu: json['NETHESKODU'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      harturu: (json['HARTURU'] as num?)?.toInt(),
      ba: json['BA'] as String?,
      tutar: (json['TUTAR'] as num?)?.toDouble(),
      aciklama: json['ACIKLAMA'] as String?,
      entegrefkey: json['ENTEGREFKEY'] as String?,
      dovizTipi: (json['DOVIZ_TIPI'] as num?)?.toInt(),
      dovizTutari: (json['DOVIZ_TUTARI'] as num?)?.toDouble(),
      hareketTipi: (json['HAREKET_TIPI'] as num?)?.toInt(),
      hesapAdi: json['HESAP_ADI'] as String?,
      hareketAciklama: json['HAREKET_ACIKLAMA'] as String?,
      bankaKodu: json['BANKA_KODU'] as String?,
      bankaAdi: json['BANKA_ADI'] as String?,
      bankasubeKodu: json['BANKASUBE_KODU'] as String?,
      subeAdi: json['SUBE_ADI'] as String?,
      belgeno: json['BELGENO'] as String?,
      dovizAdi: json['DOVIZ_ADI'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
      cariAdi: json['CARI_ADI'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      kasaKodu: json['KASA_KODU'] as String?,
      kasaAdi: json['KASA_ADI'] as String?,
      entegreKasaKodu: json['ENTEGRE_KASA_KODU'] as String?,
      sozlesmeKodu: json['SOZLESME_KODU'] as String?,
      projeKodu: json['PROJE_KODU'] as String?,
      projeAciklama: json['PROJE_ACIKLAMA'] as String?,
      plasiyerKodu: json['PLASIYER_KODU'] as String?,
      plasiyerAdi: json['PLASIYER_ADI'] as String?,
      nakitmi: json['NAKITMI'] as String?,
      taksitSayisi: (json['TAKSIT_SAYISI'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BankaHareketleriModelImplToJson(
    _$BankaHareketleriModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('INCKEYNO', instance.inckeyno);
  writeNotNull('NETHESKODU', instance.netheskodu);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('HARTURU', instance.harturu);
  writeNotNull('BA', instance.ba);
  writeNotNull('TUTAR', instance.tutar);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('ENTEGREFKEY', instance.entegrefkey);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('DOVIZ_TUTARI', instance.dovizTutari);
  writeNotNull('HAREKET_TIPI', instance.hareketTipi);
  writeNotNull('HESAP_ADI', instance.hesapAdi);
  writeNotNull('HAREKET_ACIKLAMA', instance.hareketAciklama);
  writeNotNull('BANKA_KODU', instance.bankaKodu);
  writeNotNull('BANKA_ADI', instance.bankaAdi);
  writeNotNull('BANKASUBE_KODU', instance.bankasubeKodu);
  writeNotNull('SUBE_ADI', instance.subeAdi);
  writeNotNull('BELGENO', instance.belgeno);
  writeNotNull('DOVIZ_ADI', instance.dovizAdi);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('KASA_KODU', instance.kasaKodu);
  writeNotNull('KASA_ADI', instance.kasaAdi);
  writeNotNull('ENTEGRE_KASA_KODU', instance.entegreKasaKodu);
  writeNotNull('SOZLESME_KODU', instance.sozlesmeKodu);
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('PROJE_ACIKLAMA', instance.projeAciklama);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('PLASIYER_ADI', instance.plasiyerAdi);
  writeNotNull('NAKITMI', instance.nakitmi);
  writeNotNull('TAKSIT_SAYISI', instance.taksitSayisi);
  return val;
}

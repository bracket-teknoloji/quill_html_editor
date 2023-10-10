// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kasa_islemleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KasaIslemleriModelImpl _$$KasaIslemleriModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KasaIslemleriModelImpl(
      inckeyno: json['INCKEYNO'] as int?,
      caharInckeyno: json['CAHAR_INCKEYNO'] as int?,
      kasaKodu: json['KASA_KODU'] as String?,
      kasaAdi: json['KASA_ADI'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      tip: json['TIP'] as String?,
      tipAciklama: json['TIP_ACIKLAMA'] as String?,
      hedefAciklama: json['HEDEF_ACIKLAMA'] as String?,
      tutar: (json['TUTAR'] as num?)?.toDouble(),
      cariMuh: json['CARI_MUH'] as String?,
      gc: json['GC'] as String?,
      kod: json['KOD'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
      cariAdi: json['CARI_ADI'] as String?,
      hesapAdi: json['HESAP_ADI'] as String?,
      dovizTutari: (json['DOVIZ_TUTARI'] as num?)?.toDouble(),
      dovizKuru: (json['DOVIZ_KURU'] as num?)?.toDouble(),
      plasiyerKodu: json['PLASIYER_KODU'] as String?,
      plasiyerAdi: json['PLASIYER_ADI'] as String?,
      projeKodu: json['PROJE_KODU'] as String?,
      projeAdi: json['PROJE_ADI'] as String?,
      aciklama: json['ACIKLAMA'] as String?,
      refkey: json['REFKEY'] as String?,
      kasaDevirTarihi: json['KASA_DEVIR_TARIHI'] == null
          ? null
          : DateTime.parse(json['KASA_DEVIR_TARIHI'] as String),
      kasaDevirTutari: (json['KASA_DEVIR_TUTARI'] as num?)?.toDouble(),
      kasaDovizDevirTutari:
          (json['KASA_DOVIZ_DEVIR_TUTARI'] as num?)?.toDouble(),
      kasaDovizTipi: json['KASA_DOVIZ_TIPI'] as int?,
    );

Map<String, dynamic> _$$KasaIslemleriModelImplToJson(
    _$KasaIslemleriModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('INCKEYNO', instance.inckeyno);
  writeNotNull('CAHAR_INCKEYNO', instance.caharInckeyno);
  writeNotNull('KASA_KODU', instance.kasaKodu);
  writeNotNull('KASA_ADI', instance.kasaAdi);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('TIP', instance.tip);
  writeNotNull('TIP_ACIKLAMA', instance.tipAciklama);
  writeNotNull('HEDEF_ACIKLAMA', instance.hedefAciklama);
  writeNotNull('TUTAR', instance.tutar);
  writeNotNull('CARI_MUH', instance.cariMuh);
  writeNotNull('GC', instance.gc);
  writeNotNull('KOD', instance.kod);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('HESAP_ADI', instance.hesapAdi);
  writeNotNull('DOVIZ_TUTARI', instance.dovizTutari);
  writeNotNull('DOVIZ_KURU', instance.dovizKuru);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('PLASIYER_ADI', instance.plasiyerAdi);
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('PROJE_ADI', instance.projeAdi);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('REFKEY', instance.refkey);
  writeNotNull(
      'KASA_DEVIR_TARIHI', instance.kasaDevirTarihi?.toIso8601String());
  writeNotNull('KASA_DEVIR_TUTARI', instance.kasaDevirTutari);
  writeNotNull('KASA_DOVIZ_DEVIR_TUTARI', instance.kasaDovizDevirTutari);
  writeNotNull('KASA_DOVIZ_TIPI', instance.kasaDovizTipi);
  return val;
}

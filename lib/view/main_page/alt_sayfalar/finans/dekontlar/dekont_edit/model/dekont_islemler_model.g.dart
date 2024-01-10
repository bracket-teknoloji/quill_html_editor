// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dekont_islemler_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DekontIslemlerModelImpl _$$DekontIslemlerModelImplFromJson(Map<String, dynamic> json) => _$DekontIslemlerModelImpl(
      inckeyno: json['INCKEYNO'] as int?,
      tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
      seriNo: json['SERI_NO'] as String?,
      dekontNo: json['DEKONT_NO'] as int?,
      siraNo: json['SIRA_NO'] as int?,
      ba: json['BA'] as String?,
      hesapTipi: json['HESAP_TIPI'] as String?,
      hesapTipiAciklama: json['HESAP_TIPI_ACIKLAMA'] as String?,
      hesapKodu: json['HESAP_KODU'] as String?,
      hesapAdi: json['HESAP_ADI'] as String?,
      tutar: (json['TUTAR'] as num?)?.toDouble(),
      dovizTipi: json['DOVIZ_TIPI'] as int?,
      dovizTutari: json['DOVIZ_TUTARI'] as int?,
      aciklama: json['ACIKLAMA'] as String?,
      plasiyerKodu: json['PLASIYER_KODU'] as String?,
      refkey: json['REFKEY'] as String?,
      cariAdi: json['CARI_ADI'] as String?,
      plasiyerAciklama: json['PLASIYER_ACIKLAMA'] as String?,
      depoKodu: json['DEPO_KODU'] as int?,
      exportTipi: json['EXPORT_TIPI'] as int?,
      muhasebeHesapTipi: json['MUHASEBE_HESAP_TIPI'] as String?,
    );

Map<String, dynamic> _$$DekontIslemlerModelImplToJson(_$DekontIslemlerModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('INCKEYNO', instance.inckeyno);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('SERI_NO', instance.seriNo);
  writeNotNull('DEKONT_NO', instance.dekontNo);
  writeNotNull('SIRA_NO', instance.siraNo);
  writeNotNull('BA', instance.ba);
  writeNotNull('HESAP_TIPI', instance.hesapTipi);
  writeNotNull('HESAP_TIPI_ACIKLAMA', instance.hesapTipiAciklama);
  writeNotNull('HESAP_KODU', instance.hesapKodu);
  writeNotNull('HESAP_ADI', instance.hesapAdi);
  writeNotNull('TUTAR', instance.tutar);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('DOVIZ_TUTARI', instance.dovizTutari);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('REFKEY', instance.refkey);
  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('PLASIYER_ACIKLAMA', instance.plasiyerAciklama);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('EXPORT_TIPI', instance.exportTipi);
  writeNotNull('MUHASEBE_HESAP_TIPI', instance.muhasebeHesapTipi);
  return val;
}

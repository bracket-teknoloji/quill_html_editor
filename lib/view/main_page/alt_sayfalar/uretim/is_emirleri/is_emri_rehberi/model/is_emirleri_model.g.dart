// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_emirleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IsEmirleriModelImpl _$$IsEmirleriModelImplFromJson(
        Map<String, dynamic> json) =>
    _$IsEmirleriModelImpl(
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      teslimTarihi: json['TESLIM_TARIHI'] == null
          ? null
          : DateTime.parse(json['TESLIM_TARIHI'] as String),
      isemriNo: json['ISEMRI_NO'] as String?,
      isemriSira: json['ISEMRI_SIRA'] as int?,
      stokKodu: json['STOK_KODU'] as String?,
      yapkod: json['YAPKOD'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      kalan: (json['KALAN'] as num?)?.toDouble(),
      cikisDepo: json['CIKIS_DEPO'] as int?,
      girisDepo: json['GIRIS_DEPO'] as int?,
      kapali: json['KAPALI'] as String?,
      rework: json['REWORK'] as String?,
      cikisDepoAdi: json['CIKIS_DEPO_ADI'] as String?,
      girisDepoAdi: json['GIRIS_DEPO_ADI'] as String?,
      stokOlcuBirimi: json['STOK_OLCU_BIRIMI'] as String?,
      projeKodu: json['PROJE_KODU'] as String?,
      refIsemrino: json['REF_ISEMRINO'] as String?,
      siparisNo: json['SIPARIS_NO'] as String?,
      siparisSira: json['SIPARIS_SIRA'] as int?,
      cariKodu: json['CARI_KODU'] as String?,
      cariAdi: json['CARI_ADI'] as String?,
      tamamlanan: (json['TAMAMLANAN'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$IsEmirleriModelImplToJson(
    _$IsEmirleriModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('TESLIM_TARIHI', instance.teslimTarihi?.toIso8601String());
  writeNotNull('ISEMRI_NO', instance.isemriNo);
  writeNotNull('ISEMRI_SIRA', instance.isemriSira);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('YAPKOD', instance.yapkod);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('KALAN', instance.kalan);
  writeNotNull('CIKIS_DEPO', instance.cikisDepo);
  writeNotNull('GIRIS_DEPO', instance.girisDepo);
  writeNotNull('KAPALI', instance.kapali);
  writeNotNull('REWORK', instance.rework);
  writeNotNull('CIKIS_DEPO_ADI', instance.cikisDepoAdi);
  writeNotNull('GIRIS_DEPO_ADI', instance.girisDepoAdi);
  writeNotNull('STOK_OLCU_BIRIMI', instance.stokOlcuBirimi);
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('REF_ISEMRINO', instance.refIsemrino);
  writeNotNull('SIPARIS_NO', instance.siparisNo);
  writeNotNull('SIPARIS_SIRA', instance.siparisSira);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('TAMAMLANAN', instance.tamamlanan);
  return val;
}

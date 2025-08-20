// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_hareketleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeriHareketleriModel _$SeriHareketleriModelFromJson(
  Map<String, dynamic> json,
) => _SeriHareketleriModel(
  stokKodu: json['STOK_KODU'] as String?,
  stokAdi: json['STOK_ADI'] as String?,
  depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
  miktar: (json['MIKTAR'] as num?)?.toDouble(),
  seriNo: json['SERI_NO'] as String?,
  inckeyno: (json['INCKEYNO'] as num?)?.toInt(),
  depoTanimi: json['DEPO_TANIMI'] as String?,
  kayitTipi: json['KAYIT_TIPI'] as String?,
  kayitTipiAdi: json['KAYIT_TIPI_ADI'] as String?,
  belgeNo: json['BELGE_NO'] as String?,
  belgeTipi: json['BELGE_TIPI'] as String?,
  belgeTipiAdi: json['BELGE_TIPI_ADI'] as String?,
  haracik: json['HARACIK'] as String?,
  gckod: json['GCKOD'] as String?,
  tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
  stharInc: (json['STHAR_INC'] as num?)?.toInt(),
  islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
  acik1: json['ACIK1'] as String?,
  acik2: json['ACIK2'] as String?,
  aciklama1: json['ACIKLAMA1'] as String?,
  seri1: json['SERI1'] as String?,
  requestVersion: (json['REQUEST_VERSION'] as num?)?.toInt(),
  seri2: json['SERI2'] as String?,
);

Map<String, dynamic> _$SeriHareketleriModelToJson(
  _SeriHareketleriModel instance,
) => <String, dynamic>{
  'STOK_KODU': ?instance.stokKodu,
  'STOK_ADI': ?instance.stokAdi,
  'DEPO_KODU': ?instance.depoKodu,
  'MIKTAR': ?instance.miktar,
  'SERI_NO': ?instance.seriNo,
  'INCKEYNO': ?instance.inckeyno,
  'DEPO_TANIMI': ?instance.depoTanimi,
  'KAYIT_TIPI': ?instance.kayitTipi,
  'KAYIT_TIPI_ADI': ?instance.kayitTipiAdi,
  'BELGE_NO': ?instance.belgeNo,
  'BELGE_TIPI': ?instance.belgeTipi,
  'BELGE_TIPI_ADI': ?instance.belgeTipiAdi,
  'HARACIK': ?instance.haracik,
  'GCKOD': ?instance.gckod,
  'TARIH': ?instance.tarih?.toIso8601String(),
  'STHAR_INC': ?instance.stharInc,
  'ISLEM_KODU': ?instance.islemKodu,
  'ACIK1': ?instance.acik1,
  'ACIK2': ?instance.acik2,
  'ACIKLAMA1': ?instance.aciklama1,
  'SERI1': ?instance.seri1,
  'REQUEST_VERSION': ?instance.requestVersion,
  'SERI2': ?instance.seri2,
};

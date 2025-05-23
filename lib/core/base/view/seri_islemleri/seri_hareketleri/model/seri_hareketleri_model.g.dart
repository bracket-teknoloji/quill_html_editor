// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_hareketleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeriHareketleriModelImpl _$$SeriHareketleriModelImplFromJson(Map<String, dynamic> json) => _$SeriHareketleriModelImpl(
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

Map<String, dynamic> _$$SeriHareketleriModelImplToJson(_$SeriHareketleriModelImpl instance) => <String, dynamic>{
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
  if (instance.stokAdi case final value?) 'STOK_ADI': value,
  if (instance.depoKodu case final value?) 'DEPO_KODU': value,
  if (instance.miktar case final value?) 'MIKTAR': value,
  if (instance.seriNo case final value?) 'SERI_NO': value,
  if (instance.inckeyno case final value?) 'INCKEYNO': value,
  if (instance.depoTanimi case final value?) 'DEPO_TANIMI': value,
  if (instance.kayitTipi case final value?) 'KAYIT_TIPI': value,
  if (instance.kayitTipiAdi case final value?) 'KAYIT_TIPI_ADI': value,
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
  if (instance.belgeTipiAdi case final value?) 'BELGE_TIPI_ADI': value,
  if (instance.haracik case final value?) 'HARACIK': value,
  if (instance.gckod case final value?) 'GCKOD': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
  if (instance.stharInc case final value?) 'STHAR_INC': value,
  if (instance.islemKodu case final value?) 'ISLEM_KODU': value,
  if (instance.acik1 case final value?) 'ACIK1': value,
  if (instance.acik2 case final value?) 'ACIK2': value,
  if (instance.aciklama1 case final value?) 'ACIKLAMA1': value,
  if (instance.seri1 case final value?) 'SERI1': value,
  if (instance.requestVersion case final value?) 'REQUEST_VERSION': value,
  if (instance.seri2 case final value?) 'SERI2': value,
};

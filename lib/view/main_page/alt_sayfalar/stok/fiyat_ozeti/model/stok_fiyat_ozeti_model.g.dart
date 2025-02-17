// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_fiyat_ozeti_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StokFiyatOzetiModelImpl _$$StokFiyatOzetiModelImplFromJson(Map<String, dynamic> json) => _$StokFiyatOzetiModelImpl(
  sira: (json['SIRA'] as num?)?.toInt(),
  grup: json['GRUP'] as String?,
  tip: json['TIP'] as String?,
  cariKodu: json['CARI_KODU'] as String?,
  cariAdi: json['CARI_ADI'] as String?,
  tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
  fiyat: (json['FIYAT'] as num?)?.toDouble(),
  dovizFiyati: (json['DOVIZ_FIYATI'] as num?)?.toInt(),
  dovizAdi: json['DOVIZ_ADI'] as String?,
  dovizTipi: (json['DOVIZ_TIPI'] as num?)?.toInt(),
  brutFiyat: (json['BRUT_FIYAT'] as num?)?.toInt(),
  brutDovizFiyati: (json['BRUT_DOVIZ_FIYATI'] as num?)?.toInt(),
);

Map<String, dynamic> _$$StokFiyatOzetiModelImplToJson(_$StokFiyatOzetiModelImpl instance) => <String, dynamic>{
  if (instance.sira case final value?) 'SIRA': value,
  if (instance.grup case final value?) 'GRUP': value,
  if (instance.tip case final value?) 'TIP': value,
  if (instance.cariKodu case final value?) 'CARI_KODU': value,
  if (instance.cariAdi case final value?) 'CARI_ADI': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
  if (instance.fiyat case final value?) 'FIYAT': value,
  if (instance.dovizFiyati case final value?) 'DOVIZ_FIYATI': value,
  if (instance.dovizAdi case final value?) 'DOVIZ_ADI': value,
  if (instance.dovizTipi case final value?) 'DOVIZ_TIPI': value,
  if (instance.brutFiyat case final value?) 'BRUT_FIYAT': value,
  if (instance.brutDovizFiyati case final value?) 'BRUT_DOVIZ_FIYATI': value,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_fiyati_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StokFiyatiModelImpl _$$StokFiyatiModelImplFromJson(Map<String, dynamic> json) => _$StokFiyatiModelImpl(
  fiyat: (json['FIYAT'] as num?)?.toDouble(),
  yer: json['YER'] as String?,
  fiyatSirasi: (json['FIYAT_SIRASI'] as num?)?.toInt(),
  stokKodu: json['STOK_KODU'] as String?,
  cariKodu: json['CARI_KODU'] as String?,
  tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
);

Map<String, dynamic> _$$StokFiyatiModelImplToJson(_$StokFiyatiModelImpl instance) => <String, dynamic>{
  if (instance.fiyat case final value?) 'FIYAT': value,
  if (instance.yer case final value?) 'YER': value,
  if (instance.fiyatSirasi case final value?) 'FIYAT_SIRASI': value,
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
  if (instance.cariKodu case final value?) 'CARI_KODU': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
};

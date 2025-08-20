// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_emri_hammadde_takibi_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IsEmriHammaddeTakibiListesiModel _$IsEmriHammaddeTakibiListesiModelFromJson(
  Map<String, dynamic> json,
) => _IsEmriHammaddeTakibiListesiModel(
  takipno: (json['TAKIPNO'] as num?)?.toInt(),
  nfisemrino: (json['NFISEMRINO'] as num?)?.toInt(),
  isemrino: json['ISEMRINO'] as String?,
  stokKodu: json['STOK_KODU'] as String?,
  stokAdi: json['STOK_ADI'] as String?,
  yapkod: json['YAPKOD'] as String?,
  yapacik: json['YAPACIK'] as String?,
  makineKodu: json['MAKINE_KODU'] as String?,
  miktar: (json['MIKTAR'] as num?)?.toDouble(),
);

Map<String, dynamic> _$IsEmriHammaddeTakibiListesiModelToJson(
  _IsEmriHammaddeTakibiListesiModel instance,
) => <String, dynamic>{
  'TAKIPNO': ?instance.takipno,
  'NFISEMRINO': ?instance.nfisemrino,
  'ISEMRINO': ?instance.isemrino,
  'STOK_KODU': ?instance.stokKodu,
  'STOK_ADI': ?instance.stokAdi,
  'YAPKOD': ?instance.yapkod,
  'YAPACIK': ?instance.yapacik,
  'MAKINE_KODU': ?instance.makineKodu,
  'MIKTAR': ?instance.miktar,
};

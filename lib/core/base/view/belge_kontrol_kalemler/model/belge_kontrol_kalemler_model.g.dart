// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belge_kontrol_kalemler_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BelgeKontrolKalemlerModel _$BelgeKontrolKalemlerModelFromJson(
  Map<String, dynamic> json,
) => _BelgeKontrolKalemlerModel(
  kontrolId: (json['KONTROL_ID'] as num?)?.toInt(),
  belgeTipi: json['BELGE_TIPI'] as String?,
  belgeNo: json['BELGE_NO'] as String?,
  cariKodu: json['CARI_KODU'] as String?,
  sira: (json['SIRA'] as num?)?.toInt(),
  stokKodu: json['STOK_KODU'] as String?,
  stokAdi: json['STOK_ADI'] as String?,
  miktar: (json['MIKTAR'] as num?)?.toDouble(),
  tamamlananMiktar: (json['TAMAMLANAN_MIKTAR'] as num?)?.toDouble(),
  kalemBirimSira: (json['KALEM_BIRIM_SIRA'] as num?)?.toInt(),
  stokOlcuBirimi: json['STOK_OLCU_BIRIMI'] as String?,
  kalemBirimAdi: json['KALEM_BIRIM_ADI'] as String?,
  kalanMiktar: (json['KALAN_MIKTAR'] as num?)?.toDouble(),
);

Map<String, dynamic> _$BelgeKontrolKalemlerModelToJson(
  _BelgeKontrolKalemlerModel instance,
) => <String, dynamic>{
  'KONTROL_ID': ?instance.kontrolId,
  'BELGE_TIPI': ?instance.belgeTipi,
  'BELGE_NO': ?instance.belgeNo,
  'CARI_KODU': ?instance.cariKodu,
  'SIRA': ?instance.sira,
  'STOK_KODU': ?instance.stokKodu,
  'STOK_ADI': ?instance.stokAdi,
  'MIKTAR': ?instance.miktar,
  'TAMAMLANAN_MIKTAR': ?instance.tamamlananMiktar,
  'KALEM_BIRIM_SIRA': ?instance.kalemBirimSira,
  'STOK_OLCU_BIRIMI': ?instance.stokOlcuBirimi,
  'KALEM_BIRIM_ADI': ?instance.kalemBirimAdi,
  'KALAN_MIKTAR': ?instance.kalanMiktar,
};

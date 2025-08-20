// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belge_kontrol_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BelgeKontrolModel _$BelgeKontrolModelFromJson(Map<String, dynamic> json) =>
    _BelgeKontrolModel(
      id: (json['ID'] as num?)?.toInt(),
      belgeTipi: json['BELGE_TIPI'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
      islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
      sira: (json['SIRA'] as num?)?.toInt(),
      belgeTarihi: json['BELGE_TARIHI'] == null
          ? null
          : DateTime.parse(json['BELGE_TARIHI'] as String),
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      tamamlananMiktar: (json['TAMAMLANAN_MIKTAR'] as num?)?.toDouble(),
      kayityapankul: json['KAYITYAPANKUL'] as String?,
      kayittarihi: json['KAYITTARIHI'] == null
          ? null
          : DateTime.parse(json['KAYITTARIHI'] as String),
      cariAdi: json['CARI_ADI'] as String?,
      kalanMiktar: (json['KALAN_MIKTAR'] as num?)?.toDouble(),
      stokKodu: json['STOK_KODU'] as String?,
    );

Map<String, dynamic> _$BelgeKontrolModelToJson(_BelgeKontrolModel instance) =>
    <String, dynamic>{
      'ID': ?instance.id,
      'BELGE_TIPI': ?instance.belgeTipi,
      'BELGE_NO': ?instance.belgeNo,
      'CARI_KODU': ?instance.cariKodu,
      'ISLEM_KODU': ?instance.islemKodu,
      'SIRA': ?instance.sira,
      'BELGE_TARIHI': ?instance.belgeTarihi?.toIso8601String(),
      'MIKTAR': ?instance.miktar,
      'TAMAMLANAN_MIKTAR': ?instance.tamamlananMiktar,
      'KAYITYAPANKUL': ?instance.kayityapankul,
      'KAYITTARIHI': ?instance.kayittarihi?.toIso8601String(),
      'CARI_ADI': ?instance.cariAdi,
      'KALAN_MIKTAR': ?instance.kalanMiktar,
      'STOK_KODU': ?instance.stokKodu,
    };

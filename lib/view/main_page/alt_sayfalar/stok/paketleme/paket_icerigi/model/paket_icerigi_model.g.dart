// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paket_icerigi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaketIcerigiModel _$PaketIcerigiModelFromJson(Map<String, dynamic> json) =>
    _PaketIcerigiModel(
      id: (json['ID'] as num?)?.toInt(),
      paketId: (json['PAKET_ID'] as num?)?.toInt(),
      paketKodu: json['PAKET_KODU'] as String?,
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      depoAdi: json['DEPO_ADI'] as String?,
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      cikistaSeri: json['CIKISTA_SERI'] as String?,
      seriMiktarKadar: json['SERI_MIKTAR_KADAR'] as String?,
      seriBakiyeKontrol: json['SERI_BAKIYE_KONTROL'] as String?,
      seriCikistaOtomatik: json['SERI_CIKISTA_OTOMATIK'] as String?,
      seriList: (json['SERI_LIST'] as List<dynamic>?)
          ?.map((e) => SeriList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaketIcerigiModelToJson(_PaketIcerigiModel instance) =>
    <String, dynamic>{
      'ID': ?instance.id,
      'PAKET_ID': ?instance.paketId,
      'PAKET_KODU': ?instance.paketKodu,
      'DEPO_KODU': ?instance.depoKodu,
      'DEPO_ADI': ?instance.depoAdi,
      'STOK_KODU': ?instance.stokKodu,
      'STOK_ADI': ?instance.stokAdi,
      'MIKTAR': ?instance.miktar,
      'CIKISTA_SERI': ?instance.cikistaSeri,
      'SERI_MIKTAR_KADAR': ?instance.seriMiktarKadar,
      'SERI_BAKIYE_KONTROL': ?instance.seriBakiyeKontrol,
      'SERI_CIKISTA_OTOMATIK': ?instance.seriCikistaOtomatik,
      'SERI_LIST': ?instance.seriList?.map((e) => e.toJson()).toList(),
    };

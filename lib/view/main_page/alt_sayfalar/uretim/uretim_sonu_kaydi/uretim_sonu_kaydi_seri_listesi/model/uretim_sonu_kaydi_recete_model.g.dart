// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_kaydi_recete_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UskReceteModel _$UskReceteModelFromJson(Map<String, dynamic> json) =>
    _UskReceteModel(
      mamulKodu: json['MAMUL_KODU'] as String?,
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      sonOperasyon: json['SON_OPERASYON'] as String?,
      ob: json['OB'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      cikistaSeri: json['CIKISTA_SERI'] as String?,
      seriMiktarKadar: json['SERI_MIKTAR_KADAR'] as String?,
      seriBakiyeKontrol: json['SERI_BAKIYE_KONTROL'] as String?,
      seriCikistaOtomatik: json['SERI_CIKISTA_OTOMATIK'] as String?,
      seriGiristeOtomatik: json['SERI_GIRISTE_OTOMATIK'] as String?,
      sira: json['SIRA'] as String?,
      otorec: json['OTOREC'] as String?,
      seriList: (json['SERI_LIST'] as List<dynamic>?)
          ?.map((e) => SeriList.fromJson(e as Map<String, dynamic>))
          .toList(),
      giristeSeri: json['GIRISTE_SERI'] as String?,
    );

Map<String, dynamic> _$UskReceteModelToJson(_UskReceteModel instance) =>
    <String, dynamic>{
      'MAMUL_KODU': ?instance.mamulKodu,
      'STOK_KODU': ?instance.stokKodu,
      'STOK_ADI': ?instance.stokAdi,
      'SON_OPERASYON': ?instance.sonOperasyon,
      'OB': ?instance.ob,
      'MIKTAR': ?instance.miktar,
      'CIKISTA_SERI': ?instance.cikistaSeri,
      'SERI_MIKTAR_KADAR': ?instance.seriMiktarKadar,
      'SERI_BAKIYE_KONTROL': ?instance.seriBakiyeKontrol,
      'SERI_CIKISTA_OTOMATIK': ?instance.seriCikistaOtomatik,
      'SERI_GIRISTE_OTOMATIK': ?instance.seriGiristeOtomatik,
      'SIRA': ?instance.sira,
      'OTOREC': ?instance.otorec,
      'SERI_LIST': ?instance.seriList?.map((e) => e.toJson()).toList(),
      'GIRISTE_SERI': ?instance.giristeSeri,
    };

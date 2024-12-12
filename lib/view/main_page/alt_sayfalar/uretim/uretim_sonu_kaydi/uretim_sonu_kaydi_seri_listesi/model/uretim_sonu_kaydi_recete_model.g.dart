// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_kaydi_recete_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UskReceteModelImpl _$$UskReceteModelImplFromJson(Map<String, dynamic> json) =>
    _$UskReceteModelImpl(
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

Map<String, dynamic> _$$UskReceteModelImplToJson(
        _$UskReceteModelImpl instance) =>
    <String, dynamic>{
      if (instance.mamulKodu case final value?) 'MAMUL_KODU': value,
      if (instance.stokKodu case final value?) 'STOK_KODU': value,
      if (instance.stokAdi case final value?) 'STOK_ADI': value,
      if (instance.sonOperasyon case final value?) 'SON_OPERASYON': value,
      if (instance.ob case final value?) 'OB': value,
      if (instance.miktar case final value?) 'MIKTAR': value,
      if (instance.cikistaSeri case final value?) 'CIKISTA_SERI': value,
      if (instance.seriMiktarKadar case final value?)
        'SERI_MIKTAR_KADAR': value,
      if (instance.seriBakiyeKontrol case final value?)
        'SERI_BAKIYE_KONTROL': value,
      if (instance.seriCikistaOtomatik case final value?)
        'SERI_CIKISTA_OTOMATIK': value,
      if (instance.seriGiristeOtomatik case final value?)
        'SERI_GIRISTE_OTOMATIK': value,
      if (instance.sira case final value?) 'SIRA': value,
      if (instance.otorec case final value?) 'OTOREC': value,
      if (instance.seriList?.map((e) => e.toJson()).toList() case final value?)
        'SERI_LIST': value,
      if (instance.giristeSeri case final value?) 'GIRISTE_SERI': value,
    };

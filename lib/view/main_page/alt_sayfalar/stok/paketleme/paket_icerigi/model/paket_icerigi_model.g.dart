// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paket_icerigi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaketIcerigiModelImpl _$$PaketIcerigiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaketIcerigiModelImpl(
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

Map<String, dynamic> _$$PaketIcerigiModelImplToJson(
        _$PaketIcerigiModelImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'ID': value,
      if (instance.paketId case final value?) 'PAKET_ID': value,
      if (instance.paketKodu case final value?) 'PAKET_KODU': value,
      if (instance.depoKodu case final value?) 'DEPO_KODU': value,
      if (instance.depoAdi case final value?) 'DEPO_ADI': value,
      if (instance.stokKodu case final value?) 'STOK_KODU': value,
      if (instance.stokAdi case final value?) 'STOK_ADI': value,
      if (instance.miktar case final value?) 'MIKTAR': value,
      if (instance.cikistaSeri case final value?) 'CIKISTA_SERI': value,
      if (instance.seriMiktarKadar case final value?)
        'SERI_MIKTAR_KADAR': value,
      if (instance.seriBakiyeKontrol case final value?)
        'SERI_BAKIYE_KONTROL': value,
      if (instance.seriCikistaOtomatik case final value?)
        'SERI_CIKISTA_OTOMATIK': value,
      if (instance.seriList?.map((e) => e.toJson()).toList() case final value?)
        'SERI_LIST': value,
    };

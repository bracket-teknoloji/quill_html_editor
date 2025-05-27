// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_emri_hammadde_takibi_detay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IsEmriHammaddeTakibiDetayModelImpl
    _$$IsEmriHammaddeTakibiDetayModelImplFromJson(Map<String, dynamic> json) =>
        _$IsEmriHammaddeTakibiDetayModelImpl(
          hamKodu: json['HAM_KODU'] as String?,
          hamAdi: json['HAM_ADI'] as String?,
          miktar: (json['MIKTAR'] as num?)?.toInt(),
          referanslar: (json['REFERANSLAR'] as List<dynamic>?)
              ?.map((e) => Referanslar.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$IsEmriHammaddeTakibiDetayModelImplToJson(
        _$IsEmriHammaddeTakibiDetayModelImpl instance) =>
    <String, dynamic>{
      if (instance.hamKodu case final value?) 'HAM_KODU': value,
      if (instance.hamAdi case final value?) 'HAM_ADI': value,
      if (instance.miktar case final value?) 'MIKTAR': value,
      if (instance.referanslar?.map((e) => e.toJson()).toList()
          case final value?)
        'REFERANSLAR': value,
    };

_$ReferanslarImpl _$$ReferanslarImplFromJson(Map<String, dynamic> json) =>
    _$ReferanslarImpl(
      id: (json['ID'] as num?)?.toInt(),
      hammaddeNo: json['HAMMADDE_NO'] as String?,
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      referansStokKodu: json['REFERANS_STOK_KODU'] as String?,
      referansStokAdi: json['REFERANS_STOK_ADI'] as String?,
    );

Map<String, dynamic> _$$ReferanslarImplToJson(_$ReferanslarImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'ID': value,
      if (instance.hammaddeNo case final value?) 'HAMMADDE_NO': value,
      if (instance.stokKodu case final value?) 'STOK_KODU': value,
      if (instance.stokAdi case final value?) 'STOK_ADI': value,
      if (instance.referansStokKodu case final value?)
        'REFERANS_STOK_KODU': value,
      if (instance.referansStokAdi case final value?)
        'REFERANS_STOK_ADI': value,
    };

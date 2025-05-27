// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_emri_hammadde_takibi_detay_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IsEmriHammaddeTakibiDetayRequestModelImpl
    _$$IsEmriHammaddeTakibiDetayRequestModelImplFromJson(
            Map<String, dynamic> json) =>
        _$IsEmriHammaddeTakibiDetayRequestModelImpl(
          takipno: (json['TAKIPNO'] as num?)?.toInt(),
          tip: json['TIP'] as String?,
          barcode: json['BARCODE'] as String?,
          islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
          referansStokKodu: json['REFERANS_STOK_KODU'] as String?,
        );

Map<String, dynamic> _$$IsEmriHammaddeTakibiDetayRequestModelImplToJson(
        _$IsEmriHammaddeTakibiDetayRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.takipno case final value?) 'TAKIPNO': value,
      if (instance.tip case final value?) 'TIP': value,
      if (instance.barcode case final value?) 'BARCODE': value,
      if (instance.islemKodu case final value?) 'ISLEM_KODU': value,
      if (instance.referansStokKodu case final value?)
        'REFERANS_STOK_KODU': value,
    };

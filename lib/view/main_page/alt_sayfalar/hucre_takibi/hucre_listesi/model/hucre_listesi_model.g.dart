// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HucreListesiModelImpl _$$HucreListesiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HucreListesiModelImpl(
      hucreKodu: json['HUCRE_KODU'] as String?,
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      depoTanimi: json['DEPO_TANIMI'] as String?,
      seriList: json['SeriList'] as List<dynamic>?,
      eksiyeDusebilir: json['EKSIYE_DUSEBILIR'] as bool?,
      netMiktar: (json['NET_MIKTAR'] as num?)?.toInt(),
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
    );

Map<String, dynamic> _$$HucreListesiModelImplToJson(
        _$HucreListesiModelImpl instance) =>
    <String, dynamic>{
      if (instance.hucreKodu case final value?) 'HUCRE_KODU': value,
      if (instance.depoKodu case final value?) 'DEPO_KODU': value,
      if (instance.depoTanimi case final value?) 'DEPO_TANIMI': value,
      if (instance.seriList case final value?) 'SeriList': value,
      if (instance.eksiyeDusebilir case final value?) 'EKSIYE_DUSEBILIR': value,
      if (instance.netMiktar case final value?) 'NET_MIKTAR': value,
      if (instance.stokKodu case final value?) 'STOK_KODU': value,
      if (instance.stokAdi case final value?) 'STOK_ADI': value,
    };

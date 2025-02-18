// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeriModelImpl _$$SeriModelImplFromJson(Map<String, dynamic> json) =>
    _$SeriModelImpl(
      seriNo: json['SERI_NO'] as String?,
      aciklama: json['ACIKLAMA'] as String?,
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      miktar: (json['MIKTAR'] as num?)?.toInt(),
      depoTanimi: json['DEPO_TANIMI'] as String?,
    );

Map<String, dynamic> _$$SeriModelImplToJson(_$SeriModelImpl instance) =>
    <String, dynamic>{
      if (instance.seriNo case final value?) 'SERI_NO': value,
      if (instance.aciklama case final value?) 'ACIKLAMA': value,
      if (instance.stokKodu case final value?) 'STOK_KODU': value,
      if (instance.stokAdi case final value?) 'STOK_ADI': value,
      if (instance.depoKodu case final value?) 'DEPO_KODU': value,
      if (instance.miktar case final value?) 'MIKTAR': value,
      if (instance.depoTanimi case final value?) 'DEPO_TANIMI': value,
    };

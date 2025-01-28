// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_takibi_stoklar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HucreTakibiStoklarModelImpl _$$HucreTakibiStoklarModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HucreTakibiStoklarModelImpl(
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      netMiktar: (json['NET_MIKTAR'] as num?)?.toDouble(),
      bakiye: (json['BAKIYE'] as num?)?.toDouble(),
      belgeOlcuBirimKodu: (json['BELGE_OLCU_BIRIM_KODU'] as num?)?.toInt(),
      belgeOlcuBirimAdi: json['BELGE_OLCU_BIRIM_ADI'] as String?,
      stokOlcuBirimi1: json['STOK_OLCU_BIRIMI1'] as String?,
      kalemSayisi: (json['KALEM_SAYISI'] as num?)?.toInt(),
      hucreKodu: json['HUCRE_KODU'] as String?,
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      yapkod: json['YAPKOD'] as String?,
      yapacik: json['YAPACIK'] as String?,
      olcuBirimi: json['OLCU_BIRIMI'] as String?,
      depoTanimi: json['DEPO_TANIMI'] as String?,
      seriList: (json['SERI_LIST'] as List<dynamic>?)
          ?.map((e) => SeriList.fromJson(e as Map<String, dynamic>))
          .toList(),
      eksiyeDusebilir: json['EKSIYE_DUSEBILIR'] as bool?,
      paketKodu: json['PAKET_KODU'] as String?,
    );

Map<String, dynamic> _$$HucreTakibiStoklarModelImplToJson(
        _$HucreTakibiStoklarModelImpl instance) =>
    <String, dynamic>{
      if (instance.stokKodu case final value?) 'STOK_KODU': value,
      if (instance.stokAdi case final value?) 'STOK_ADI': value,
      if (instance.miktar case final value?) 'MIKTAR': value,
      if (instance.netMiktar case final value?) 'NET_MIKTAR': value,
      if (instance.bakiye case final value?) 'BAKIYE': value,
      if (instance.belgeOlcuBirimKodu case final value?)
        'BELGE_OLCU_BIRIM_KODU': value,
      if (instance.belgeOlcuBirimAdi case final value?)
        'BELGE_OLCU_BIRIM_ADI': value,
      if (instance.stokOlcuBirimi1 case final value?)
        'STOK_OLCU_BIRIMI1': value,
      if (instance.kalemSayisi case final value?) 'KALEM_SAYISI': value,
      if (instance.hucreKodu case final value?) 'HUCRE_KODU': value,
      if (instance.depoKodu case final value?) 'DEPO_KODU': value,
      if (instance.yapkod case final value?) 'YAPKOD': value,
      if (instance.yapacik case final value?) 'YAPACIK': value,
      if (instance.olcuBirimi case final value?) 'OLCU_BIRIMI': value,
      if (instance.depoTanimi case final value?) 'DEPO_TANIMI': value,
      if (instance.seriList?.map((e) => e.toJson()).toList() case final value?)
        'SERI_LIST': value,
      if (instance.eksiyeDusebilir case final value?) 'EKSIYE_DUSEBILIR': value,
      if (instance.paketKodu case final value?) 'PAKET_KODU': value,
    };

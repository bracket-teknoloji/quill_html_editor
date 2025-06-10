// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucredeki_stoklar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HucredekiStoklarModel _$HucredekiStoklarModelFromJson(
  Map<String, dynamic> json,
) => _HucredekiStoklarModel(
  hucreKodu: json['HUCRE_KODU'] as String?,
  depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
  stokKodu: json['STOK_KODU'] as String?,
  stokAdi: json['STOK_ADI'] as String?,
  netMiktar: (json['NET_MIKTAR'] as num?)?.toDouble(),
  yapkod: json['YAPKOD'] as String?,
  yapacik: json['YAPACIK'] as String?,
  bakiye: (json['BAKIYE'] as num?)?.toDouble(),
  miktar: (json['MIKTAR'] as num?)?.toDouble(),
  olcuBirimi: json['OLCU_BIRIMI'] as String?,
);

Map<String, dynamic> _$HucredekiStoklarModelToJson(
  _HucredekiStoklarModel instance,
) => <String, dynamic>{
  if (instance.hucreKodu case final value?) 'HUCRE_KODU': value,
  if (instance.depoKodu case final value?) 'DEPO_KODU': value,
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
  if (instance.stokAdi case final value?) 'STOK_ADI': value,
  if (instance.netMiktar case final value?) 'NET_MIKTAR': value,
  if (instance.yapkod case final value?) 'YAPKOD': value,
  if (instance.yapacik case final value?) 'YAPACIK': value,
  if (instance.bakiye case final value?) 'BAKIYE': value,
  if (instance.miktar case final value?) 'MIKTAR': value,
  if (instance.olcuBirimi case final value?) 'OLCU_BIRIMI': value,
};

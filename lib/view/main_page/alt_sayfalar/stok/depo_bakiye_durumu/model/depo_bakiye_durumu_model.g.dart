// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'depo_bakiye_durumu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepoBakiyeDurumuModelImpl _$$DepoBakiyeDurumuModelImplFromJson(Map<String, dynamic> json) =>
    _$DepoBakiyeDurumuModelImpl(
      subeKodu: (json['SUBE_KODU'] as num?)?.toInt(),
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      stokKodu: json['STOK_KODU'] as String?,
      giris: (json['GIRIS'] as num?)?.toDouble(),
      cikis: (json['CIKIS'] as num?)?.toDouble(),
      bakiye: (json['BAKIYE'] as num?)?.toDouble(),
      subeAdi: json['SUBE_ADI'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      depoAdi: json['DEPO_ADI'] as String?,
    );

Map<String, dynamic> _$$DepoBakiyeDurumuModelImplToJson(_$DepoBakiyeDurumuModelImpl instance) => <String, dynamic>{
  if (instance.subeKodu case final value?) 'SUBE_KODU': value,
  if (instance.depoKodu case final value?) 'DEPO_KODU': value,
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
  if (instance.giris case final value?) 'GIRIS': value,
  if (instance.cikis case final value?) 'CIKIS': value,
  if (instance.bakiye case final value?) 'BAKIYE': value,
  if (instance.subeAdi case final value?) 'SUBE_ADI': value,
  if (instance.stokAdi case final value?) 'STOK_ADI': value,
  if (instance.depoAdi case final value?) 'DEPO_ADI': value,
};

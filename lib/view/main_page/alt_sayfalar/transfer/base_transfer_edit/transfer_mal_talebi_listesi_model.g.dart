// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_mal_talebi_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransferMalTalebiListesiModelImpl
    _$$TransferMalTalebiListesiModelImplFromJson(Map<String, dynamic> json) =>
        _$TransferMalTalebiListesiModelImpl(
          id: (json['ID'] as num?)?.toInt(),
          tarih: json['TARIH'] == null
              ? null
              : DateTime.parse(json['TARIH'] as String),
          depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
          durumAdi: json['DURUM_ADI'] as String?,
          kalemSayisi: (json['KALEM_SAYISI'] as num?)?.toInt(),
          miktar: (json['MIKTAR'] as num?)?.toInt(),
          kalanMiktar: (json['KALAN_MIKTAR'] as num?)?.toInt(),
          kayittarihi: json['KAYITTARIHI'] == null
              ? null
              : DateTime.parse(json['KAYITTARIHI'] as String),
          kayityapankul: json['KAYITYAPANKUL'] as String?,
          tamamlananMiktar: (json['TAMAMLANAN_MIKTAR'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$TransferMalTalebiListesiModelImplToJson(
        _$TransferMalTalebiListesiModelImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'ID': value,
      if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
      if (instance.depoKodu case final value?) 'DEPO_KODU': value,
      if (instance.durumAdi case final value?) 'DURUM_ADI': value,
      if (instance.kalemSayisi case final value?) 'KALEM_SAYISI': value,
      if (instance.miktar case final value?) 'MIKTAR': value,
      if (instance.kalanMiktar case final value?) 'KALAN_MIKTAR': value,
      if (instance.kayittarihi?.toIso8601String() case final value?)
        'KAYITTARIHI': value,
      if (instance.kayityapankul case final value?) 'KAYITYAPANKUL': value,
      if (instance.tamamlananMiktar case final value?)
        'TAMAMLANAN_MIKTAR': value,
    };

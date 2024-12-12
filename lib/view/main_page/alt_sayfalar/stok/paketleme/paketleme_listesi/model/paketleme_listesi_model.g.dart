// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paketleme_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaketlemeListesiModelImpl _$$PaketlemeListesiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaketlemeListesiModelImpl(
      id: (json['ID'] as num?)?.toInt(),
      kodu: json['KODU'] as String?,
      kalemSayisi: (json['KALEM_SAYISI'] as num?)?.toInt(),
      kayittarihi: json['KAYITTARIHI'] == null
          ? null
          : DateTime.parse(json['KAYITTARIHI'] as String),
      kayityapankul: json['KAYITYAPANKUL'] as String?,
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      paketTuru: (json['PAKET_TURU'] as num?)?.toInt(),
      paketTuruTanimi: json['PAKET_TURU_TANIMI'] as String?,
      kilit: json['KILIT'] as String?,
      ukey: json['UKEY'] as String?,
    );

Map<String, dynamic> _$$PaketlemeListesiModelImplToJson(
        _$PaketlemeListesiModelImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'ID': value,
      if (instance.kodu case final value?) 'KODU': value,
      if (instance.kalemSayisi case final value?) 'KALEM_SAYISI': value,
      if (instance.kayittarihi?.toIso8601String() case final value?)
        'KAYITTARIHI': value,
      if (instance.kayityapankul case final value?) 'KAYITYAPANKUL': value,
      if (instance.depoKodu case final value?) 'DEPO_KODU': value,
      if (instance.paketTuru case final value?) 'PAKET_TURU': value,
      if (instance.paketTuruTanimi case final value?)
        'PAKET_TURU_TANIMI': value,
      if (instance.kilit case final value?) 'KILIT': value,
      if (instance.ukey case final value?) 'UKEY': value,
    };

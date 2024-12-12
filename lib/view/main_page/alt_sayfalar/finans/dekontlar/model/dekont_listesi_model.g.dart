// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dekont_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DekontListesiModelImpl _$$DekontListesiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DekontListesiModelImpl(
      inckeyno: (json['INCKEYNO'] as num?)?.toInt(),
      seri: json['SERI'] as String?,
      dekontNo: (json['DEKONT_NO'] as num?)?.toInt(),
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      kalemSayisi: (json['KALEM_SAYISI'] as num?)?.toInt(),
      borcToplami: (json['BORC_TOPLAMI'] as num?)?.toDouble(),
      seriAdi: json['SERI_ADI'] as String?,
    );

Map<String, dynamic> _$$DekontListesiModelImplToJson(
        _$DekontListesiModelImpl instance) =>
    <String, dynamic>{
      if (instance.inckeyno case final value?) 'INCKEYNO': value,
      if (instance.seri case final value?) 'SERI': value,
      if (instance.dekontNo case final value?) 'DEKONT_NO': value,
      if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
      if (instance.kalemSayisi case final value?) 'KALEM_SAYISI': value,
      if (instance.borcToplami case final value?) 'BORC_TOPLAMI': value,
      if (instance.seriAdi case final value?) 'SERI_ADI': value,
    };

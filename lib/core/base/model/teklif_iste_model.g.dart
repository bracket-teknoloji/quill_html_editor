// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teklif_iste_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeklifIsteModel _$TeklifIsteModelFromJson(Map<String, dynamic> json) =>
    _TeklifIsteModel(
      tip: json['TIP'] as String?,
      mesaj: json['MESAJ'] as String?,
    );

Map<String, dynamic> _$TeklifIsteModelToJson(_TeklifIsteModel instance) =>
    <String, dynamic>{
      if (instance.tip case final value?) 'TIP': value,
      if (instance.mesaj case final value?) 'MESAJ': value,
    };

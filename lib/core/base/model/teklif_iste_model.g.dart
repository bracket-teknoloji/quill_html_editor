// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teklif_iste_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeklifIsteModelImpl _$$TeklifIsteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TeklifIsteModelImpl(
      tip: json['TIP'] as String?,
      mesaj: json['MESAJ'] as String?,
    );

Map<String, dynamic> _$$TeklifIsteModelImplToJson(
        _$TeklifIsteModelImpl instance) =>
    <String, dynamic>{
      if (instance.tip case final value?) 'TIP': value,
      if (instance.mesaj case final value?) 'MESAJ': value,
    };

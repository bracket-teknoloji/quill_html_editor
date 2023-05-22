// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'base_cari_siradaki_kod_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseCariEditSiradakiKodModel _$BaseCariEditSiradakiKodModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'BaseCariEditSiradakiKodModel',
      json,
      ($checkedConvert) {
        final val = BaseCariEditSiradakiKodModel();
        $checkedConvert('SIRADAKI_KOD', (v) => val.siradakiKod = v as String?);
        return val;
      },
      fieldKeyMap: const {'siradakiKod': 'SIRADAKI_KOD'},
    );

Map<String, dynamic> _$BaseCariEditSiradakiKodModelToJson(
        BaseCariEditSiradakiKodModel instance) =>
    <String, dynamic>{
      'SIRADAKI_KOD': instance.siradakiKod,
    };

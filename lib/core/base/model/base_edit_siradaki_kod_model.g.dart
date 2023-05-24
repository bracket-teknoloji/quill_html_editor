// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'base_edit_siradaki_kod_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseEditSiradakiKodModel _$BaseEditSiradakiKodModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'BaseEditSiradakiKodModel',
      json,
      ($checkedConvert) {
        final val = BaseEditSiradakiKodModel();
        $checkedConvert('SIRADAKI_KOD', (v) => val.siradakiKod = v as String?);
        return val;
      },
      fieldKeyMap: const {'siradakiKod': 'SIRADAKI_KOD'},
    );

Map<String, dynamic> _$BaseEditSiradakiKodModelToJson(
        BaseEditSiradakiKodModel instance) =>
    <String, dynamic>{
      'SIRADAKI_KOD': instance.siradakiKod,
    };

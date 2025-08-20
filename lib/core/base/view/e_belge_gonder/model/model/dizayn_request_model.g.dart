// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dizayn_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DizaynRequestModel _$DizaynRequestModelFromJson(Map<String, dynamic> json) =>
    _DizaynRequestModel(
      modulId: (json['ModulID'] as num?)?.toInt(),
      erpDizaynlari: json['ERPDizaynlari'] as bool?,
    );

Map<String, dynamic> _$DizaynRequestModelToJson(_DizaynRequestModel instance) =>
    <String, dynamic>{
      'ModulID': ?instance.modulId,
      'ERPDizaynlari': ?instance.erpDizaynlari,
    };

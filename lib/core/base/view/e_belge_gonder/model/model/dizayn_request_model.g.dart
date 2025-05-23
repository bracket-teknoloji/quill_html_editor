// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dizayn_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DizaynRequestModelImpl _$$DizaynRequestModelImplFromJson(Map<String, dynamic> json) => _$DizaynRequestModelImpl(
  modulId: (json['ModulID'] as num?)?.toInt(),
  erpDizaynlari: json['ERPDizaynlari'] as bool?,
);

Map<String, dynamic> _$$DizaynRequestModelImplToJson(_$DizaynRequestModelImpl instance) => <String, dynamic>{
  if (instance.modulId case final value?) 'ModulID': value,
  if (instance.erpDizaynlari case final value?) 'ERPDizaynlari': value,
};

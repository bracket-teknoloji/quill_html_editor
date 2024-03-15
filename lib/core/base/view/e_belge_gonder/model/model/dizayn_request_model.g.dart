// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dizayn_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DizaynRequestModelImpl _$$DizaynRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DizaynRequestModelImpl(
      modulId: json['ModulID'] as int?,
      erpDizaynlari: json['ERPDizaynlari'] as bool?,
    );

Map<String, dynamic> _$$DizaynRequestModelImplToJson(
    _$DizaynRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ModulID', instance.modulId);
  writeNotNull('ERPDizaynlari', instance.erpDizaynlari);
  return val;
}

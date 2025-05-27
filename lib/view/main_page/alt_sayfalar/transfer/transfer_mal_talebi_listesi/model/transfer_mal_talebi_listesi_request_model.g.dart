// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_mal_talebi_listesi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransferMalTalebiListesiRequestModelImpl
    _$$TransferMalTalebiListesiRequestModelImplFromJson(
            Map<String, dynamic> json) =>
        _$TransferMalTalebiListesiRequestModelImpl(
          durum: json['DURUM'] as String?,
          filtreler: (json['FILTRELER'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList(),
        );

Map<String, dynamic> _$$TransferMalTalebiListesiRequestModelImplToJson(
        _$TransferMalTalebiListesiRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.durum case final value?) 'DURUM': value,
      if (instance.filtreler case final value?) 'FILTRELER': value,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tcmb_bankalar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TcmbBankalarModelImpl _$$TcmbBankalarModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TcmbBankalarModelImpl(
      bankakodu: json['BANKAKODU'] as String?,
      bankaadi: json['BANKAADI'] as String?,
      subekodu: json['SUBEKODU'] as String?,
      subeadi: json['SUBEADI'] as String?,
      sehiradi: json['SEHIRADI'] as String?,
    );

Map<String, dynamic> _$$TcmbBankalarModelImplToJson(
        _$TcmbBankalarModelImpl instance) =>
    <String, dynamic>{
      if (instance.bankakodu case final value?) 'BANKAKODU': value,
      if (instance.bankaadi case final value?) 'BANKAADI': value,
      if (instance.subekodu case final value?) 'SUBEKODU': value,
      if (instance.subeadi case final value?) 'SUBEADI': value,
      if (instance.sehiradi case final value?) 'SEHIRADI': value,
    };

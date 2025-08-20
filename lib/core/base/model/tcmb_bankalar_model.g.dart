// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tcmb_bankalar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TcmbBankalarModel _$TcmbBankalarModelFromJson(Map<String, dynamic> json) =>
    _TcmbBankalarModel(
      bankakodu: json['BANKAKODU'] as String?,
      bankaadi: json['BANKAADI'] as String?,
      subekodu: json['SUBEKODU'] as String?,
      subeadi: json['SUBEADI'] as String?,
      sehiradi: json['SEHIRADI'] as String?,
    );

Map<String, dynamic> _$TcmbBankalarModelToJson(_TcmbBankalarModel instance) =>
    <String, dynamic>{
      'BANKAKODU': ?instance.bankakodu,
      'BANKAADI': ?instance.bankaadi,
      'SUBEKODU': ?instance.subekodu,
      'SUBEADI': ?instance.subeadi,
      'SEHIRADI': ?instance.sehiradi,
    };

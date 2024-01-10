// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tcmb_bankalar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TcmbBankalarModelImpl _$$TcmbBankalarModelImplFromJson(Map<String, dynamic> json) => _$TcmbBankalarModelImpl(
      bankakodu: json['BANKAKODU'] as String?,
      bankaadi: json['BANKAADI'] as String?,
      subekodu: json['SUBEKODU'] as String?,
      subeadi: json['SUBEADI'] as String?,
      sehiradi: json['SEHIRADI'] as String?,
    );

Map<String, dynamic> _$$TcmbBankalarModelImplToJson(_$TcmbBankalarModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BANKAKODU', instance.bankakodu);
  writeNotNull('BANKAADI', instance.bankaadi);
  writeNotNull('SUBEKODU', instance.subekodu);
  writeNotNull('SUBEADI', instance.subeadi);
  writeNotNull('SEHIRADI', instance.sehiradi);
  return val;
}

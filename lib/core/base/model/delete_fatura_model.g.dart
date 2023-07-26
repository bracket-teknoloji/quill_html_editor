// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_fatura_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteFaturaModel _$DeleteFaturaModelFromJson(Map<String, dynamic> json) =>
    DeleteFaturaModel()
      ..tipi = json['TIPI'] as int?
      ..tag = json['TAG'] as String?
      ..paramMap = json['PARAM_MAP'] as Map<String, dynamic>?
      ..belgeNo = json['BELGE_NO'] as String?
      ..cariKodu = json['CARI_KODU'] as String?
      ..belgeTuru = json['BELGE_TURU'] as String?;

Map<String, dynamic> _$DeleteFaturaModelToJson(DeleteFaturaModel instance) =>
    <String, dynamic>{
      'TIPI': instance.tipi,
      'TAG': instance.tag,
      'PARAM_MAP': instance.paramMap,
      'BELGE_NO': instance.belgeNo,
      'CARI_KODU': instance.cariKodu,
      'BELGE_TURU': instance.belgeTuru,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evrak_edit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EvrakEditModel _$EvrakEditModelFromJson(Map<String, dynamic> json) =>
    _EvrakEditModel(
      aciklama: json['ACIKLAMA'] as String?,
      base64Data: json['BASE64_DATA'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      boyutByte: (json['BOYUT_BYTE'] as num?)?.toInt(),
      islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EvrakEditModelToJson(_EvrakEditModel instance) =>
    <String, dynamic>{
      'ACIKLAMA': ?instance.aciklama,
      'BASE64_DATA': ?instance.base64Data,
      'BELGE_NO': ?instance.belgeNo,
      'BELGE_TIPI': ?instance.belgeTipi,
      'BOYUT_BYTE': ?instance.boyutByte,
      'ISLEM_KODU': ?instance.islemKodu,
    };

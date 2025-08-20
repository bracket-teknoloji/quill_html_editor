// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evraklar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EvraklarModel _$EvraklarModelFromJson(Map<String, dynamic> json) =>
    _EvraklarModel(
      id: (json['ID'] as num?)?.toInt(),
      belgeNo: json['BELGE_NO'] as String?,
      aciklama: json['ACIKLAMA'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      resimUrl: json['RESIM_URL'] as String?,
      resimUrlKucuk: json['RESIM_URL_KUCUK'] as String?,
      boyutByte: (json['BOYUT_BYTE'] as num?)?.toInt(),
      islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EvraklarModelToJson(_EvraklarModel instance) =>
    <String, dynamic>{
      'ID': ?instance.id,
      'BELGE_NO': ?instance.belgeNo,
      'ACIKLAMA': ?instance.aciklama,
      'BELGE_TIPI': ?instance.belgeTipi,
      'RESIM_URL': ?instance.resimUrl,
      'RESIM_URL_KUCUK': ?instance.resimUrlKucuk,
      'BOYUT_BYTE': ?instance.boyutByte,
      'ISLEM_KODU': ?instance.islemKodu,
    };

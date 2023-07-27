// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siparis_edit_reuqest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiparisEditRequestModel _$SiparisEditRequestModelFromJson(
        Map<String, dynamic> json) =>
    SiparisEditRequestModel(
      belgeNo: json['BelgeNo'] as String?,
      belgeTuru: json['BelgeTuru'] as String?,
      cariKodu: json['CariKodu'] as String?,
      ekranTipi: json['EkranTipi'] as String?,
      kayitModu: json['KayitModu'] as String?,
      kisitYok: json['KisitYok'] as bool?,
      tempBelgeId: json['TempBelgeId'] as int?,
    );

Map<String, dynamic> _$SiparisEditRequestModelToJson(
        SiparisEditRequestModel instance) =>
    <String, dynamic>{
      'BelgeNo': instance.belgeNo,
      'BelgeTuru': instance.belgeTuru,
      'CariKodu': instance.cariKodu,
      'EkranTipi': instance.ekranTipi,
      'KayitModu': instance.kayitModu,
      'KisitYok': instance.kisitYok,
      'TempBelgeId': instance.tempBelgeId,
    };

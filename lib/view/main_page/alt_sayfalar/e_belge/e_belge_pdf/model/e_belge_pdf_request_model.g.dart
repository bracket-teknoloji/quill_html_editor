// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_belge_pdf_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EBelgePdfRequestModel _$EBelgePdfRequestModelFromJson(
  Map<String, dynamic> json,
) => _EBelgePdfRequestModel(
  belgeTuru: json['BELGE_TURU'] as String?,
  ebelgeTuru: json['EBELGE_TURU'] as String?,
  islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
  resmiBelgeNo: json['RESMI_BELGE_NO'] as String?,
);

Map<String, dynamic> _$EBelgePdfRequestModelToJson(
  _EBelgePdfRequestModel instance,
) => <String, dynamic>{
  'BELGE_TURU': ?instance.belgeTuru,
  'EBELGE_TURU': ?instance.ebelgeTuru,
  'ISLEM_KODU': ?instance.islemKodu,
  'RESMI_BELGE_NO': ?instance.resmiBelgeNo,
};

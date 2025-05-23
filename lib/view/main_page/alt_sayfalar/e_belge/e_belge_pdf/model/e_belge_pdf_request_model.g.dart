// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_belge_pdf_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EBelgePdfRequestModelImpl _$$EBelgePdfRequestModelImplFromJson(Map<String, dynamic> json) =>
    _$EBelgePdfRequestModelImpl(
      belgeTuru: json['BELGE_TURU'] as String?,
      ebelgeTuru: json['EBELGE_TURU'] as String?,
      islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
      resmiBelgeNo: json['RESMI_BELGE_NO'] as String?,
    );

Map<String, dynamic> _$$EBelgePdfRequestModelImplToJson(_$EBelgePdfRequestModelImpl instance) => <String, dynamic>{
  if (instance.belgeTuru case final value?) 'BELGE_TURU': value,
  if (instance.ebelgeTuru case final value?) 'EBELGE_TURU': value,
  if (instance.islemKodu case final value?) 'ISLEM_KODU': value,
  if (instance.resmiBelgeNo case final value?) 'RESMI_BELGE_NO': value,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_belge_pdf_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EBelgePdfRequestModelImpl _$$EBelgePdfRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EBelgePdfRequestModelImpl(
      belgeTuru: json['BELGE_TURU'] as String?,
      ebelgeTuru: json['EBELGE_TURU'] as String?,
      islemKodu: json['ISLEM_KODU'] as int?,
      resmiBelgeNo: json['RESMI_BELGE_NO'] as String?,
    );

Map<String, dynamic> _$$EBelgePdfRequestModelImplToJson(
    _$EBelgePdfRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BELGE_TURU', instance.belgeTuru);
  writeNotNull('EBELGE_TURU', instance.ebelgeTuru);
  writeNotNull('ISLEM_KODU', instance.islemKodu);
  writeNotNull('RESMI_BELGE_NO', instance.resmiBelgeNo);
  return val;
}

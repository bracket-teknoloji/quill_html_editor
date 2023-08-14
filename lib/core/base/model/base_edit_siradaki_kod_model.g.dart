// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_edit_siradaki_kod_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseEditSiradakiKodModel _$BaseEditSiradakiKodModelFromJson(
        Map<String, dynamic> json) =>
    BaseEditSiradakiKodModel()..siradakiKod = json['SIRADAKI_KOD'] as String?;

Map<String, dynamic> _$BaseEditSiradakiKodModelToJson(
    BaseEditSiradakiKodModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SIRADAKI_KOD', instance.siradakiKod);
  return val;
}

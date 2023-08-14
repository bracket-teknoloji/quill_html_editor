// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_fatura_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeleteFaturaModel _$$_DeleteFaturaModelFromJson(Map<String, dynamic> json) =>
    _$_DeleteFaturaModel(
      belgeTipi: json['BelgeTipi'] as int?,
      pickerBelgeTuru: json['PickerBelgeTuru'] as String?,
      remoteTempBelge: json['REMOTE_TEMP_BELGE'] as bool?,
      tempBelgeId: json['TEMP_BELGE_ID'] as int?,
      tipi: json['TIPI'] as int?,
      belgeNo: json['BELGE_NO'] as String?,
      belgeTuru: json['BELGE_TURU'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
      islemId: json['ISLEM_ID'] as String?,
      mevcutBelgeNo: json['MEVCUT_BELGE_NO'] as String?,
      mevcutCariKodu: json['MEVCUT_CARI_KODU'] as String?,
      paramMap: json['PARAM_MAP'] as String?,
      tag: json['TAG'] as String?,
    );

Map<String, dynamic> _$$_DeleteFaturaModelToJson(
    _$_DeleteFaturaModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BelgeTipi', instance.belgeTipi);
  writeNotNull('PickerBelgeTuru', instance.pickerBelgeTuru);
  writeNotNull('REMOTE_TEMP_BELGE', instance.remoteTempBelge);
  writeNotNull('TEMP_BELGE_ID', instance.tempBelgeId);
  writeNotNull('TIPI', instance.tipi);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('BELGE_TURU', instance.belgeTuru);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('ISLEM_ID', instance.islemId);
  writeNotNull('MEVCUT_BELGE_NO', instance.mevcutBelgeNo);
  writeNotNull('MEVCUT_CARI_KODU', instance.mevcutCariKodu);
  writeNotNull('PARAM_MAP', instance.paramMap);
  writeNotNull('TAG', instance.tag);
  return val;
}

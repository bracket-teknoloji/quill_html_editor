// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_fatura_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditFaturaModelImpl _$$EditFaturaModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EditFaturaModelImpl(
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
      yeniBelgeNo: json['YENI_BELGE_NO'] as String?,
      mevcutCariKodu: json['MEVCUT_CARI_KODU'] as String?,
      paramMap: json['PARAM_MAP'] as String?,
      tag: json['TAG'] as String?,
      islemKodu: json['ISLEM_KODU'] as int?,
      kalemler: (json['KALEMLER'] as List<dynamic>?)
          ?.map((e) => KalemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EditFaturaModelImplToJson(
    _$EditFaturaModelImpl instance) {
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
  writeNotNull('YENI_BELGE_NO', instance.yeniBelgeNo);
  writeNotNull('MEVCUT_CARI_KODU', instance.mevcutCariKodu);
  writeNotNull('PARAM_MAP', instance.paramMap);
  writeNotNull('TAG', instance.tag);
  writeNotNull('ISLEM_KODU', instance.islemKodu);
  writeNotNull('KALEMLER', instance.kalemler?.map((e) => e.toJson()).toList());
  return val;
}

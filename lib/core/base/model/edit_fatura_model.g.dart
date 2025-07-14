// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_fatura_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EditFaturaModel _$EditFaturaModelFromJson(Map<String, dynamic> json) => _EditFaturaModel(
  belgeTipi: (json['BelgeTipi'] as num?)?.toInt(),
  pickerBelgeTuru: json['PickerBelgeTuru'] as String?,
  remoteTempBelge: json['REMOTE_TEMP_BELGE'] as bool?,
  tempBelgeId: (json['TEMP_BELGE_ID'] as num?)?.toInt(),
  tipi: (json['TIPI'] as num?)?.toInt(),
  belgeNo: json['BELGE_NO'] as String?,
  belgeTuru: json['BELGE_TURU'] as String?,
  cariKodu: json['CARI_KODU'] as String?,
  islemId: json['ISLEM_ID'] as String?,
  mevcutBelgeNo: json['MEVCUT_BELGE_NO'] as String?,
  yeniBelgeNo: json['YENI_BELGE_NO'] as String?,
  yeniCariKodu: json['YENI_CARI_KODU'] as String?,
  mevcutCariKodu: json['MEVCUT_CARI_KODU'] as String?,
  paramMap: json['PARAM_MAP'] as Map<String, dynamic>? ?? const {},
  tag: json['TAG'] as String? ?? "FaturaModel",
  islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
  kalemler: (json['KALEMLER'] as List<dynamic>?)?.map((e) => KalemModel.fromJson(e as Map<String, dynamic>)).toList(),
  irsaliyedenFatura: json['IRSALIYEDEN_FATURA'] as bool?,
  resmiBelgeNo: json['RESMI_BELGE_NO'] as String?,
  tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
);

Map<String, dynamic> _$EditFaturaModelToJson(
  _EditFaturaModel instance,
) => <String, dynamic>{
  if (instance.belgeTipi case final value?) 'BelgeTipi': value,
  if (instance.pickerBelgeTuru case final value?) 'PickerBelgeTuru': value,
  if (instance.remoteTempBelge case final value?) 'REMOTE_TEMP_BELGE': value,
  if (instance.tempBelgeId case final value?) 'TEMP_BELGE_ID': value,
  if (instance.tipi case final value?) 'TIPI': value,
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.belgeTuru case final value?) 'BELGE_TURU': value,
  if (instance.cariKodu case final value?) 'CARI_KODU': value,
  if (instance.islemId case final value?) 'ISLEM_ID': value,
  if (instance.mevcutBelgeNo case final value?) 'MEVCUT_BELGE_NO': value,
  if (instance.yeniBelgeNo case final value?) 'YENI_BELGE_NO': value,
  if (instance.yeniCariKodu case final value?) 'YENI_CARI_KODU': value,
  if (instance.mevcutCariKodu case final value?) 'MEVCUT_CARI_KODU': value,
  if (instance.paramMap case final value?) 'PARAM_MAP': value,
  if (instance.tag case final value?) 'TAG': value,
  if (instance.islemKodu case final value?) 'ISLEM_KODU': value,
  if (instance.kalemler?.map((e) => e.toJson()).toList() case final value?) 'KALEMLER': value,
  if (instance.irsaliyedenFatura case final value?) 'IRSALIYEDEN_FATURA': value,
  if (instance.resmiBelgeNo case final value?) 'RESMI_BELGE_NO': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
};

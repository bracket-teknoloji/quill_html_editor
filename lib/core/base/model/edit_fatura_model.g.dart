// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_fatura_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EditFaturaModel _$EditFaturaModelFromJson(Map<String, dynamic> json) =>
    _EditFaturaModel(
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
      kalemler: (json['KALEMLER'] as List<dynamic>?)
          ?.map((e) => KalemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      irsaliyedenFatura: json['IRSALIYEDEN_FATURA'] as bool?,
      resmiBelgeNo: json['RESMI_BELGE_NO'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
    );

Map<String, dynamic> _$EditFaturaModelToJson(_EditFaturaModel instance) =>
    <String, dynamic>{
      'BelgeTipi': ?instance.belgeTipi,
      'PickerBelgeTuru': ?instance.pickerBelgeTuru,
      'REMOTE_TEMP_BELGE': ?instance.remoteTempBelge,
      'TEMP_BELGE_ID': ?instance.tempBelgeId,
      'TIPI': ?instance.tipi,
      'BELGE_NO': ?instance.belgeNo,
      'BELGE_TURU': ?instance.belgeTuru,
      'CARI_KODU': ?instance.cariKodu,
      'ISLEM_ID': ?instance.islemId,
      'MEVCUT_BELGE_NO': ?instance.mevcutBelgeNo,
      'YENI_BELGE_NO': ?instance.yeniBelgeNo,
      'YENI_CARI_KODU': ?instance.yeniCariKodu,
      'MEVCUT_CARI_KODU': ?instance.mevcutCariKodu,
      'PARAM_MAP': ?instance.paramMap,
      'TAG': ?instance.tag,
      'ISLEM_KODU': ?instance.islemKodu,
      'KALEMLER': ?instance.kalemler?.map((e) => e.toJson()).toList(),
      'IRSALIYEDEN_FATURA': ?instance.irsaliyedenFatura,
      'RESMI_BELGE_NO': ?instance.resmiBelgeNo,
      'TARIH': ?instance.tarih?.toIso8601String(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dekont_islemler_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DekontIslemlerRequestModel _$DekontIslemlerRequestModelFromJson(
  Map<String, dynamic> json,
) => _DekontIslemlerRequestModel(
  dekontIslemTuru: json['DEKONT_ISLEM_TURU'] as String?,
  dekontSeri: json['DEKONT_SERI'] as String?,
  guid: json['GUID'] as String?,
  kalemler: (json['KALEMLER'] as List<dynamic>?)
      ?.map((e) => DekontKalemler.fromJson(e as Map<String, dynamic>))
      .toList(),
  plasiyerKodu: json['PLASIYER_KODU'] as String?,
  projeKodu: json['PROJE_KODU'] as String?,
  tag: json['TAG'] as String? ?? "DekontModel",
  tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
  yeniKayit: json['_YeniKayit'] as bool?,
  dekontNo: (json['DEKONT_NO'] as num?)?.toInt(),
);

Map<String, dynamic> _$DekontIslemlerRequestModelToJson(
  _DekontIslemlerRequestModel instance,
) => <String, dynamic>{
  if (instance.dekontIslemTuru case final value?) 'DEKONT_ISLEM_TURU': value,
  if (instance.dekontSeri case final value?) 'DEKONT_SERI': value,
  if (instance.guid case final value?) 'GUID': value,
  if (instance.kalemler?.map((e) => e.toJson()).toList() case final value?) 'KALEMLER': value,
  if (instance.plasiyerKodu case final value?) 'PLASIYER_KODU': value,
  if (instance.projeKodu case final value?) 'PROJE_KODU': value,
  if (instance.tag case final value?) 'TAG': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
  if (instance.yeniKayit case final value?) '_YeniKayit': value,
  if (instance.dekontNo case final value?) 'DEKONT_NO': value,
};

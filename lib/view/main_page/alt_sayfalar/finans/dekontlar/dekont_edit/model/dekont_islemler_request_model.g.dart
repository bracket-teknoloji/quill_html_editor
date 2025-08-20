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
  'DEKONT_ISLEM_TURU': ?instance.dekontIslemTuru,
  'DEKONT_SERI': ?instance.dekontSeri,
  'GUID': ?instance.guid,
  'KALEMLER': ?instance.kalemler?.map((e) => e.toJson()).toList(),
  'PLASIYER_KODU': ?instance.plasiyerKodu,
  'PROJE_KODU': ?instance.projeKodu,
  'TAG': ?instance.tag,
  'TARIH': ?instance.tarih?.toIso8601String(),
  '_YeniKayit': ?instance.yeniKayit,
  'DEKONT_NO': ?instance.dekontNo,
};

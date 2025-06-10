// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_fiyat_ozeti_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StokFiyatOzetiRequestModel _$StokFiyatOzetiRequestModelFromJson(
  Map<String, dynamic> json,
) => _StokFiyatOzetiRequestModel(
  yapKod: json['YapKod'] as String?,
  cariKodu: json['CariKodu'] as String?,
  stokKodu: json['StokKodu'] as String?,
);

Map<String, dynamic> _$StokFiyatOzetiRequestModelToJson(
  _StokFiyatOzetiRequestModel instance,
) => <String, dynamic>{
  if (instance.yapKod case final value?) 'YapKod': value,
  if (instance.cariKodu case final value?) 'CariKodu': value,
  if (instance.stokKodu case final value?) 'StokKodu': value,
};

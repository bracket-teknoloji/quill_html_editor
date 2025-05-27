// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_fiyat_ozeti_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StokFiyatOzetiRequestModelImpl _$$StokFiyatOzetiRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StokFiyatOzetiRequestModelImpl(
      yapKod: json['YapKod'] as String?,
      cariKodu: json['CariKodu'] as String?,
      stokKodu: json['StokKodu'] as String?,
    );

Map<String, dynamic> _$$StokFiyatOzetiRequestModelImplToJson(
        _$StokFiyatOzetiRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.yapKod case final value?) 'YapKod': value,
      if (instance.cariKodu case final value?) 'CariKodu': value,
      if (instance.stokKodu case final value?) 'StokKodu': value,
    };

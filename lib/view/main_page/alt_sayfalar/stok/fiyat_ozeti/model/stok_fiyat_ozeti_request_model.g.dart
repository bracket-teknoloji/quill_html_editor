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
    _$StokFiyatOzetiRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('YapKod', instance.yapKod);
  writeNotNull('CariKodu', instance.cariKodu);
  writeNotNull('StokKodu', instance.stokKodu);
  return val;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_emri_hammadde_takibi_detay_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IsEmriHammaddeTakibiDetayRequestModelImpl
    _$$IsEmriHammaddeTakibiDetayRequestModelImplFromJson(
            Map<String, dynamic> json) =>
        _$IsEmriHammaddeTakibiDetayRequestModelImpl(
          takipno: (json['TAKIPNO'] as num?)?.toInt(),
          tip: json['TIP'] as String?,
          barcode: json['BARCODE'] as String?,
          islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
          referansStokKodu: json['REFERANS_STOK_KODU'] as String?,
        );

Map<String, dynamic> _$$IsEmriHammaddeTakibiDetayRequestModelImplToJson(
    _$IsEmriHammaddeTakibiDetayRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TAKIPNO', instance.takipno);
  writeNotNull('TIP', instance.tip);
  writeNotNull('BARCODE', instance.barcode);
  writeNotNull('ISLEM_KODU', instance.islemKodu);
  writeNotNull('REFERANS_STOK_KODU', instance.referansStokKodu);
  return val;
}

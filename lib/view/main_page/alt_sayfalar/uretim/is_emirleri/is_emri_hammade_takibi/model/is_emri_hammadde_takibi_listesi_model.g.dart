// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_emri_hammadde_takibi_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IsEmriHammaddeTakibiListesiModelImpl
    _$$IsEmriHammaddeTakibiListesiModelImplFromJson(
            Map<String, dynamic> json) =>
        _$IsEmriHammaddeTakibiListesiModelImpl(
          takipno: (json['TAKIPNO'] as num?)?.toInt(),
          nfisemrino: (json['NFISEMRINO'] as num?)?.toInt(),
          isemrino: json['ISEMRINO'] as String?,
          stokKodu: json['STOK_KODU'] as String?,
          stokAdi: json['STOK_ADI'] as String?,
          yapkod: json['YAPKOD'] as String?,
          yapacik: json['YAPACIK'] as String?,
          makineKodu: json['MAKINE_KODU'] as String?,
          miktar: (json['MIKTAR'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$$IsEmriHammaddeTakibiListesiModelImplToJson(
    _$IsEmriHammaddeTakibiListesiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TAKIPNO', instance.takipno);
  writeNotNull('NFISEMRINO', instance.nfisemrino);
  writeNotNull('ISEMRINO', instance.isemrino);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('YAPKOD', instance.yapkod);
  writeNotNull('YAPACIK', instance.yapacik);
  writeNotNull('MAKINE_KODU', instance.makineKodu);
  writeNotNull('MIKTAR', instance.miktar);
  return val;
}

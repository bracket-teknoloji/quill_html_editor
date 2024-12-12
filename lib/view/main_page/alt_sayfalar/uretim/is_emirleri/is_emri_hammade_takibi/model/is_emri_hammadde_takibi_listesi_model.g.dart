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
        _$IsEmriHammaddeTakibiListesiModelImpl instance) =>
    <String, dynamic>{
      if (instance.takipno case final value?) 'TAKIPNO': value,
      if (instance.nfisemrino case final value?) 'NFISEMRINO': value,
      if (instance.isemrino case final value?) 'ISEMRINO': value,
      if (instance.stokKodu case final value?) 'STOK_KODU': value,
      if (instance.stokAdi case final value?) 'STOK_ADI': value,
      if (instance.yapkod case final value?) 'YAPKOD': value,
      if (instance.yapacik case final value?) 'YAPACIK': value,
      if (instance.makineKodu case final value?) 'MAKINE_KODU': value,
      if (instance.miktar case final value?) 'MIKTAR': value,
    };

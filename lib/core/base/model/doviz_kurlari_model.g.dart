// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doviz_kurlari_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DovizKurlariModelImpl _$$DovizKurlariModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DovizKurlariModelImpl(
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      sira: json['SIRA'] as int?,
      dovizTipi: json['DOVIZ_TIPI'] as int?,
      dovAlis: (json['DOV_ALIS'] as num?)?.toDouble(),
      dovSatis: (json['DOV_SATIS'] as num?)?.toDouble(),
      dovizAdi: json['DOVIZ_ADI'] as String?,
      effAlis: (json['EFF_ALIS'] as num?)?.toDouble(),
      effSatis: (json['EFF_SATIS'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DovizKurlariModelImplToJson(
    _$DovizKurlariModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('SIRA', instance.sira);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('DOV_ALIS', instance.dovAlis);
  writeNotNull('DOV_SATIS', instance.dovSatis);
  writeNotNull('DOVIZ_ADI', instance.dovizAdi);
  writeNotNull('EFF_ALIS', instance.effAlis);
  writeNotNull('EFF_SATIS', instance.effSatis);
  return val;
}

_$DovizKurlariRequestModelImpl _$$DovizKurlariRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DovizKurlariRequestModelImpl(
      tarih: json['Tarih'] == null
          ? null
          : DateTime.parse(json['Tarih'] as String),
      sira: json['Sira'] as int?,
      dovizTipi: json['DovizTipi'] as int?,
      alis: (json['Alis'] as num?)?.toDouble(),
      satis: (json['Satis'] as num?)?.toDouble(),
      dovizAdi: json['DovizAdi'] as String?,
      eFAlis: (json['EFAlis'] as num?)?.toDouble(),
      eFSatis: (json['EFSatis'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DovizKurlariRequestModelImplToJson(
    _$DovizKurlariRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Tarih', instance.tarih?.toIso8601String());
  writeNotNull('Sira', instance.sira);
  writeNotNull('DovizTipi', instance.dovizTipi);
  writeNotNull('Alis', instance.alis);
  writeNotNull('Satis', instance.satis);
  writeNotNull('DovizAdi', instance.dovizAdi);
  writeNotNull('EFAlis', instance.eFAlis);
  writeNotNull('EFSatis', instance.eFSatis);
  return val;
}

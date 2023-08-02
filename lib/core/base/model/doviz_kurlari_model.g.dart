// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doviz_kurlari_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DovizKurlariModel _$DovizKurlariModelFromJson(Map<String, dynamic> json) =>
    DovizKurlariModel()
      ..tarih =
          json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String)
      ..sira = json['SIRA'] as int?
      ..dovizTipi = json['DOVIZ_TIPI'] as int?
      ..dovAlis = (json['DOV_ALIS'] as num?)?.toDouble()
      ..dovSatis = (json['DOV_SATIS'] as num?)?.toDouble()
      ..dovizAdi = json['DOVIZ_ADI'] as String?
      ..effAlis = (json['EFF_ALIS'] as num?)?.toDouble()
      ..effSatis = (json['EFF_SATIS'] as num?)?.toDouble();

Map<String, dynamic> _$DovizKurlariModelToJson(DovizKurlariModel instance) {
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

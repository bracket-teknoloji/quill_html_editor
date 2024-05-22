// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_hareketleri_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HucreHareketleriRequestModelImpl _$$HucreHareketleriRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HucreHareketleriRequestModelImpl(
      ekranTipi: json['EkranTipi'] as String?,
      filtreKodu: (json['FiltreKodu'] as num?)?.toInt(),
      stokKodu: json['StokKodu'] as String?,
    );

Map<String, dynamic> _$$HucreHareketleriRequestModelImplToJson(
    _$HucreHareketleriRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EkranTipi', instance.ekranTipi);
  writeNotNull('FiltreKodu', instance.filtreKodu);
  writeNotNull('StokKodu', instance.stokKodu);
  return val;
}

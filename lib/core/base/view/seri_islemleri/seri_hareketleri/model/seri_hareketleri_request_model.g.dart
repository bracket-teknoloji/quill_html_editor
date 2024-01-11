// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_hareketleri_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeriHareketleriRequestModelImpl _$$SeriHareketleriRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SeriHareketleriRequestModelImpl(
      stokKodu: json['StokKodu'] as String?,
      sirala: json['Sirala'] as String?,
    );

Map<String, dynamic> _$$SeriHareketleriRequestModelImplToJson(
    _$SeriHareketleriRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StokKodu', instance.stokKodu);
  writeNotNull('Sirala', instance.sirala);
  return val;
}

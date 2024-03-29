// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_girisi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OlcumGirisiRequestModelImpl _$$OlcumGirisiRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OlcumGirisiRequestModelImpl(
      durum: json['DURUM'] as int?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      bastar: json['BASTAR'] as String?,
      bittar: json['BITTAR'] as String?,
    );

Map<String, dynamic> _$$OlcumGirisiRequestModelImplToJson(
    _$OlcumGirisiRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DURUM', instance.durum);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('BASTAR', instance.bastar);
  writeNotNull('BITTAR', instance.bittar);
  return val;
}

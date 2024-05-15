// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_girisi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OlcumGirisiRequestModelImpl _$$OlcumGirisiRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OlcumGirisiRequestModelImpl(
      durum: (json['DURUM'] as num?)?.toInt(),
      belgeTipi: json['BELGE_TIPI'] as String?,
      bastar: json['BASTAR'] as String?,
      bittar: json['BITTAR'] as String?,
      siralama: json['SIRALAMA'] as String?,
      qrstring: json['QRSTRING'] as String?,
      searchText: json['SearchText'] as String?,
      sayfa: (json['Sayfa'] as num?)?.toInt(),
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
  writeNotNull('SIRALAMA', instance.siralama);
  writeNotNull('QRSTRING', instance.qrstring);
  writeNotNull('SearchText', instance.searchText);
  writeNotNull('Sayfa', instance.sayfa);
  return val;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dekont_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DekontRequestModelImpl _$$DekontRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DekontRequestModelImpl(
      sayfa: (json['Sayfa'] as num?)?.toInt(),
      ekranTipi: json['EkranTipi'] as String? ?? "L",
      searchText: json['SearchText'] as String?,
    );

Map<String, dynamic> _$$DekontRequestModelImplToJson(
    _$DekontRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Sayfa', instance.sayfa);
  writeNotNull('EkranTipi', instance.ekranTipi);
  writeNotNull('SearchText', instance.searchText);
  return val;
}

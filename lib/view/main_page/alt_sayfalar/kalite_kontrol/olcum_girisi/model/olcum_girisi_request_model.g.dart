// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_girisi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OlcumGirisiRequestModelImpl _$$OlcumGirisiRequestModelImplFromJson(Map<String, dynamic> json) =>
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

Map<String, dynamic> _$$OlcumGirisiRequestModelImplToJson(_$OlcumGirisiRequestModelImpl instance) => <String, dynamic>{
  if (instance.durum case final value?) 'DURUM': value,
  if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
  if (instance.bastar case final value?) 'BASTAR': value,
  if (instance.bittar case final value?) 'BITTAR': value,
  if (instance.siralama case final value?) 'SIRALAMA': value,
  if (instance.qrstring case final value?) 'QRSTRING': value,
  if (instance.searchText case final value?) 'SearchText': value,
  if (instance.sayfa case final value?) 'Sayfa': value,
};

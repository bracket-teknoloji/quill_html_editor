// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ek_rehber_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EkRehberRequestModelImpl _$$EkRehberRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EkRehberRequestModelImpl(
      belgeNo: json['BelgeNo'] as String?,
      belgeTarihi: json['BelgeTarihi'] == null
          ? null
          : DateTime.parse(json['BelgeTarihi'] as String),
      belgeTipi: json['BelgeTipi'] as String?,
      cariKodu: json['CariKodu'] as String?,
      stokKodu: json['StokKodu'] as String?,
      id: (json['ID'] as num?)?.toInt(),
      rehberKodu: (json['RehberKodu'] as num?)?.toInt(),
      yapkod: json['Yapkod'] as String?,
      params: json['PARAMS'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$EkRehberRequestModelImplToJson(
    _$EkRehberRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BelgeNo', instance.belgeNo);
  writeNotNull('BelgeTarihi', instance.belgeTarihi?.toIso8601String());
  writeNotNull('BelgeTipi', instance.belgeTipi);
  writeNotNull('CariKodu', instance.cariKodu);
  writeNotNull('StokKodu', instance.stokKodu);
  writeNotNull('ID', instance.id);
  writeNotNull('RehberKodu', instance.rehberKodu);
  writeNotNull('Yapkod', instance.yapkod);
  writeNotNull('PARAMS', instance.params);
  return val;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siradaki_belge_no_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiradakiBelgeNoModel _$SiradakiBelgeNoModelFromJson(Map<String, dynamic> json) => SiradakiBelgeNoModel(
      seri: json['Seri'] as String?,
      belgeTipi: json['BelgeTipi'] as String?,
      eIrsaliye: json['EIrsaliye'] as String?,
      cariKodu: json['CariKodu'] as String?,
      belgeNo: json['BelgeNo'] as String?,
    );

Map<String, dynamic> _$SiradakiBelgeNoModelToJson(SiradakiBelgeNoModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Seri', instance.seri);
  writeNotNull('BelgeTipi', instance.belgeTipi);
  writeNotNull('EIrsaliye', instance.eIrsaliye);
  writeNotNull('CariKodu', instance.cariKodu);
  writeNotNull('BelgeNo', instance.belgeNo);
  return val;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serbest_rapor_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerbestRaporResponseModel _$SerbestRaporResponseModelFromJson(Map<String, dynamic> json) => SerbestRaporResponseModel()
  ..adi = json['ADI'] as String?
  ..bosGecilebilir = json['BOS_GECILEBILIR'] as bool?
  ..tipi = json['TIPI'] as String?
  ..deger = json['DEGER'] as String?
  ..rehberTipi = json['REHBER_TIPI'] as String?
  ..paramMap = json['PARAM_MAP'] as Map<String, dynamic>?;

Map<String, dynamic> _$SerbestRaporResponseModelToJson(SerbestRaporResponseModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ADI', instance.adi);
  writeNotNull('BOS_GECILEBILIR', instance.bosGecilebilir);
  writeNotNull('TIPI', instance.tipi);
  writeNotNull('DEGER', instance.deger);
  writeNotNull('REHBER_TIPI', instance.rehberTipi);
  writeNotNull('PARAM_MAP', instance.paramMap);
  return val;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_takibi_stoklar_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HucreTakibiStoklarRequestModelImpl
    _$$HucreTakibiStoklarRequestModelImplFromJson(Map<String, dynamic> json) =>
        _$HucreTakibiStoklarRequestModelImpl(
          depoKodu: (json['DepoKodu'] as num?)?.toInt(),
          islemTuru: json['IslemTuru'] as String?,
          cariKodu: json['CariKodu'] as String?,
          pickerBelgeTuru: json['PickerBelgeTuru'] as String?,
          stokKodu: json['StokKodu'] as String?,
          belgeNo: json['BelgeNo'] as String?,
        );

Map<String, dynamic> _$$HucreTakibiStoklarRequestModelImplToJson(
    _$HucreTakibiStoklarRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DepoKodu', instance.depoKodu);
  writeNotNull('IslemTuru', instance.islemTuru);
  writeNotNull('CariKodu', instance.cariKodu);
  writeNotNull('PickerBelgeTuru', instance.pickerBelgeTuru);
  writeNotNull('StokKodu', instance.stokKodu);
  writeNotNull('BelgeNo', instance.belgeNo);
  return val;
}

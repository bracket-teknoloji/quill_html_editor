// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_raporu_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UretimSonuRaporuRequestModelImpl _$$UretimSonuRaporuRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UretimSonuRaporuRequestModelImpl(
      belgeNo: json['BelgeNo'] as String?,
      filtreKodu: (json['FiltreKodu'] as num?)?.toInt(),
      stokKodu: json['StokKodu'] as String?,
    );

Map<String, dynamic> _$$UretimSonuRaporuRequestModelImplToJson(
    _$UretimSonuRaporuRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BelgeNo', instance.belgeNo);
  writeNotNull('FiltreKodu', instance.filtreKodu);
  writeNotNull('StokKodu', instance.stokKodu);
  return val;
}

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
        _$UretimSonuRaporuRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.belgeNo case final value?) 'BelgeNo': value,
      if (instance.filtreKodu case final value?) 'FiltreKodu': value,
      if (instance.stokKodu case final value?) 'StokKodu': value,
    };

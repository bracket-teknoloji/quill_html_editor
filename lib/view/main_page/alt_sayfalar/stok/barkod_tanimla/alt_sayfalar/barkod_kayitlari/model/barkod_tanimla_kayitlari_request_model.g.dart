// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barkod_tanimla_kayitlari_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BarkodTanimlaKayitlariRequestModelImpl
    _$$BarkodTanimlaKayitlariRequestModelImplFromJson(
            Map<String, dynamic> json) =>
        _$BarkodTanimlaKayitlariRequestModelImpl(
          stokKodu: json['StokKodu'] as String?,
          kayitTipi: json['KayitTipi'] as String?,
        );

Map<String, dynamic> _$$BarkodTanimlaKayitlariRequestModelImplToJson(
        _$BarkodTanimlaKayitlariRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.stokKodu case final value?) 'StokKodu': value,
      if (instance.kayitTipi case final value?) 'KayitTipi': value,
    };

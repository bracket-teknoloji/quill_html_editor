// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_islemleri_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankaIslemleriRequestModelImpl _$$BankaIslemleriRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BankaIslemleriRequestModelImpl(
      baslamaTarihi: json['BaslamaTarihi'] as String?,
      bitisTarihi: json['BitisTarihi'] as String?,
      menuKodu: json['MenuKodu'] as String?,
      hesapTipi: json['HesapTipi'] as String?,
      hesapKodu: json['HesapKodu'] as String?,
    );

Map<String, dynamic> _$$BankaIslemleriRequestModelImplToJson(
        _$BankaIslemleriRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.baslamaTarihi case final value?) 'BaslamaTarihi': value,
      if (instance.bitisTarihi case final value?) 'BitisTarihi': value,
      if (instance.menuKodu case final value?) 'MenuKodu': value,
      if (instance.hesapTipi case final value?) 'HesapTipi': value,
      if (instance.hesapKodu case final value?) 'HesapKodu': value,
    };

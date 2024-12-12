// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'masraf_kodu_rehberi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MasrafKoduRehberiModelImpl _$$MasrafKoduRehberiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MasrafKoduRehberiModelImpl(
      masrafKodu: json['MASRAF_KODU'] as String?,
      masrafAdi: json['MASRAF_ADI'] as String?,
    );

Map<String, dynamic> _$$MasrafKoduRehberiModelImplToJson(
        _$MasrafKoduRehberiModelImpl instance) =>
    <String, dynamic>{
      if (instance.masrafKodu case final value?) 'MASRAF_KODU': value,
      if (instance.masrafAdi case final value?) 'MASRAF_ADI': value,
    };

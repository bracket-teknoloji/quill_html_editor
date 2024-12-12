// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sayilan_kalemler_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SayilanKalemlerRequestModelImpl _$$SayilanKalemlerRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SayilanKalemlerRequestModelImpl(
      filtreKodu: (json['FiltreKodu'] as num?)?.toInt(),
      depoKodu: (json['DepoKodu'] as num?)?.toInt(),
      kullaniciAdi: json['KullaniciAdi'] as String?,
      ekranTipi: json['EkranTipi'] as String? ?? "L",
      belgeNo: json['BelgeNo'] as String?,
      seriBazinda: json['seriBazinda'] as String?,
      id: (json['ID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SayilanKalemlerRequestModelImplToJson(
        _$SayilanKalemlerRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.filtreKodu case final value?) 'FiltreKodu': value,
      if (instance.depoKodu case final value?) 'DepoKodu': value,
      if (instance.kullaniciAdi case final value?) 'KullaniciAdi': value,
      if (instance.ekranTipi case final value?) 'EkranTipi': value,
      if (instance.belgeNo case final value?) 'BelgeNo': value,
      if (instance.seriBazinda case final value?) 'seriBazinda': value,
      if (instance.id case final value?) 'ID': value,
    };

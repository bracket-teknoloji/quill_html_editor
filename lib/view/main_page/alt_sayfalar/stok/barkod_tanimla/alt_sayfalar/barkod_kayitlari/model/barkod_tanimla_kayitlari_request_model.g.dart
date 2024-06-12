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
    _$BarkodTanimlaKayitlariRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StokKodu', instance.stokKodu);
  writeNotNull('KayitTipi', instance.kayitTipi);
  return val;
}

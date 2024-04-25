// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sayilan_kalemler_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SayilanKalemlerRequestModelImpl _$$SayilanKalemlerRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SayilanKalemlerRequestModelImpl(
      filtreKodu: json['FiltreKodu'] as String?,
      depoKodu: (json['DepoKodu'] as num?)?.toInt(),
      kullaniciAdi: json['KullaniciAdi'] as String?,
      ekranTipi: json['EkranTipi'] as String? ?? "L",
      belgeNo: json['BelgeNo'] as String?,
    );

Map<String, dynamic> _$$SayilanKalemlerRequestModelImplToJson(
    _$SayilanKalemlerRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FiltreKodu', instance.filtreKodu);
  writeNotNull('DepoKodu', instance.depoKodu);
  writeNotNull('KullaniciAdi', instance.kullaniciAdi);
  writeNotNull('EkranTipi', instance.ekranTipi);
  writeNotNull('BelgeNo', instance.belgeNo);
  return val;
}

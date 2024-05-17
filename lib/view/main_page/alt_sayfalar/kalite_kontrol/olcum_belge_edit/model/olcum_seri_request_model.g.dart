// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_seri_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OlcumSeriRequestModelImpl _$$OlcumSeriRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OlcumSeriRequestModelImpl(
      stokKodu: json['STOK_KODU'] as String?,
      girisDepo: (json['GIRIS_DEPO'] as num?)?.toInt(),
      cikisDepo: (json['CIKIS_DEPO'] as num?)?.toInt(),
      seriListe: (json['SERI_LISTE'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$OlcumSeriRequestModelImplToJson(
    _$OlcumSeriRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('GIRIS_DEPO', instance.girisDepo);
  writeNotNull('CIKIS_DEPO', instance.cikisDepo);
  writeNotNull('SERI_LISTE', instance.seriListe);
  return val;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucredeki_stoklar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HucredekiStoklarModelImpl _$$HucredekiStoklarModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HucredekiStoklarModelImpl(
      hucreKodu: json['HUCRE_KODU'] as String?,
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      netMiktar: (json['NET_MIKTAR'] as num?)?.toDouble(),
      yapkod: json['YAPKOD'] as String?,
      yapacik: json['YAPACIK'] as String?,
      bakiye: (json['BAKIYE'] as num?)?.toDouble(),
      olcuBirimi: json['OLCU_BIRIMI'] as String?,
    );

Map<String, dynamic> _$$HucredekiStoklarModelImplToJson(
    _$HucredekiStoklarModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HUCRE_KODU', instance.hucreKodu);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('NET_MIKTAR', instance.netMiktar);
  writeNotNull('YAPKOD', instance.yapkod);
  writeNotNull('YAPACIK', instance.yapacik);
  writeNotNull('BAKIYE', instance.bakiye);
  writeNotNull('OLCU_BIRIMI', instance.olcuBirimi);
  return val;
}

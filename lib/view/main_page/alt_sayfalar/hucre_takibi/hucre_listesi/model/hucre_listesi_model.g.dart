// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HucreListesiModelImpl _$$HucreListesiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HucreListesiModelImpl(
      hucreKodu: json['HUCRE_KODU'] as String?,
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      depoTanimi: json['DEPO_TANIMI'] as String?,
      seriList: json['SeriList'] as List<dynamic>?,
      eksiyeDusebilir: json['EKSIYE_DUSEBILIR'] as bool?,
    );

Map<String, dynamic> _$$HucreListesiModelImplToJson(
    _$HucreListesiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HUCRE_KODU', instance.hucreKodu);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('DEPO_TANIMI', instance.depoTanimi);
  writeNotNull('SeriList', instance.seriList);
  writeNotNull('EKSIYE_DUSEBILIR', instance.eksiyeDusebilir);
  return val;
}

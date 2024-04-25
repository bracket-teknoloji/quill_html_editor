// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeriModelImpl _$$SeriModelImplFromJson(Map<String, dynamic> json) =>
    _$SeriModelImpl(
      seriNo: json['SERI_NO'] as String?,
      aciklama: json['ACIKLAMA'] as String?,
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      miktar: (json['MIKTAR'] as num?)?.toInt(),
      depoTanimi: json['DEPO_TANIMI'] as String?,
    );

Map<String, dynamic> _$$SeriModelImplToJson(_$SeriModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SERI_NO', instance.seriNo);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('DEPO_TANIMI', instance.depoTanimi);
  return val;
}

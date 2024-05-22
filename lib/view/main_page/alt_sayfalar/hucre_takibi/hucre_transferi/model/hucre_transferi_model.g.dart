// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_transferi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HucreTransferiModelImpl _$$HucreTransferiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HucreTransferiModelImpl(
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      hedefHucre: json['HEDEF_HUCRE'] as String?,
      hucreKodu: json['HUCRE_KODU'] as String?,
      islemTuru: json['ISLEM_TURU'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toInt(),
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
    );

Map<String, dynamic> _$$HucreTransferiModelImplToJson(
    _$HucreTransferiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('HEDEF_HUCRE', instance.hedefHucre);
  writeNotNull('HUCRE_KODU', instance.hucreKodu);
  writeNotNull('ISLEM_TURU', instance.islemTuru);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  return val;
}

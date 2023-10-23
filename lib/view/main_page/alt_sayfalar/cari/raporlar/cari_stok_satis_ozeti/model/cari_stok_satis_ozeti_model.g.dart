// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_stok_satis_ozeti_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariStokSatisOzetiModel _$CariStokSatisOzetiModelFromJson(Map<String, dynamic> json) => CariStokSatisOzetiModel()
  ..stokKodu = json['STOK_KODU'] as String?
  ..miktar = (json['MIKTAR'] as num?)?.toDouble()
  ..tarih = json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String)
  ..stokAdi = json['STOK_ADI'] as String?
  ..olcuBirimAdi = json['OLCU_BIRIM_ADI'] as String?
  ..netTutar = (json['NET_TUTAR'] as num?)?.toDouble();

Map<String, dynamic> _$CariStokSatisOzetiModelToJson(CariStokSatisOzetiModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('OLCU_BIRIM_ADI', instance.olcuBirimAdi);
  writeNotNull('NET_TUTAR', instance.netTutar);
  return val;
}

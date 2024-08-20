// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_stok_satis_ozeti_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariStokSatisOzetiModel _$CariStokSatisOzetiModelFromJson(
        Map<String, dynamic> json) =>
    CariStokSatisOzetiModel()
      ..stokKodu = json['STOK_KODU'] as String?
      ..miktar = (json['MIKTAR'] as num?)?.toDouble()
      ..tarih =
          json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String)
      ..stokAdi = json['STOK_ADI'] as String?
      ..olcuBirimAdi = json['OLCU_BIRIM_ADI'] as String?
      ..netTutar = (json['NET_TUTAR'] as num?)?.toDouble()
      ..belgeTipi = json['BELGE_TIPI'] as String?
      ..dovizTipi = (json['DOVIZ_TIPI'] as num?)?.toInt()
      ..dovNetTutar = (json['DOV_NET_TUTAR'] as num?)?.toDouble()
      ..dovBrutTutar = (json['DOV_BRUT_TUTAR'] as num?)?.toDouble()
      ..dovizKuru = (json['DOVIZ_KURU'] as num?)?.toDouble()
      ..dovizAdi = json['DOVIZ_ADI'] as String?
      ..dovizSimge = json['DOVIZ_SIMGE'] as String?;

Map<String, dynamic> _$CariStokSatisOzetiModelToJson(
    CariStokSatisOzetiModel instance) {
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
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('DOV_NET_TUTAR', instance.dovNetTutar);
  writeNotNull('DOV_BRUT_TUTAR', instance.dovBrutTutar);
  writeNotNull('DOVIZ_KURU', instance.dovizKuru);
  writeNotNull('DOVIZ_ADI', instance.dovizAdi);
  writeNotNull('DOVIZ_SIMGE', instance.dovizSimge);
  return val;
}

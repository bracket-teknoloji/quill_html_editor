// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_takibi_stoklar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HucreTakibiStoklarModelImpl _$$HucreTakibiStoklarModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HucreTakibiStoklarModelImpl(
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      netMiktar: (json['NET_MIKTAR'] as num?)?.toDouble(),
      bakiye: (json['BAKIYE'] as num?)?.toDouble(),
      belgeOlcuBirimKodu: (json['BELGE_OLCU_BIRIM_KODU'] as num?)?.toInt(),
      belgeOlcuBirimAdi: json['BELGE_OLCU_BIRIM_ADI'] as String?,
      stokOlcuBirimi1: json['STOK_OLCU_BIRIMI1'] as String?,
      kalemSayisi: (json['KALEM_SAYISI'] as num?)?.toInt(),
      hucreKodu: json['HUCRE_KODU'] as String?,
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      yapkod: json['YAPKOD'] as String?,
      yapacik: json['YAPACIK'] as String?,
      olcuBirimi: json['OLCU_BIRIMI'] as String?,
    );

Map<String, dynamic> _$$HucreTakibiStoklarModelImplToJson(
    _$HucreTakibiStoklarModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('NET_MIKTAR', instance.netMiktar);
  writeNotNull('BAKIYE', instance.bakiye);
  writeNotNull('BELGE_OLCU_BIRIM_KODU', instance.belgeOlcuBirimKodu);
  writeNotNull('BELGE_OLCU_BIRIM_ADI', instance.belgeOlcuBirimAdi);
  writeNotNull('STOK_OLCU_BIRIMI1', instance.stokOlcuBirimi1);
  writeNotNull('KALEM_SAYISI', instance.kalemSayisi);
  writeNotNull('HUCRE_KODU', instance.hucreKodu);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('YAPKOD', instance.yapkod);
  writeNotNull('YAPACIK', instance.yapacik);
  writeNotNull('OLCU_BIRIMI', instance.olcuBirimi);
  return val;
}

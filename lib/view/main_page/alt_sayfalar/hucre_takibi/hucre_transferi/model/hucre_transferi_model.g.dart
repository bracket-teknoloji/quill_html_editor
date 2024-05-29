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
      pickerBelgeTuru: json['PICKER_BELGE_TURU'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      paketKodu: json['PAKET_KODU'] as String?,
      belgeTuru: json['BELGE_TURU'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
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
  writeNotNull('PICKER_BELGE_TURU', instance.pickerBelgeTuru);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('PAKET_KODU', instance.paketKodu);
  writeNotNull('BELGE_TURU', instance.belgeTuru);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('CARI_KODU', instance.cariKodu);
  return val;
}

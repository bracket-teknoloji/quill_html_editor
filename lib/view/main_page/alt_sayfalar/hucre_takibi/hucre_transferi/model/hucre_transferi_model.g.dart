// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_transferi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HucreTransferiModel _$HucreTransferiModelFromJson(Map<String, dynamic> json) =>
    _HucreTransferiModel(
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

Map<String, dynamic> _$HucreTransferiModelToJson(
  _HucreTransferiModel instance,
) => <String, dynamic>{
  'DEPO_KODU': ?instance.depoKodu,
  'HEDEF_HUCRE': ?instance.hedefHucre,
  'HUCRE_KODU': ?instance.hucreKodu,
  'ISLEM_TURU': ?instance.islemTuru,
  'PICKER_BELGE_TURU': ?instance.pickerBelgeTuru,
  'MIKTAR': ?instance.miktar,
  'STOK_KODU': ?instance.stokKodu,
  'STOK_ADI': ?instance.stokAdi,
  'PAKET_KODU': ?instance.paketKodu,
  'BELGE_TURU': ?instance.belgeTuru,
  'BELGE_NO': ?instance.belgeNo,
  'CARI_KODU': ?instance.cariKodu,
};

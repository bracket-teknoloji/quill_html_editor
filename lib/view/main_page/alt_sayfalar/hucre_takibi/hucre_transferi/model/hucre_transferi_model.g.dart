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
  if (instance.depoKodu case final value?) 'DEPO_KODU': value,
  if (instance.hedefHucre case final value?) 'HEDEF_HUCRE': value,
  if (instance.hucreKodu case final value?) 'HUCRE_KODU': value,
  if (instance.islemTuru case final value?) 'ISLEM_TURU': value,
  if (instance.pickerBelgeTuru case final value?) 'PICKER_BELGE_TURU': value,
  if (instance.miktar case final value?) 'MIKTAR': value,
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
  if (instance.stokAdi case final value?) 'STOK_ADI': value,
  if (instance.paketKodu case final value?) 'PAKET_KODU': value,
  if (instance.belgeTuru case final value?) 'BELGE_TURU': value,
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.cariKodu case final value?) 'CARI_KODU': value,
};

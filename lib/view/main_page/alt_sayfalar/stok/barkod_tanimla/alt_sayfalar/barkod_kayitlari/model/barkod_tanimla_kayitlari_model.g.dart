// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barkod_tanimla_kayitlari_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BarkodTanimlaKayitlariModelImpl _$$BarkodTanimlaKayitlariModelImplFromJson(Map<String, dynamic> json) =>
    _$BarkodTanimlaKayitlariModelImpl(
      stokKodu: json['STOK_KODU'] as String?,
      barkod: json['BARKOD'] as String?,
      birim: (json['BIRIM'] as num?)?.toInt(),
      kilit: json['KILIT'] as String?,
      aciklama: json['ACIKLAMA'] as String?,
      birimAdi: json['BIRIM_ADI'] as String?,
      barkodTipi: json['BARKOD_TIPI'] as String?,
      barkodTipiAdi: json['BARKOD_TIPI_ADI'] as String?,
      birimPay: (json['BIRIM_PAY'] as num?)?.toDouble(),
      birimPayda: (json['BIRIM_PAYDA'] as num?)?.toDouble(),
      stokBirim1Adi: json['STOK_BIRIM1_ADI'] as String?,
    );

Map<String, dynamic> _$$BarkodTanimlaKayitlariModelImplToJson(_$BarkodTanimlaKayitlariModelImpl instance) =>
    <String, dynamic>{
      if (instance.stokKodu case final value?) 'STOK_KODU': value,
      if (instance.barkod case final value?) 'BARKOD': value,
      if (instance.birim case final value?) 'BIRIM': value,
      if (instance.kilit case final value?) 'KILIT': value,
      if (instance.aciklama case final value?) 'ACIKLAMA': value,
      if (instance.birimAdi case final value?) 'BIRIM_ADI': value,
      if (instance.barkodTipi case final value?) 'BARKOD_TIPI': value,
      if (instance.barkodTipiAdi case final value?) 'BARKOD_TIPI_ADI': value,
      if (instance.birimPay case final value?) 'BIRIM_PAY': value,
      if (instance.birimPayda case final value?) 'BIRIM_PAYDA': value,
      if (instance.stokBirim1Adi case final value?) 'STOK_BIRIM1_ADI': value,
    };

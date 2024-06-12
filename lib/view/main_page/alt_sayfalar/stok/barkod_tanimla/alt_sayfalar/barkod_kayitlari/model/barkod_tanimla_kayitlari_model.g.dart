// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barkod_tanimla_kayitlari_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BarkodTanimlaKayitlariModelImpl _$$BarkodTanimlaKayitlariModelImplFromJson(
        Map<String, dynamic> json) =>
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

Map<String, dynamic> _$$BarkodTanimlaKayitlariModelImplToJson(
    _$BarkodTanimlaKayitlariModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('BARKOD', instance.barkod);
  writeNotNull('BIRIM', instance.birim);
  writeNotNull('KILIT', instance.kilit);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('BIRIM_ADI', instance.birimAdi);
  writeNotNull('BARKOD_TIPI', instance.barkodTipi);
  writeNotNull('BARKOD_TIPI_ADI', instance.barkodTipiAdi);
  writeNotNull('BIRIM_PAY', instance.birimPay);
  writeNotNull('BIRIM_PAYDA', instance.birimPayda);
  writeNotNull('STOK_BIRIM1_ADI', instance.stokBirim1Adi);
  return val;
}

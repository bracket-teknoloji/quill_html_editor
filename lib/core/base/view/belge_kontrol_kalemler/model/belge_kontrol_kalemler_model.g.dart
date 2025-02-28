// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belge_kontrol_kalemler_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BelgeKontrolKalemlerModelImpl _$$BelgeKontrolKalemlerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BelgeKontrolKalemlerModelImpl(
      kontrolId: (json['KONTROL_ID'] as num?)?.toInt(),
      belgeTipi: json['BELGE_TIPI'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
      sira: (json['SIRA'] as num?)?.toInt(),
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      tamamlananMiktar: (json['TAMAMLANAN_MIKTAR'] as num?)?.toDouble(),
      kalemBirimSira: (json['KALEM_BIRIM_SIRA'] as num?)?.toInt(),
      stokOlcuBirimi: json['STOK_OLCU_BIRIMI'] as String?,
      kalemBirimAdi: json['KALEM_BIRIM_ADI'] as String?,
      kalanMiktar: (json['KALAN_MIKTAR'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$BelgeKontrolKalemlerModelImplToJson(
        _$BelgeKontrolKalemlerModelImpl instance) =>
    <String, dynamic>{
      if (instance.kontrolId case final value?) 'KONTROL_ID': value,
      if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
      if (instance.belgeNo case final value?) 'BELGE_NO': value,
      if (instance.cariKodu case final value?) 'CARI_KODU': value,
      if (instance.sira case final value?) 'SIRA': value,
      if (instance.stokKodu case final value?) 'STOK_KODU': value,
      if (instance.stokAdi case final value?) 'STOK_ADI': value,
      if (instance.miktar case final value?) 'MIKTAR': value,
      if (instance.tamamlananMiktar case final value?)
        'TAMAMLANAN_MIKTAR': value,
      if (instance.kalemBirimSira case final value?) 'KALEM_BIRIM_SIRA': value,
      if (instance.stokOlcuBirimi case final value?) 'STOK_OLCU_BIRIMI': value,
      if (instance.kalemBirimAdi case final value?) 'KALEM_BIRIM_ADI': value,
      if (instance.kalanMiktar case final value?) 'KALAN_MIKTAR': value,
    };

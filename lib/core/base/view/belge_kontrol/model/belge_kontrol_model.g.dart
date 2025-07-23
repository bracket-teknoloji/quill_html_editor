// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belge_kontrol_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BelgeKontrolModel _$BelgeKontrolModelFromJson(Map<String, dynamic> json) =>
    _BelgeKontrolModel(
      id: (json['ID'] as num?)?.toInt(),
      belgeTipi: json['BELGE_TIPI'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
      islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
      sira: (json['SIRA'] as num?)?.toInt(),
      belgeTarihi: json['BELGE_TARIHI'] == null
          ? null
          : DateTime.parse(json['BELGE_TARIHI'] as String),
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      tamamlananMiktar: (json['TAMAMLANAN_MIKTAR'] as num?)?.toDouble(),
      kayityapankul: json['KAYITYAPANKUL'] as String?,
      kayittarihi: json['KAYITTARIHI'] == null
          ? null
          : DateTime.parse(json['KAYITTARIHI'] as String),
      cariAdi: json['CARI_ADI'] as String?,
      kalanMiktar: (json['KALAN_MIKTAR'] as num?)?.toDouble(),
      stokKodu: json['STOK_KODU'] as String?,
    );

Map<String, dynamic> _$BelgeKontrolModelToJson(
  _BelgeKontrolModel instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'ID': value,
  if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.cariKodu case final value?) 'CARI_KODU': value,
  if (instance.islemKodu case final value?) 'ISLEM_KODU': value,
  if (instance.sira case final value?) 'SIRA': value,
  if (instance.belgeTarihi?.toIso8601String() case final value?)
    'BELGE_TARIHI': value,
  if (instance.miktar case final value?) 'MIKTAR': value,
  if (instance.tamamlananMiktar case final value?) 'TAMAMLANAN_MIKTAR': value,
  if (instance.kayityapankul case final value?) 'KAYITYAPANKUL': value,
  if (instance.kayittarihi?.toIso8601String() case final value?)
    'KAYITTARIHI': value,
  if (instance.cariAdi case final value?) 'CARI_ADI': value,
  if (instance.kalanMiktar case final value?) 'KALAN_MIKTAR': value,
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
};

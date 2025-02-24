// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belge_kontrol_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BelgeKontrolModelImpl _$$BelgeKontrolModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BelgeKontrolModelImpl(
      id: (json['ID'] as num?)?.toInt(),
      belgeTipi: json['BELGE_TIPI'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
      belgeTarihi: json['BELGE_TARIHI'] == null
          ? null
          : DateTime.parse(json['BELGE_TARIHI'] as String),
      miktar: (json['MIKTAR'] as num?)?.toInt(),
      tamamlananMiktar: (json['TAMAMLANAN_MIKTAR'] as num?)?.toInt(),
      kayityapankul: json['KAYITYAPANKUL'] as String?,
      kayittarihi: json['KAYITTARIHI'] == null
          ? null
          : DateTime.parse(json['KAYITTARIHI'] as String),
      cariAdi: json['CARI_ADI'] as String?,
      kalanMiktar: (json['KALAN_MIKTAR'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BelgeKontrolModelImplToJson(
        _$BelgeKontrolModelImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'ID': value,
      if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
      if (instance.belgeNo case final value?) 'BELGE_NO': value,
      if (instance.cariKodu case final value?) 'CARI_KODU': value,
      if (instance.belgeTarihi?.toIso8601String() case final value?)
        'BELGE_TARIHI': value,
      if (instance.miktar case final value?) 'MIKTAR': value,
      if (instance.tamamlananMiktar case final value?)
        'TAMAMLANAN_MIKTAR': value,
      if (instance.kayityapankul case final value?) 'KAYITYAPANKUL': value,
      if (instance.kayittarihi?.toIso8601String() case final value?)
        'KAYITTARIHI': value,
      if (instance.cariAdi case final value?) 'CARI_ADI': value,
      if (instance.kalanMiktar case final value?) 'KALAN_MIKTAR': value,
    };

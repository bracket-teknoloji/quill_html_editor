// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paketleme_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaketlemeListesiModel _$PaketlemeListesiModelFromJson(
  Map<String, dynamic> json,
) => _PaketlemeListesiModel(
  id: (json['ID'] as num?)?.toInt(),
  kodu: json['KODU'] as String?,
  kalemSayisi: (json['KALEM_SAYISI'] as num?)?.toInt(),
  kayittarihi: json['KAYITTARIHI'] == null
      ? null
      : DateTime.parse(json['KAYITTARIHI'] as String),
  kayityapankul: json['KAYITYAPANKUL'] as String?,
  depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
  paketTuru: (json['PAKET_TURU'] as num?)?.toInt(),
  paketTuruTanimi: json['PAKET_TURU_TANIMI'] as String?,
  kilit: json['KILIT'] as String?,
  ukey: json['UKEY'] as String?,
);

Map<String, dynamic> _$PaketlemeListesiModelToJson(
  _PaketlemeListesiModel instance,
) => <String, dynamic>{
  'ID': ?instance.id,
  'KODU': ?instance.kodu,
  'KALEM_SAYISI': ?instance.kalemSayisi,
  'KAYITTARIHI': ?instance.kayittarihi?.toIso8601String(),
  'KAYITYAPANKUL': ?instance.kayityapankul,
  'DEPO_KODU': ?instance.depoKodu,
  'PAKET_TURU': ?instance.paketTuru,
  'PAKET_TURU_TANIMI': ?instance.paketTuruTanimi,
  'KILIT': ?instance.kilit,
  'UKEY': ?instance.ukey,
};

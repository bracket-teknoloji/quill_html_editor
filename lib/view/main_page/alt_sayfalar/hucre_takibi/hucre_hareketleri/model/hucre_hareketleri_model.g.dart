// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_hareketleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HucreHareketleriModel _$HucreHareketleriModelFromJson(
  Map<String, dynamic> json,
) => _HucreHareketleriModel(
  inckeyno: (json['INCKEYNO'] as num?)?.toInt(),
  stokKodu: json['STOK_KODU'] as String?,
  stokAdi: json['STOK_ADI'] as String?,
  gc: json['GC'] as String?,
  hucreKodu: json['HUCRE_KODU'] as String?,
  tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
  netMiktar: (json['NET_MIKTAR'] as num?)?.toInt(),
  belgeTipi: json['BELGE_TIPI'] as String?,
  hareketTuru: json['HAREKET_TURU'] as String?,
  hareketAdi: json['HAREKET_ADI'] as String?,
  kayityapankul: json['KAYITYAPANKUL'] as String?,
  kayittarihi: json['KAYITTARIHI'] == null
      ? null
      : DateTime.parse(json['KAYITTARIHI'] as String),
  depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
  depoTanimi: json['DEPO_TANIMI'] as String?,
  eksiBakiye: json['EKSI_BAKIYE'] as String?,
  stokOlcuBirimi: json['STOK_OLCU_BIRIMI'] as String?,
  stharFisno: json['STHAR_FISNO'] as String?,
  stharInc: (json['STHAR_INC'] as num?)?.toInt(),
  yapkod: json['YAPKOD'] as String?,
);

Map<String, dynamic> _$HucreHareketleriModelToJson(
  _HucreHareketleriModel instance,
) => <String, dynamic>{
  'INCKEYNO': ?instance.inckeyno,
  'STOK_KODU': ?instance.stokKodu,
  'STOK_ADI': ?instance.stokAdi,
  'GC': ?instance.gc,
  'HUCRE_KODU': ?instance.hucreKodu,
  'TARIH': ?instance.tarih?.toIso8601String(),
  'NET_MIKTAR': ?instance.netMiktar,
  'BELGE_TIPI': ?instance.belgeTipi,
  'HAREKET_TURU': ?instance.hareketTuru,
  'HAREKET_ADI': ?instance.hareketAdi,
  'KAYITYAPANKUL': ?instance.kayityapankul,
  'KAYITTARIHI': ?instance.kayittarihi?.toIso8601String(),
  'DEPO_KODU': ?instance.depoKodu,
  'DEPO_TANIMI': ?instance.depoTanimi,
  'EKSI_BAKIYE': ?instance.eksiBakiye,
  'STOK_OLCU_BIRIMI': ?instance.stokOlcuBirimi,
  'STHAR_FISNO': ?instance.stharFisno,
  'STHAR_INC': ?instance.stharInc,
  'YAPKOD': ?instance.yapkod,
};

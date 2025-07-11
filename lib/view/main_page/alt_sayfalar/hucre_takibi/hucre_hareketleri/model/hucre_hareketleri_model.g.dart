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
  kayittarihi: json['KAYITTARIHI'] == null ? null : DateTime.parse(json['KAYITTARIHI'] as String),
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
  if (instance.inckeyno case final value?) 'INCKEYNO': value,
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
  if (instance.stokAdi case final value?) 'STOK_ADI': value,
  if (instance.gc case final value?) 'GC': value,
  if (instance.hucreKodu case final value?) 'HUCRE_KODU': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
  if (instance.netMiktar case final value?) 'NET_MIKTAR': value,
  if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
  if (instance.hareketTuru case final value?) 'HAREKET_TURU': value,
  if (instance.hareketAdi case final value?) 'HAREKET_ADI': value,
  if (instance.kayityapankul case final value?) 'KAYITYAPANKUL': value,
  if (instance.kayittarihi?.toIso8601String() case final value?) 'KAYITTARIHI': value,
  if (instance.depoKodu case final value?) 'DEPO_KODU': value,
  if (instance.depoTanimi case final value?) 'DEPO_TANIMI': value,
  if (instance.eksiBakiye case final value?) 'EKSI_BAKIYE': value,
  if (instance.stokOlcuBirimi case final value?) 'STOK_OLCU_BIRIMI': value,
  if (instance.stharFisno case final value?) 'STHAR_FISNO': value,
  if (instance.stharInc case final value?) 'STHAR_INC': value,
  if (instance.yapkod case final value?) 'YAPKOD': value,
};

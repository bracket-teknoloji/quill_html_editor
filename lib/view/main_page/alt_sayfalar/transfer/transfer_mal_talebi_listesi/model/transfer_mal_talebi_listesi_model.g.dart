// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_mal_talebi_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransferMalTalebiListesiModel _$TransferMalTalebiListesiModelFromJson(
  Map<String, dynamic> json,
) => _TransferMalTalebiListesiModel(
  id: (json['ID'] as num?)?.toInt() ?? -1,
  tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
  depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
  durumAdi: json['DURUM_ADI'] as String?,
  kalemSayisi: (json['KALEM_SAYISI'] as num?)?.toInt(),
  miktar: (json['MIKTAR'] as num?)?.toDouble(),
  kalanMiktar: (json['KALAN_MIKTAR'] as num?)?.toDouble(),
  kayittarihi: json['KAYITTARIHI'] == null
      ? null
      : DateTime.parse(json['KAYITTARIHI'] as String),
  kayityapankul: json['KAYITYAPANKUL'] as String?,
  tamamlananMiktar: (json['TAMAMLANAN_MIKTAR'] as num?)?.toDouble(),
  aciklama: json['ACIKLAMA'] as String?,
  belgeNo: json['BELGE_NO'] as String?,
  kapali: json['KAPALI'] as bool?,
  belgeTipi: json['BELGE_TIPI'] as String?,
  hedefSube: (json['HEDEF_SUBE'] as num?)?.toInt(),
  islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
  kalemList: (json['KALEM_LIST'] as List<dynamic>?)
      ?.map((e) => KalemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TransferMalTalebiListesiModelToJson(
  _TransferMalTalebiListesiModel instance,
) => <String, dynamic>{
  'ID': instance.id,
  'TARIH': ?instance.tarih?.toIso8601String(),
  'DEPO_KODU': ?instance.depoKodu,
  'DURUM_ADI': ?instance.durumAdi,
  'KALEM_SAYISI': ?instance.kalemSayisi,
  'MIKTAR': ?instance.miktar,
  'KALAN_MIKTAR': ?instance.kalanMiktar,
  'KAYITTARIHI': ?instance.kayittarihi?.toIso8601String(),
  'KAYITYAPANKUL': ?instance.kayityapankul,
  'TAMAMLANAN_MIKTAR': ?instance.tamamlananMiktar,
  'ACIKLAMA': ?instance.aciklama,
  'BELGE_NO': ?instance.belgeNo,
  'KAPALI': ?instance.kapali,
  'BELGE_TIPI': ?instance.belgeTipi,
  'HEDEF_SUBE': ?instance.hedefSube,
  'ISLEM_KODU': ?instance.islemKodu,
  'KALEM_LIST': ?instance.kalemList?.map((e) => e.toJson()).toList(),
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_aktivite_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CariAktiviteListesiModel _$CariAktiviteListesiModelFromJson(
  Map<String, dynamic> json,
) => _CariAktiviteListesiModel(
  id: (json['ID'] as num?)?.toInt(),
  islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
  cariKodu: json['CARI_KODU'] as String?,
  cariAdi: json['CARI_ADI'] as String?,
  kullaniciAdi: json['KULLANICI_ADI'] as String?,
  kullaniciTitle: json['KULLANICI_TITLE'] as String?,
  aktiviteTipi: (json['AKTIVITE_TIPI'] as num?)?.toInt(),
  aktiviteId: (json['AKTIVITE_ID'] as num?)?.toInt(),
  aktiviteAdi: json['AKTIVITE_ADI'] as String?,
  bastar: json['BASTAR'] == null
      ? null
      : DateTime.parse(json['BASTAR'] as String),
  kayittarihi: json['KAYITTARIHI'] == null
      ? null
      : DateTime.parse(json['KAYITTARIHI'] as String),
  kayityapankul: json['KAYITYAPANKUL'] as String?,
  bittar: json['BITTAR'] == null
      ? null
      : DateTime.parse(json['BITTAR'] as String),
  sonucAciklama: json['SONUC_ACIKLAMA'] as String?,
  sure: (json['SURE'] as num?)?.toDouble(),
  aciklama: json['ACIKLAMA'] as String?,
  duzeltmetarihi: json['DUZELTMETARIHI'] == null
      ? null
      : DateTime.parse(json['DUZELTMETARIHI'] as String),
  tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
  duzeltmeyapankul: json['DUZELTMEYAPANKUL'] as String?,
  ilgiliKisi: json['ILGILI_KISI'] as String?,
  bolum: json['BOLUM'] as String?,
  aktiviteBitirilsin: json['AKTIVITE_BITIRILSIN'] as bool?,
  listDetay: (json['LIST_DETAY'] as List<dynamic>?)
      ?.map((e) => CariAktiviteListesiModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CariAktiviteListesiModelToJson(
  _CariAktiviteListesiModel instance,
) => <String, dynamic>{
  'ID': ?instance.id,
  'ISLEM_KODU': ?instance.islemKodu,
  'CARI_KODU': ?instance.cariKodu,
  'CARI_ADI': ?instance.cariAdi,
  'KULLANICI_ADI': ?instance.kullaniciAdi,
  'KULLANICI_TITLE': ?instance.kullaniciTitle,
  'AKTIVITE_TIPI': ?instance.aktiviteTipi,
  'AKTIVITE_ID': ?instance.aktiviteId,
  'AKTIVITE_ADI': ?instance.aktiviteAdi,
  'BASTAR': ?instance.bastar?.toIso8601String(),
  'KAYITTARIHI': ?instance.kayittarihi?.toIso8601String(),
  'KAYITYAPANKUL': ?instance.kayityapankul,
  'BITTAR': ?instance.bittar?.toIso8601String(),
  'SONUC_ACIKLAMA': ?instance.sonucAciklama,
  'SURE': ?instance.sure,
  'ACIKLAMA': ?instance.aciklama,
  'DUZELTMETARIHI': ?instance.duzeltmetarihi?.toIso8601String(),
  'TARIH': ?instance.tarih?.toIso8601String(),
  'DUZELTMEYAPANKUL': ?instance.duzeltmeyapankul,
  'ILGILI_KISI': ?instance.ilgiliKisi,
  'BOLUM': ?instance.bolum,
  'LIST_DETAY': ?instance.listDetay?.map((e) => e.toJson()).toList(),
};

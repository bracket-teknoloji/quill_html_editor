// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_aktivite_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CariAktiviteListesiModelImpl _$$CariAktiviteListesiModelImplFromJson(Map<String, dynamic> json) =>
    _$CariAktiviteListesiModelImpl(
      id: (json['ID'] as num?)?.toInt(),
      islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
      cariKodu: json['CARI_KODU'] as String?,
      cariAdi: json['CARI_ADI'] as String?,
      kullaniciAdi: json['KULLANICI_ADI'] as String?,
      kullaniciTitle: json['KULLANICI_TITLE'] as String?,
      aktiviteTipi: (json['AKTIVITE_TIPI'] as num?)?.toInt(),
      aktiviteId: (json['AKTIVITE_ID'] as num?)?.toInt(),
      aktiviteAdi: json['AKTIVITE_ADI'] as String?,
      bastar: json['BASTAR'] == null ? null : DateTime.parse(json['BASTAR'] as String),
      kayittarihi: json['KAYITTARIHI'] == null ? null : DateTime.parse(json['KAYITTARIHI'] as String),
      kayityapankul: json['KAYITYAPANKUL'] as String?,
      bittar: json['BITTAR'] == null ? null : DateTime.parse(json['BITTAR'] as String),
      sonucAciklama: json['SONUC_ACIKLAMA'] as String?,
      sure: (json['SURE'] as num?)?.toDouble(),
      aciklama: json['ACIKLAMA'] as String?,
      duzeltmetarihi: json['DUZELTMETARIHI'] == null ? null : DateTime.parse(json['DUZELTMETARIHI'] as String),
      tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
      duzeltmeyapankul: json['DUZELTMEYAPANKUL'] as String?,
      ilgiliKisi: json['ILGILI_KISI'] as String?,
      bolum: json['BOLUM'] as String?,
      aktiviteBitirilsin: json['AKTIVITE_BITIRILSIN'] as bool?,
      listDetay: (json['LIST_DETAY'] as List<dynamic>?)
          ?.map((e) => CariAktiviteListesiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CariAktiviteListesiModelImplToJson(_$CariAktiviteListesiModelImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'ID': value,
      if (instance.islemKodu case final value?) 'ISLEM_KODU': value,
      if (instance.cariKodu case final value?) 'CARI_KODU': value,
      if (instance.cariAdi case final value?) 'CARI_ADI': value,
      if (instance.kullaniciAdi case final value?) 'KULLANICI_ADI': value,
      if (instance.kullaniciTitle case final value?) 'KULLANICI_TITLE': value,
      if (instance.aktiviteTipi case final value?) 'AKTIVITE_TIPI': value,
      if (instance.aktiviteId case final value?) 'AKTIVITE_ID': value,
      if (instance.aktiviteAdi case final value?) 'AKTIVITE_ADI': value,
      if (instance.bastar?.toIso8601String() case final value?) 'BASTAR': value,
      if (instance.kayittarihi?.toIso8601String() case final value?) 'KAYITTARIHI': value,
      if (instance.kayityapankul case final value?) 'KAYITYAPANKUL': value,
      if (instance.bittar?.toIso8601String() case final value?) 'BITTAR': value,
      if (instance.sonucAciklama case final value?) 'SONUC_ACIKLAMA': value,
      if (instance.sure case final value?) 'SURE': value,
      if (instance.aciklama case final value?) 'ACIKLAMA': value,
      if (instance.duzeltmetarihi?.toIso8601String() case final value?) 'DUZELTMETARIHI': value,
      if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
      if (instance.duzeltmeyapankul case final value?) 'DUZELTMEYAPANKUL': value,
      if (instance.ilgiliKisi case final value?) 'ILGILI_KISI': value,
      if (instance.bolum case final value?) 'BOLUM': value,
      if (instance.listDetay?.map((e) => e.toJson()).toList() case final value?) 'LIST_DETAY': value,
    };

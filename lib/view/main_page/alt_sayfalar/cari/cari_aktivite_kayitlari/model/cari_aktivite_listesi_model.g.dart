// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_aktivite_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CariAktiviteListesiModelImpl _$$CariAktiviteListesiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CariAktiviteListesiModelImpl(
      id: json['ID'] as int?,
      islemKodu: json['ISLEM_KODU'] as int?,
      cariKodu: json['CARI_KODU'] as String?,
      cariAdi: json['CARI_ADI'] as String?,
      kullaniciAdi: json['KULLANICI_ADI'] as String?,
      kullaniciTitle: json['KULLANICI_TITLE'] as String?,
      aktiviteTipi: json['AKTIVITE_TIPI'] as int?,
      aktiviteId: json['AKTIVITE_ID'] as int?,
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
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      duzeltmeyapankul: json['DUZELTMEYAPANKUL'] as String?,
      ilgiliKisi: json['ILGILI_KISI'] as String?,
      bolum: json['BOLUM'] as String?,
      aktiviteBitirilsin: json['AKTIVITE_BITIRILSIN'] as bool?,
      listDetay: (json['LIST_DETAY'] as List<dynamic>?)
          ?.map((e) =>
              CariAktiviteListesiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CariAktiviteListesiModelImplToJson(
    _$CariAktiviteListesiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.id);
  writeNotNull('ISLEM_KODU', instance.islemKodu);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('KULLANICI_ADI', instance.kullaniciAdi);
  writeNotNull('KULLANICI_TITLE', instance.kullaniciTitle);
  writeNotNull('AKTIVITE_TIPI', instance.aktiviteTipi);
  writeNotNull('AKTIVITE_ID', instance.aktiviteId);
  writeNotNull('AKTIVITE_ADI', instance.aktiviteAdi);
  writeNotNull('BASTAR', instance.bastar?.toIso8601String());
  writeNotNull('KAYITTARIHI', instance.kayittarihi?.toIso8601String());
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('BITTAR', instance.bittar?.toIso8601String());
  writeNotNull('SONUC_ACIKLAMA', instance.sonucAciklama);
  writeNotNull('SURE', instance.sure);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('DUZELTMETARIHI', instance.duzeltmetarihi?.toIso8601String());
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('DUZELTMEYAPANKUL', instance.duzeltmeyapankul);
  writeNotNull('ILGILI_KISI', instance.ilgiliKisi);
  writeNotNull('BOLUM', instance.bolum);
  writeNotNull(
      'LIST_DETAY', instance.listDetay?.map((e) => e.toJson()).toList());
  return val;
}

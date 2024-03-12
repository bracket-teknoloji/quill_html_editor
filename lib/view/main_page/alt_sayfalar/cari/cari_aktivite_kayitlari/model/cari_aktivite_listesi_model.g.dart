// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_aktivite_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CariAktiviteListesiModelImpl _$$CariAktiviteListesiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CariAktiviteListesiModelImpl(
      id: json['ID'] as int?,
      cariKodu: json['CARI_KODU'] as String?,
      cariAdi: json['CARI_ADI'] as String?,
      kullaniciAdi: json['KULLANICI_ADI'] as String?,
      aktiviteTipi: json['AKTIVITE_TIPI'] as int?,
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
      duzeltmeyapankul: json['DUZELTMEYAPANKUL'] as String?,
      ilgiliKisi: json['ILGILI_KISI'] as String?,
      bolum: json['BOLUM'] as String?,
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
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('KULLANICI_ADI', instance.kullaniciAdi);
  writeNotNull('AKTIVITE_TIPI', instance.aktiviteTipi);
  writeNotNull('AKTIVITE_ADI', instance.aktiviteAdi);
  writeNotNull('BASTAR', instance.bastar?.toIso8601String());
  writeNotNull('KAYITTARIHI', instance.kayittarihi?.toIso8601String());
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('BITTAR', instance.bittar?.toIso8601String());
  writeNotNull('SONUC_ACIKLAMA', instance.sonucAciklama);
  writeNotNull('SURE', instance.sure);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('DUZELTMETARIHI', instance.duzeltmetarihi?.toIso8601String());
  writeNotNull('DUZELTMEYAPANKUL', instance.duzeltmeyapankul);
  writeNotNull('ILGILI_KISI', instance.ilgiliKisi);
  writeNotNull('BOLUM', instance.bolum);
  return val;
}

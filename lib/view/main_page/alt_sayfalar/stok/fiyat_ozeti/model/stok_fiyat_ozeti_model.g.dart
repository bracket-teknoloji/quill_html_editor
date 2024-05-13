// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_fiyat_ozeti_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StokFiyatOzetiModelImpl _$$StokFiyatOzetiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StokFiyatOzetiModelImpl(
      sira: (json['SIRA'] as num?)?.toInt(),
      grup: json['GRUP'] as String?,
      tip: json['TIP'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
      cariAdi: json['CARI_ADI'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      fiyat: (json['FIYAT'] as num?)?.toDouble(),
      dovizFiyati: (json['DOVIZ_FIYATI'] as num?)?.toInt(),
      dovizAdi: json['DOVIZ_ADI'] as String?,
      dovizTipi: (json['DOVIZ_TIPI'] as num?)?.toInt(),
      brutFiyat: (json['BRUT_FIYAT'] as num?)?.toInt(),
      brutDovizFiyati: (json['BRUT_DOVIZ_FIYATI'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$StokFiyatOzetiModelImplToJson(
    _$StokFiyatOzetiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SIRA', instance.sira);
  writeNotNull('GRUP', instance.grup);
  writeNotNull('TIP', instance.tip);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('FIYAT', instance.fiyat);
  writeNotNull('DOVIZ_FIYATI', instance.dovizFiyati);
  writeNotNull('DOVIZ_ADI', instance.dovizAdi);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('BRUT_FIYAT', instance.brutFiyat);
  writeNotNull('BRUT_DOVIZ_FIYATI', instance.brutDovizFiyati);
  return val;
}

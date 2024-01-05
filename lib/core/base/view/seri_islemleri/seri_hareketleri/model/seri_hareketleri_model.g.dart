// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_hareketleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeriHareketleriModelImpl _$$SeriHareketleriModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SeriHareketleriModelImpl(
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      depoKodu: json['DEPO_KODU'] as int?,
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      seriNo: json['SERI_NO'] as String?,
      inckeyno: json['INCKEYNO'] as int?,
      depoTanimi: json['DEPO_TANIMI'] as String?,
      kayitTipi: json['KAYIT_TIPI'] as String?,
      kayitTipiAdi: json['KAYIT_TIPI_ADI'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      belgeTipiAdi: json['BELGE_TIPI_ADI'] as String?,
      haracik: json['HARACIK'] as String?,
      gckod: json['GCKOD'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      stharInc: json['STHAR_INC'] as int?,
      islemKodu: json['ISLEM_KODU'] as int?,
      acik1: json['ACIK1'] as String?,
      acik2: json['ACIK2'] as String?,
      aciklama1: json['ACIKLAMA1'] as String?,
      seri1: json['SERI1'] as String?,
      requestVersion: json['REQUEST_VERSION'] as int?,
      seri2: json['SERI2'] as String?,
    );

Map<String, dynamic> _$$SeriHareketleriModelImplToJson(
    _$SeriHareketleriModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('SERI_NO', instance.seriNo);
  writeNotNull('INCKEYNO', instance.inckeyno);
  writeNotNull('DEPO_TANIMI', instance.depoTanimi);
  writeNotNull('KAYIT_TIPI', instance.kayitTipi);
  writeNotNull('KAYIT_TIPI_ADI', instance.kayitTipiAdi);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('BELGE_TIPI_ADI', instance.belgeTipiAdi);
  writeNotNull('HARACIK', instance.haracik);
  writeNotNull('GCKOD', instance.gckod);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('STHAR_INC', instance.stharInc);
  writeNotNull('ISLEM_KODU', instance.islemKodu);
  writeNotNull('ACIK1', instance.acik1);
  writeNotNull('ACIK2', instance.acik2);
  writeNotNull('ACIKLAMA1', instance.aciklama1);
  writeNotNull('SERI1', instance.seri1);
  writeNotNull('REQUEST_VERSION', instance.requestVersion);
  writeNotNull('SERI2', instance.seri2);
  return val;
}

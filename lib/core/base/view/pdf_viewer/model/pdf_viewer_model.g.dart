// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_viewer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PdfModel _$PdfModelFromJson(Map<String, dynamic> json) => PdfModel(
      raporOzelKod: json['RAPOR_OZEL_KOD'] as String?,
      standart: json['STANDART'] as bool?,
      dicParams: json['DIC_PARAMS'] == null
          ? null
          : DicParams.fromJson(json['DIC_PARAMS'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PdfModelToJson(PdfModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RAPOR_OZEL_KOD', instance.raporOzelKod);
  writeNotNull('STANDART', instance.standart);
  writeNotNull('DIC_PARAMS', instance.dicParams?.toJson());
  return val;
}

DicParams _$DicParamsFromJson(Map<String, dynamic> json) => DicParams(
      cariKodu: json['CARI_KODU'] as String?,
      tlHarDokulsun: json['TL_HAR_DOKULSUN'] as String?,
      dovizTipi: json['DOVIZ_TIPI'] as String?,
      bastar: json['BASTAR'] as String?,
      bittar: json['BITTAR'] as String?,
      grupKodu: json['GRUP_KODU'] as String?,
      borcAlacak: json['BORC_ALACAK'] as String?,
      refTarih: json['REF_TARIH'] as String?,
      tarihTipi: json['TARIH_TIPI'] as String?,
      kod1: json['KOD1'] as String?,
      kod2: json['KOD2'] as String?,
      kod3: json['KOD3'] as String?,
      kod4: json['KOD4'] as String?,
      kod5: json['KOD5'] as String?,
      plasiyerKodu: json['PLASIYER_KODU'] as String?,
      aralikTipi: json['ARALIK_TIPI'] as String?,
    );

Map<String, dynamic> _$DicParamsToJson(DicParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('TL_HAR_DOKULSUN', instance.tlHarDokulsun);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('BASTAR', instance.bastar);
  writeNotNull('BITTAR', instance.bittar);
  writeNotNull('GRUP_KODU', instance.grupKodu);
  writeNotNull('BORC_ALACAK', instance.borcAlacak);
  writeNotNull('REF_TARIH', instance.refTarih);
  writeNotNull('TARIH_TIPI', instance.tarihTipi);
  writeNotNull('KOD1', instance.kod1);
  writeNotNull('KOD2', instance.kod2);
  writeNotNull('KOD3', instance.kod3);
  writeNotNull('KOD4', instance.kod4);
  writeNotNull('KOD5', instance.kod5);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('ARALIK_TIPI', instance.aralikTipi);
  return val;
}

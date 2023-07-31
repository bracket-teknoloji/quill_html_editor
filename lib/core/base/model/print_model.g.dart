// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrintModel _$PrintModelFromJson(Map<String, dynamic> json) => PrintModel(
      dizaynId: json['DIZAYN_ID'] as int?,
      etiketSayisi: json['ETIKET_SAYISI'] as int?,
      raporOzelKod: json['RAPOR_OZEL_KOD'] as String?,
      yazdir: json['YAZDIR'] as bool?,
      yaziciAdi: json['YAZICI_ADI'] as String?,
      yaziciTipi: json['YAZICI_TIPI'] as String?,
      dicParams: json['DIC_PARAMS'] == null
          ? null
          : DicParams.fromJson(json['DIC_PARAMS'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrintModelToJson(PrintModel instance) =>
    <String, dynamic>{
      'DIZAYN_ID': instance.dizaynId,
      'ETIKET_SAYISI': instance.etiketSayisi,
      'RAPOR_OZEL_KOD': instance.raporOzelKod,
      'YAZDIR': instance.yazdir,
      'YAZICI_ADI': instance.yaziciAdi,
      'YAZICI_TIPI': instance.yaziciTipi,
      'DIC_PARAMS': instance.dicParams,
    };

DicParams _$DicParamsFromJson(Map<String, dynamic> json) => DicParams(
      belgeNo: json['BELGE_NO'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
    );

Map<String, dynamic> _$DicParamsToJson(DicParams instance) => <String, dynamic>{
      'BELGE_NO': instance.belgeNo,
      'CARI_KODU': instance.cariKodu,
      'BELGE_TIPI': instance.belgeTipi,
    };

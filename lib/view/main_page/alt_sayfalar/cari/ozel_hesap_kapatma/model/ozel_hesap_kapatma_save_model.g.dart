// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ozel_hesap_kapatma_save_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OzelHesapKapatmaSaveModel _$OzelHesapKapatmaSaveModelFromJson(
  Map<String, dynamic> json,
) => _OzelHesapKapatmaSaveModel(
  arrHedefInckeyno: (json['ARR_HEDEF_INCKEYNO'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  cariKodu: json['CARI_KODU'] as String?,
  kaynakInckeyno: (json['KAYNAK_INCKEYNO'] as num?)?.toInt(),
);

Map<String, dynamic> _$OzelHesapKapatmaSaveModelToJson(
  _OzelHesapKapatmaSaveModel instance,
) => <String, dynamic>{
  'ARR_HEDEF_INCKEYNO': ?instance.arrHedefInckeyno,
  'CARI_KODU': ?instance.cariKodu,
  'KAYNAK_INCKEYNO': ?instance.kaynakInckeyno,
};

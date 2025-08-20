// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'urun_grubuna_gore_satis_grafigi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UrunGrubunaGoreSatisGrafigiModel _$UrunGrubunaGoreSatisGrafigiModelFromJson(
  Map<String, dynamic> json,
) => UrunGrubunaGoreSatisGrafigiModel()
  ..grupKodu = json['GRUP_KODU'] as String?
  ..grupAdi = json['GRUP_ADI'] as String?
  ..netTutar = (json['NET_TUTAR'] as num?)?.toDouble()
  ..toplamTutar = (json['TOPLAM_TUTAR'] as num?)?.toDouble()
  ..oran = (json['ORAN'] as num?)?.toDouble()
  ..sira = (json['SIRA'] as num?)?.toInt()
  ..miktar = (json['MIKTAR'] as num?)?.toDouble()
  ..oranMiktar = (json['ORAN_MIKTAR'] as num?)?.toDouble()
  ..oranTutar = (json['ORAN_TUTAR'] as num?)?.toDouble();

Map<String, dynamic> _$UrunGrubunaGoreSatisGrafigiModelToJson(
  UrunGrubunaGoreSatisGrafigiModel instance,
) => <String, dynamic>{
  'GRUP_KODU': ?instance.grupKodu,
  'GRUP_ADI': ?instance.grupAdi,
  'NET_TUTAR': ?instance.netTutar,
  'TOPLAM_TUTAR': ?instance.toplamTutar,
  'ORAN': ?instance.oran,
  'SIRA': ?instance.sira,
  'MIKTAR': ?instance.miktar,
  'ORAN_MIKTAR': ?instance.oranMiktar,
  'ORAN_TUTAR': ?instance.oranTutar,
};

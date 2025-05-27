// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'urun_grubuna_gore_satis_grafigi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UrunGrubunaGoreSatisGrafigiModel _$UrunGrubunaGoreSatisGrafigiModelFromJson(
        Map<String, dynamic> json) =>
    UrunGrubunaGoreSatisGrafigiModel()
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
        UrunGrubunaGoreSatisGrafigiModel instance) =>
    <String, dynamic>{
      if (instance.grupKodu case final value?) 'GRUP_KODU': value,
      if (instance.grupAdi case final value?) 'GRUP_ADI': value,
      if (instance.netTutar case final value?) 'NET_TUTAR': value,
      if (instance.toplamTutar case final value?) 'TOPLAM_TUTAR': value,
      if (instance.oran case final value?) 'ORAN': value,
      if (instance.sira case final value?) 'SIRA': value,
      if (instance.miktar case final value?) 'MIKTAR': value,
      if (instance.oranMiktar case final value?) 'ORAN_MIKTAR': value,
      if (instance.oranTutar case final value?) 'ORAN_TUTAR': value,
    };

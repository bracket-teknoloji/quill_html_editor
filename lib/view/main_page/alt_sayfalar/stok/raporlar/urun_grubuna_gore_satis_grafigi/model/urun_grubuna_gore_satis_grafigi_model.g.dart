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
    UrunGrubunaGoreSatisGrafigiModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GRUP_KODU', instance.grupKodu);
  writeNotNull('GRUP_ADI', instance.grupAdi);
  writeNotNull('NET_TUTAR', instance.netTutar);
  writeNotNull('TOPLAM_TUTAR', instance.toplamTutar);
  writeNotNull('ORAN', instance.oran);
  writeNotNull('SIRA', instance.sira);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('ORAN_MIKTAR', instance.oranMiktar);
  writeNotNull('ORAN_TUTAR', instance.oranTutar);
  return val;
}

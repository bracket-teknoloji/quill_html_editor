// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'urun_grubuna_gore_satis_grafigi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UrunGrubunaGoreSatisGrafigiRequestModelImpl
    _$$UrunGrubunaGoreSatisGrafigiRequestModelImplFromJson(
            Map<String, dynamic> json) =>
        _$UrunGrubunaGoreSatisGrafigiRequestModelImpl(
          arrPlasiyerKodu: (json['ARR_PLASIYER_KODU'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
          baslamaTarihi: json['BASLAMA_TARIHI'] as String?,
          bitisTarihi: json['BITIS_TARIHI'] as String?,
          cariKodu: json['CARI_KODU'] as String?,
          donemTipi: json['DONEM_TIPI'] as String?,
          grupNo: (json['GRUP_NO'] as num?)?.toInt(),
          irsDahil: json['IRS_DAHIL'] as String?,
          projeKodu: json['PROJE_KODU'] as String?,
          tipi: json['TIPI'] as String?,
        );

Map<String, dynamic> _$$UrunGrubunaGoreSatisGrafigiRequestModelImplToJson(
    _$UrunGrubunaGoreSatisGrafigiRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ARR_PLASIYER_KODU', instance.arrPlasiyerKodu);
  writeNotNull('BASLAMA_TARIHI', instance.baslamaTarihi);
  writeNotNull('BITIS_TARIHI', instance.bitisTarihi);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('DONEM_TIPI', instance.donemTipi);
  writeNotNull('GRUP_NO', instance.grupNo);
  writeNotNull('IRS_DAHIL', instance.irsDahil);
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('TIPI', instance.tipi);
  return val;
}

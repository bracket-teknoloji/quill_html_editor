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
          grupla: json['GRUPLA'] as String?,
          projeKodu: json['PROJE_KODU'] as String?,
          tipi: json['TIPI'] as String?,
        );

Map<String, dynamic> _$$UrunGrubunaGoreSatisGrafigiRequestModelImplToJson(
        _$UrunGrubunaGoreSatisGrafigiRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.arrPlasiyerKodu case final value?)
        'ARR_PLASIYER_KODU': value,
      if (instance.baslamaTarihi case final value?) 'BASLAMA_TARIHI': value,
      if (instance.bitisTarihi case final value?) 'BITIS_TARIHI': value,
      if (instance.cariKodu case final value?) 'CARI_KODU': value,
      if (instance.donemTipi case final value?) 'DONEM_TIPI': value,
      if (instance.grupNo case final value?) 'GRUP_NO': value,
      if (instance.irsDahil case final value?) 'IRS_DAHIL': value,
      if (instance.grupla case final value?) 'GRUPLA': value,
      if (instance.projeKodu case final value?) 'PROJE_KODU': value,
      if (instance.tipi case final value?) 'TIPI': value,
    };

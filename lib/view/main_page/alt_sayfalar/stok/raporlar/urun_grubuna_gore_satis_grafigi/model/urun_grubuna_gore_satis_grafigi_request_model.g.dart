// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'urun_grubuna_gore_satis_grafigi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UrunGrubunaGoreSatisGrafigiRequestModelImpl
    _$$UrunGrubunaGoreSatisGrafigiRequestModelImplFromJson(
            Map<String, dynamic> json) =>
        _$UrunGrubunaGoreSatisGrafigiRequestModelImpl(
          arrPlasiyerKodu: (json['ArrPlasiyerKodu'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
          baslamaTarihi: json['BaslamaTarihi'] as String?,
          bitisTarihi: json['BitisTarihi'] as String?,
          cariKodu: json['CariKodu'] as String?,
          donemTipi: json['DonemTipi'] as String?,
          grupNo: (json['GrupNo'] as num?)?.toInt(),
          irsDahil: json['IrsDahil'] as String?,
          grupla: json['Grupla'] as String?,
          projeKodu: json['ProjeKodu'] as String?,
          tipi: json['Tipi'] as String?,
        );

Map<String, dynamic> _$$UrunGrubunaGoreSatisGrafigiRequestModelImplToJson(
        _$UrunGrubunaGoreSatisGrafigiRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.arrPlasiyerKodu case final value?) 'ArrPlasiyerKodu': value,
      if (instance.baslamaTarihi case final value?) 'BaslamaTarihi': value,
      if (instance.bitisTarihi case final value?) 'BitisTarihi': value,
      if (instance.cariKodu case final value?) 'CariKodu': value,
      if (instance.donemTipi case final value?) 'DonemTipi': value,
      if (instance.grupNo case final value?) 'GrupNo': value,
      if (instance.irsDahil case final value?) 'IrsDahil': value,
      if (instance.grupla case final value?) 'Grupla': value,
      if (instance.projeKodu case final value?) 'ProjeKodu': value,
      if (instance.tipi case final value?) 'Tipi': value,
    };

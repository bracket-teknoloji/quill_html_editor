// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'urun_grubuna_gore_satis_grafigi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UrunGrubunaGoreSatisGrafigiRequestModel
_$UrunGrubunaGoreSatisGrafigiRequestModelFromJson(Map<String, dynamic> json) =>
    _UrunGrubunaGoreSatisGrafigiRequestModel(
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

Map<String, dynamic> _$UrunGrubunaGoreSatisGrafigiRequestModelToJson(
  _UrunGrubunaGoreSatisGrafigiRequestModel instance,
) => <String, dynamic>{
  'ArrPlasiyerKodu': ?instance.arrPlasiyerKodu,
  'BaslamaTarihi': ?instance.baslamaTarihi,
  'BitisTarihi': ?instance.bitisTarihi,
  'CariKodu': ?instance.cariKodu,
  'DonemTipi': ?instance.donemTipi,
  'GrupNo': ?instance.grupNo,
  'IrsDahil': ?instance.irsDahil,
  'Grupla': ?instance.grupla,
  'ProjeKodu': ?instance.projeKodu,
  'Tipi': ?instance.tipi,
};

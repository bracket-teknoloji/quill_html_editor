// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'urun_grubuna_gore_satis_grafigi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UrunGrubunaGoreSatisGrafigiRequestModel
    _$UrunGrubunaGoreSatisGrafigiRequestModelFromJson(
            Map<String, dynamic> json) =>
        UrunGrubunaGoreSatisGrafigiRequestModel(
          arrPlasiyerKodu: (json['ArrPlasiyerKodu'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
          baslamaTarihi: json['BaslamaTarihi'] as String?,
          bitisTarihi: json['BitisTarihi'] as String?,
          cariKodu: json['CariKodu'] as String?,
          donemTipi: json['DonemTipi'] as String?,
          grupNo: (json['GrupNo'] as num?)?.toInt(),
          irsDahil: json['IrsDahil'] as String?,
          projeKodu: json['ProjeKodu'] as String?,
        );

Map<String, dynamic> _$UrunGrubunaGoreSatisGrafigiRequestModelToJson(
    UrunGrubunaGoreSatisGrafigiRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ArrPlasiyerKodu', instance.arrPlasiyerKodu);
  writeNotNull('BaslamaTarihi', instance.baslamaTarihi);
  writeNotNull('BitisTarihi', instance.bitisTarihi);
  writeNotNull('CariKodu', instance.cariKodu);
  writeNotNull('DonemTipi', instance.donemTipi);
  writeNotNull('GrupNo', instance.grupNo);
  writeNotNull('IrsDahil', instance.irsDahil);
  writeNotNull('ProjeKodu', instance.projeKodu);
  return val;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_grup_kodu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseGrupKoduModel _$BaseGrupKoduModelFromJson(Map<String, dynamic> json) =>
    BaseGrupKoduModel()
      ..modul = json['MODUL'] as String?
      ..grupNo = json['GRUP_NO'] as int?
      ..grupKodu = json['GRUP_KODU'] as String?
      ..grupAdi = json['GRUP_ADI'] as String?
      ..tip = json['TIP'] as String?
      ..kod1 = json['KOD1'] as String?
      ..kod2 = json['KOD2'] as String?
      ..kod3 = json['KOD3'] as String?
      ..kod4 = json['KOD4'] as String?
      ..kod5 = json['KOD5'] as String?
      ..kod1Adi = json['KOD1_ADI'] as String?
      ..kod2Adi = json['KOD2_ADI'] as String?
      ..kod3Adi = json['KOD3_ADI'] as String?
      ..kod4Adi = json['KOD4_ADI'] as String?
      ..kod5Adi = json['KOD5_ADI'] as String?;

Map<String, dynamic> _$BaseGrupKoduModelToJson(BaseGrupKoduModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MODUL', instance.modul);
  writeNotNull('GRUP_NO', instance.grupNo);
  writeNotNull('GRUP_KODU', instance.grupKodu);
  writeNotNull('GRUP_ADI', instance.grupAdi);
  writeNotNull('TIP', instance.tip);
  writeNotNull('KOD1', instance.kod1);
  writeNotNull('KOD2', instance.kod2);
  writeNotNull('KOD3', instance.kod3);
  writeNotNull('KOD4', instance.kod4);
  writeNotNull('KOD5', instance.kod5);
  writeNotNull('KOD1_ADI', instance.kod1Adi);
  writeNotNull('KOD2_ADI', instance.kod2Adi);
  writeNotNull('KOD3_ADI', instance.kod3Adi);
  writeNotNull('KOD4_ADI', instance.kod4Adi);
  writeNotNull('KOD5_ADI', instance.kod5Adi);
  return val;
}

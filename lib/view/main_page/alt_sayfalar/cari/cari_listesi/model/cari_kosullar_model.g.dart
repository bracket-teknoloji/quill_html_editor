// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'cari_kosullar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariKosullarModel _$CariKosullarModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CariKosullarModel',
      json,
      ($checkedConvert) {
        final val = CariKosullarModel();
        $checkedConvert(
            'KOSUL_SABIT_ADI', (v) => val.kosulSabitAdi = v as String?);
        $checkedConvert('KOSUL_KODU', (v) => val.kosulKodu = v as String?);
        $checkedConvert('GENISK1_O', (v) => val.genisk1O = v as int?);
        $checkedConvert('GENISK2_O', (v) => val.genisk2O = v as int?);
        $checkedConvert('GENISK3_O', (v) => val.genisk3O = v as int?);
        $checkedConvert(
            'GENEL_KOSUL_ADI', (v) => val.genelKosulAdi = v as String?);
        $checkedConvert('BASLANGICTAR', (v) => val.baslangictar = v as String?);
        $checkedConvert('VADE_GUNU', (v) => val.vadeGunu = v as int?);
        $checkedConvert('GENISK1_TIPI', (v) => val.genisk1Tipi = v as int?);
        $checkedConvert('GENISK2_TIPI', (v) => val.genisk2Tipi = v as int?);
        $checkedConvert('GENISK3_TIPI', (v) => val.genisk3Tipi = v as int?);
        $checkedConvert('SATISK1_TIPI', (v) => val.satisk1Tipi = v as int?);
        $checkedConvert('SATISK2_TIPI', (v) => val.satisk2Tipi = v as int?);
        $checkedConvert('SATISK3_TIPI', (v) => val.satisk3Tipi = v as int?);
        $checkedConvert('SATISK4_TIPI', (v) => val.satisk4Tipi = v as int?);
        $checkedConvert('SATISK5_TIPI', (v) => val.satisk5Tipi = v as int?);
        $checkedConvert('SATISK6_TIPI', (v) => val.satisk6Tipi = v as int?);
        $checkedConvert('ISK_ARA_AKTIF', (v) => val.iskAraAktif = v as String?);
        $checkedConvert(
            'ISK_ARA_MIKTUT', (v) => val.iskAraMiktut = v as String?);
        $checkedConvert('ISK_ARA_DEGER1',
            (v) => val.iskAraDeger1 = (v as num?)?.toDouble());
        $checkedConvert('ISK_ARA_DEGER2',
            (v) => val.iskAraDeger2 = (v as num?)?.toDouble());
        $checkedConvert('ISK_ARA_DEGER3',
            (v) => val.iskAraDeger3 = (v as num?)?.toDouble());
        $checkedConvert('ISK_ARA_HANGI_ISK',
            (v) => val.iskAraHangiIsk = (v as num?)?.toDouble());
        $checkedConvert(
            'ISK_ARA_ISK1', (v) => val.iskAraIsk1 = (v as num?)?.toDouble());
        $checkedConvert(
            'ISK_ARA_ISK2', (v) => val.iskAraIsk2 = (v as num?)?.toDouble());
        $checkedConvert(
            'ISK_ARA_ISK3', (v) => val.iskAraIsk3 = (v as num?)?.toDouble());
        return val;
      },
      fieldKeyMap: const {
        'kosulSabitAdi': 'KOSUL_SABIT_ADI',
        'kosulKodu': 'KOSUL_KODU',
        'genisk1O': 'GENISK1_O',
        'genisk2O': 'GENISK2_O',
        'genisk3O': 'GENISK3_O',
        'genelKosulAdi': 'GENEL_KOSUL_ADI',
        'baslangictar': 'BASLANGICTAR',
        'vadeGunu': 'VADE_GUNU',
        'genisk1Tipi': 'GENISK1_TIPI',
        'genisk2Tipi': 'GENISK2_TIPI',
        'genisk3Tipi': 'GENISK3_TIPI',
        'satisk1Tipi': 'SATISK1_TIPI',
        'satisk2Tipi': 'SATISK2_TIPI',
        'satisk3Tipi': 'SATISK3_TIPI',
        'satisk4Tipi': 'SATISK4_TIPI',
        'satisk5Tipi': 'SATISK5_TIPI',
        'satisk6Tipi': 'SATISK6_TIPI',
        'iskAraAktif': 'ISK_ARA_AKTIF',
        'iskAraMiktut': 'ISK_ARA_MIKTUT',
        'iskAraDeger1': 'ISK_ARA_DEGER1',
        'iskAraDeger2': 'ISK_ARA_DEGER2',
        'iskAraDeger3': 'ISK_ARA_DEGER3',
        'iskAraHangiIsk': 'ISK_ARA_HANGI_ISK',
        'iskAraIsk1': 'ISK_ARA_ISK1',
        'iskAraIsk2': 'ISK_ARA_ISK2',
        'iskAraIsk3': 'ISK_ARA_ISK3'
      },
    );

Map<String, dynamic> _$CariKosullarModelToJson(CariKosullarModel instance) =>
    <String, dynamic>{
      'KOSUL_SABIT_ADI': instance.kosulSabitAdi,
      'KOSUL_KODU': instance.kosulKodu,
      'GENISK1_O': instance.genisk1O,
      'GENISK2_O': instance.genisk2O,
      'GENISK3_O': instance.genisk3O,
      'GENEL_KOSUL_ADI': instance.genelKosulAdi,
      'BASLANGICTAR': instance.baslangictar,
      'VADE_GUNU': instance.vadeGunu,
      'GENISK1_TIPI': instance.genisk1Tipi,
      'GENISK2_TIPI': instance.genisk2Tipi,
      'GENISK3_TIPI': instance.genisk3Tipi,
      'SATISK1_TIPI': instance.satisk1Tipi,
      'SATISK2_TIPI': instance.satisk2Tipi,
      'SATISK3_TIPI': instance.satisk3Tipi,
      'SATISK4_TIPI': instance.satisk4Tipi,
      'SATISK5_TIPI': instance.satisk5Tipi,
      'SATISK6_TIPI': instance.satisk6Tipi,
      'ISK_ARA_AKTIF': instance.iskAraAktif,
      'ISK_ARA_MIKTUT': instance.iskAraMiktut,
      'ISK_ARA_DEGER1': instance.iskAraDeger1,
      'ISK_ARA_DEGER2': instance.iskAraDeger2,
      'ISK_ARA_DEGER3': instance.iskAraDeger3,
      'ISK_ARA_HANGI_ISK': instance.iskAraHangiIsk,
      'ISK_ARA_ISK1': instance.iskAraIsk1,
      'ISK_ARA_ISK2': instance.iskAraIsk2,
      'ISK_ARA_ISK3': instance.iskAraIsk3,
    };

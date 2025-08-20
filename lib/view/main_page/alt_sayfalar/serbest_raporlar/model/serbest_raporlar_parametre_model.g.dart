// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serbest_raporlar_parametre_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerbestRaporParametreModel _$SerbestRaporParametreModelFromJson(
  Map<String, dynamic> json,
) => SerbestRaporParametreModel()
  ..parametreAdi = json['PARAMETRE_ADI'] as String?
  ..parametreTanimi = json['PARAMETRE_TANIMI'] as String?
  ..degerTemizlenmesin = json['DEGER_TEMIZLENMESIN'] as bool?
  ..enterIslemYap = json['ENTER_ISLEM_YAP'] as bool?;

Map<String, dynamic> _$SerbestRaporParametreModelToJson(
  SerbestRaporParametreModel instance,
) => <String, dynamic>{
  'PARAMETRE_ADI': ?instance.parametreAdi,
  'PARAMETRE_TANIMI': ?instance.parametreTanimi,
  'DEGER_TEMIZLENMESIN': ?instance.degerTemizlenmesin,
  'ENTER_ISLEM_YAP': ?instance.enterIslemYap,
};

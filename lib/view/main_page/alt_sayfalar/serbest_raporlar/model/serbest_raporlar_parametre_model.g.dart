// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serbest_raporlar_parametre_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerbestRaporParametreModel _$SerbestRaporParametreModelFromJson(Map<String, dynamic> json) =>
    SerbestRaporParametreModel()
      ..parametreAdi = json['PARAMETRE_ADI'] as String?
      ..parametreTanimi = json['PARAMETRE_TANIMI'] as String?
      ..degerTemizlenmesin = json['DEGER_TEMIZLENMESIN'] as bool?
      ..enterIslemYap = json['ENTER_ISLEM_YAP'] as bool?;

Map<String, dynamic> _$SerbestRaporParametreModelToJson(SerbestRaporParametreModel instance) => <String, dynamic>{
  if (instance.parametreAdi case final value?) 'PARAMETRE_ADI': value,
  if (instance.parametreTanimi case final value?) 'PARAMETRE_TANIMI': value,
  if (instance.degerTemizlenmesin case final value?) 'DEGER_TEMIZLENMESIN': value,
  if (instance.enterIslemYap case final value?) 'ENTER_ISLEM_YAP': value,
};

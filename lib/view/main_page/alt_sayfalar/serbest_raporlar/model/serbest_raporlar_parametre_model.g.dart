// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serbest_raporlar_parametre_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerbestRaporParametreModel _$SerbestRaporParametreModelFromJson(
        Map<String, dynamic> json) =>
    SerbestRaporParametreModel()
      ..parametreAdi = json['PARAMETRE_ADI'] as String?
      ..parametreTanimi = json['PARAMETRE_TANIMI'] as String?
      ..degerTemizlenmesin = json['DEGER_TEMIZLENMESIN'] as bool?
      ..enterIslemYap = json['ENTER_ISLEM_YAP'] as bool?;

Map<String, dynamic> _$SerbestRaporParametreModelToJson(
    SerbestRaporParametreModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PARAMETRE_ADI', instance.parametreAdi);
  writeNotNull('PARAMETRE_TANIMI', instance.parametreTanimi);
  writeNotNull('DEGER_TEMIZLENMESIN', instance.degerTemizlenmesin);
  writeNotNull('ENTER_ISLEM_YAP', instance.enterIslemYap);
  return val;
}

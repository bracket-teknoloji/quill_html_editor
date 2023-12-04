// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_fatura_ozel_kod_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EFaturaOzelKodModelImpl _$$EFaturaOzelKodModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EFaturaOzelKodModelImpl(
      tip: json['TIP'] as int?,
      tipAdi: json['TIP_ADI'] as String?,
      kod: json['KOD'] as int?,
      aciklama: json['ACIKLAMA'] as String?,
    );

Map<String, dynamic> _$$EFaturaOzelKodModelImplToJson(
    _$EFaturaOzelKodModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TIP', instance.tip);
  writeNotNull('TIP_ADI', instance.tipAdi);
  writeNotNull('KOD', instance.kod);
  writeNotNull('ACIKLAMA', instance.aciklama);
  return val;
}

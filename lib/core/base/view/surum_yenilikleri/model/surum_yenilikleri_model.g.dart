// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surum_yenilikleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SurumYenilikleriModel _$SurumYenilikleriModelFromJson(
  Map<String, dynamic> json,
) => _SurumYenilikleriModel(
  surumKodu: (json['SURUM_KODU'] as num?)?.toInt(),
  versiyon: json['VERSIYON'] as String?,
  surumAdi: json['SURUM_ADI'] as String?,
  yer: json['YER'] as String?,
  liste: (json['LISTE'] as List<dynamic>?)
      ?.map((e) => ValueList.fromJson(e as Map<String, dynamic>))
      .toList(),
  listAciklama: (json['LIST_ACIKLAMA'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
);

Map<String, dynamic> _$SurumYenilikleriModelToJson(
  _SurumYenilikleriModel instance,
) => <String, dynamic>{
  'SURUM_KODU': ?instance.surumKodu,
  'VERSIYON': ?instance.versiyon,
  'SURUM_ADI': ?instance.surumAdi,
  'YER': ?instance.yer,
  'LISTE': ?instance.liste?.map((e) => e.toJson()).toList(),
  'LIST_ACIKLAMA': ?instance.listAciklama,
  'TARIH': ?instance.tarih?.toIso8601String(),
};

_ValueList _$ValueListFromJson(Map<String, dynamic> json) => _ValueList(
  id: (json['ID'] as num?)?.toInt(),
  aciklama: json['ACIKLAMA'] as String?,
  talepEden: json['TALEP_EDEN'] as bool?,
);

Map<String, dynamic> _$ValueListToJson(_ValueList instance) =>
    <String, dynamic>{
      'ID': ?instance.id,
      'ACIKLAMA': ?instance.aciklama,
      'TALEP_EDEN': ?instance.talepEden,
    };

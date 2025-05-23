// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surum_yenilikleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SurumYenilikleriModelImpl _$$SurumYenilikleriModelImplFromJson(Map<String, dynamic> json) =>
    _$SurumYenilikleriModelImpl(
      surumKodu: (json['SURUM_KODU'] as num?)?.toInt(),
      versiyon: json['VERSIYON'] as String?,
      surumAdi: json['SURUM_ADI'] as String?,
      yer: json['YER'] as String?,
      liste: (json['LISTE'] as List<dynamic>?)?.map((e) => ValueList.fromJson(e as Map<String, dynamic>)).toList(),
      listAciklama: (json['LIST_ACIKLAMA'] as List<dynamic>?)?.map((e) => e as String).toList(),
      tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
    );

Map<String, dynamic> _$$SurumYenilikleriModelImplToJson(_$SurumYenilikleriModelImpl instance) => <String, dynamic>{
  if (instance.surumKodu case final value?) 'SURUM_KODU': value,
  if (instance.versiyon case final value?) 'VERSIYON': value,
  if (instance.surumAdi case final value?) 'SURUM_ADI': value,
  if (instance.yer case final value?) 'YER': value,
  if (instance.liste?.map((e) => e.toJson()).toList() case final value?) 'LISTE': value,
  if (instance.listAciklama case final value?) 'LIST_ACIKLAMA': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
};

_$ValueListImpl _$$ValueListImplFromJson(Map<String, dynamic> json) => _$ValueListImpl(
  id: (json['ID'] as num?)?.toInt(),
  aciklama: json['ACIKLAMA'] as String?,
  talepEden: json['TALEP_EDEN'] as bool?,
);

Map<String, dynamic> _$$ValueListImplToJson(_$ValueListImpl instance) => <String, dynamic>{
  if (instance.id case final value?) 'ID': value,
  if (instance.aciklama case final value?) 'ACIKLAMA': value,
  if (instance.talepEden case final value?) 'TALEP_EDEN': value,
};

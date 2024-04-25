// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surum_yenilikleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SurumYenilikleriModelImpl _$$SurumYenilikleriModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SurumYenilikleriModelImpl(
      surumKodu: (json['SURUM_KODU'] as num?)?.toInt(),
      versiyon: json['VERSIYON'] as String?,
      surumAdi: json['SURUM_ADI'],
      yer: json['YER'],
      liste: (json['LISTE'] as List<dynamic>?)
          ?.map((e) => ValueList.fromJson(e as Map<String, dynamic>))
          .toList(),
      listAciklama: json['LIST_ACIKLAMA'] as List<dynamic>?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
    );

Map<String, dynamic> _$$SurumYenilikleriModelImplToJson(
    _$SurumYenilikleriModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SURUM_KODU', instance.surumKodu);
  writeNotNull('VERSIYON', instance.versiyon);
  writeNotNull('SURUM_ADI', instance.surumAdi);
  writeNotNull('YER', instance.yer);
  writeNotNull('LISTE', instance.liste?.map((e) => e.toJson()).toList());
  writeNotNull('LIST_ACIKLAMA', instance.listAciklama);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  return val;
}

_$ValueListImpl _$$ValueListImplFromJson(Map<String, dynamic> json) =>
    _$ValueListImpl(
      id: (json['ID'] as num?)?.toInt(),
      aciklama: json['ACIKLAMA'] as String?,
      talepEden: json['TALEP_EDEN'] as bool?,
    );

Map<String, dynamic> _$$ValueListImplToJson(_$ValueListImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.id);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('TALEP_EDEN', instance.talepEden);
  return val;
}

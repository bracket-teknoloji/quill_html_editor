// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kod_degistir_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KodDegistirModel _$KodDegistirModelFromJson(Map<String, dynamic> json) =>
    KodDegistirModel()
      ..kaynakSil = json['KAYNAK_SIL'] as String?
      ..kaynakCari = json['KAYNAK_CARI'] as String?
      ..hedefCari = json['HEDEF_CARI'] as String?;

Map<String, dynamic> _$KodDegistirModelToJson(KodDegistirModel instance) =>
    <String, dynamic>{
      'KAYNAK_SIL': instance.kaynakSil,
      'KAYNAK_CARI': instance.kaynakCari,
      'HEDEF_CARI': instance.hedefCari,
    };

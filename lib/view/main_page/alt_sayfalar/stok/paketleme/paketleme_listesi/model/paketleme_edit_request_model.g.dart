// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paketleme_edit_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaketlemeEditRequestModel _$PaketlemeEditRequestModelFromJson(
  Map<String, dynamic> json,
) => _PaketlemeEditRequestModel(
  islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
  paketId: (json['PAKET_ID'] as num?)?.toInt(),
  kalemId: (json['KALEM_ID'] as num?)?.toInt(),
);

Map<String, dynamic> _$PaketlemeEditRequestModelToJson(
  _PaketlemeEditRequestModel instance,
) => <String, dynamic>{
  'ISLEM_KODU': ?instance.islemKodu,
  'PAKET_ID': ?instance.paketId,
  'KALEM_ID': ?instance.kalemId,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paketleme_edit_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaketlemeEditRequestModelImpl _$$PaketlemeEditRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaketlemeEditRequestModelImpl(
      islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
      paketId: (json['PAKET_ID'] as num?)?.toInt(),
      kalemId: (json['KALEM_ID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PaketlemeEditRequestModelImplToJson(
        _$PaketlemeEditRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.islemKodu case final value?) 'ISLEM_KODU': value,
      if (instance.paketId case final value?) 'PAKET_ID': value,
      if (instance.kalemId case final value?) 'KALEM_ID': value,
    };

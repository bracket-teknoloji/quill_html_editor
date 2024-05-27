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
    _$PaketlemeEditRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ISLEM_KODU', instance.islemKodu);
  writeNotNull('PAKET_ID', instance.paketId);
  writeNotNull('KALEM_ID', instance.kalemId);
  return val;
}

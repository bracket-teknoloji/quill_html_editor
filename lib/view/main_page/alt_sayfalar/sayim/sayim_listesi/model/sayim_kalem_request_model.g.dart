// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sayim_kalem_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SayimKalemRequestModelImpl _$$SayimKalemRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SayimKalemRequestModelImpl(
      id: (json['ID'] as num?)?.toInt(),
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      belgeNo: json['BELGE_NO'] as String?,
    );

Map<String, dynamic> _$$SayimKalemRequestModelImplToJson(
    _$SayimKalemRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.id);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('BELGE_NO', instance.belgeNo);
  return val;
}

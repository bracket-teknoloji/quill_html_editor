// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evrak_edit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EvrakEditModelImpl _$$EvrakEditModelImplFromJson(Map<String, dynamic> json) => _$EvrakEditModelImpl(
  aciklama: json['ACIKLAMA'] as String?,
  base64Data: json['BASE64_DATA'] as String?,
  belgeNo: json['BELGE_NO'] as String?,
  belgeTipi: json['BELGE_TIPI'] as String?,
  boyutByte: (json['BOYUT_BYTE'] as num?)?.toInt(),
  islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
);

Map<String, dynamic> _$$EvrakEditModelImplToJson(_$EvrakEditModelImpl instance) => <String, dynamic>{
  if (instance.aciklama case final value?) 'ACIKLAMA': value,
  if (instance.base64Data case final value?) 'BASE64_DATA': value,
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
  if (instance.boyutByte case final value?) 'BOYUT_BYTE': value,
  if (instance.islemKodu case final value?) 'ISLEM_KODU': value,
};

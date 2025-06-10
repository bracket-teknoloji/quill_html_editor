// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cek_senet_evrak_ekle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CekSenetEvrakEkleModel _$CekSenetEvrakEkleModelFromJson(
  Map<String, dynamic> json,
) => _CekSenetEvrakEkleModel(
  aciklama: json['ACIKLAMA'] as String?,
  base64Data: json['BASE64_DATA'] as String?,
  belgeNo: json['BELGE_NO'] as String?,
  belgeTipi: json['BELGE_TIPI'] as String?,
  boyutByte: (json['BOYUT_BYTE'] as num?)?.toInt(),
  islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
);

Map<String, dynamic> _$CekSenetEvrakEkleModelToJson(
  _CekSenetEvrakEkleModel instance,
) => <String, dynamic>{
  if (instance.aciklama case final value?) 'ACIKLAMA': value,
  if (instance.base64Data case final value?) 'BASE64_DATA': value,
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
  if (instance.boyutByte case final value?) 'BOYUT_BYTE': value,
  if (instance.islemKodu case final value?) 'ISLEM_KODU': value,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evrak_edit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EvrakEditModelImpl _$$EvrakEditModelImplFromJson(Map<String, dynamic> json) =>
    _$EvrakEditModelImpl(
      aciklama: json['ACIKLAMA'] as String?,
      base64Data: json['BASE64_DATA'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      boyutByte: (json['BOYUT_BYTE'] as num?)?.toInt(),
      islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$EvrakEditModelImplToJson(
    _$EvrakEditModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('BASE64_DATA', instance.base64Data);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('BOYUT_BYTE', instance.boyutByte);
  writeNotNull('ISLEM_KODU', instance.islemKodu);
  return val;
}

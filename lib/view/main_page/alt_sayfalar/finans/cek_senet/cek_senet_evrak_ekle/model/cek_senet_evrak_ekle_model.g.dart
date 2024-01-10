// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cek_senet_evrak_ekle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CekSenetEvrakEkleModelImpl _$$CekSenetEvrakEkleModelImplFromJson(Map<String, dynamic> json) => _$CekSenetEvrakEkleModelImpl(
      aciklama: json['ACIKLAMA'] as String?,
      base64Data: json['BASE64_DATA'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      boyutByte: json['BOYUT_BYTE'] as int?,
      islemKodu: json['ISLEM_KODU'] as int?,
    );

Map<String, dynamic> _$$CekSenetEvrakEkleModelImplToJson(_$CekSenetEvrakEkleModelImpl instance) {
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_uret_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeriUretModelImpl _$$SeriUretModelImplFromJson(Map<String, dynamic> json) =>
    _$SeriUretModelImpl(
      seriNo: json['SERI_NO'] as String?,
      stokKodu: json['STOK_KODU'] as String?,
      sonNo: json['SON_NO'] as int?,
    );

Map<String, dynamic> _$$SeriUretModelImplToJson(_$SeriUretModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SERI_NO', instance.seriNo);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('SON_NO', instance.sonNo);
  return val;
}

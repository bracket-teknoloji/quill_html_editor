// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evraklar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EvraklarModelImpl _$$EvraklarModelImplFromJson(Map<String, dynamic> json) =>
    _$EvraklarModelImpl(
      id: json['ID'] as int?,
      belgeNo: json['BELGE_NO'] as String?,
      aciklama: json['ACIKLAMA'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      resimUrl: json['RESIM_URL'] as String?,
      resimUrlKucuk: json['RESIM_URL_KUCUK'] as String?,
      boyutByte: json['BOYUT_BYTE'] as int?,
      islemKodu: json['ISLEM_KODU'] as int?,
    );

Map<String, dynamic> _$$EvraklarModelImplToJson(_$EvraklarModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.id);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('RESIM_URL', instance.resimUrl);
  writeNotNull('RESIM_URL_KUCUK', instance.resimUrlKucuk);
  writeNotNull('BOYUT_BYTE', instance.boyutByte);
  writeNotNull('ISLEM_KODU', instance.islemKodu);
  return val;
}

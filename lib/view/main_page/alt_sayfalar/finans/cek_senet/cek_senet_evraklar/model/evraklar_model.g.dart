// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evraklar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EvraklarModelImpl _$$EvraklarModelImplFromJson(Map<String, dynamic> json) =>
    _$EvraklarModelImpl(
      id: (json['ID'] as num?)?.toInt(),
      belgeNo: json['BELGE_NO'] as String?,
      aciklama: json['ACIKLAMA'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      resimUrl: json['RESIM_URL'] as String?,
      resimUrlKucuk: json['RESIM_URL_KUCUK'] as String?,
      boyutByte: (json['BOYUT_BYTE'] as num?)?.toInt(),
      islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$EvraklarModelImplToJson(_$EvraklarModelImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'ID': value,
      if (instance.belgeNo case final value?) 'BELGE_NO': value,
      if (instance.aciklama case final value?) 'ACIKLAMA': value,
      if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
      if (instance.resimUrl case final value?) 'RESIM_URL': value,
      if (instance.resimUrlKucuk case final value?) 'RESIM_URL_KUCUK': value,
      if (instance.boyutByte case final value?) 'BOYUT_BYTE': value,
      if (instance.islemKodu case final value?) 'ISLEM_KODU': value,
    };

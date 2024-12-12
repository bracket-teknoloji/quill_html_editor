// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paketleme_listesi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaketlemeListesiRequestModelImpl _$$PaketlemeListesiRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaketlemeListesiRequestModelImpl(
      id: (json['ID'] as num?)?.toInt(),
      stokKodu: json['StokKodu'] as String?,
      belgeNo: json['BelgeNo'] as String?,
      menuKodu: json['MenuKodu'] as String?,
      depoKodu: (json['DepoKodu'] as num?)?.toInt(),
      paketKodu: json['PaketKodu'] as String?,
      islemKodu: (json['IslemKodu'] as num?)?.toInt(),
      kisitYok: json['KisitYok'] as String?,
      ekranTipi: json['EkranTipi'] as String?,
      paketId: (json['PaketID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PaketlemeListesiRequestModelImplToJson(
        _$PaketlemeListesiRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'ID': value,
      if (instance.stokKodu case final value?) 'StokKodu': value,
      if (instance.belgeNo case final value?) 'BelgeNo': value,
      if (instance.menuKodu case final value?) 'MenuKodu': value,
      if (instance.depoKodu case final value?) 'DepoKodu': value,
      if (instance.paketKodu case final value?) 'PaketKodu': value,
      if (instance.islemKodu case final value?) 'IslemKodu': value,
      if (instance.kisitYok case final value?) 'KisitYok': value,
      if (instance.ekranTipi case final value?) 'EkranTipi': value,
      if (instance.paketId case final value?) 'PaketID': value,
    };

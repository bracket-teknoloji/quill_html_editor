// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paketleme_listesi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaketlemeListesiRequestModel _$PaketlemeListesiRequestModelFromJson(
  Map<String, dynamic> json,
) => _PaketlemeListesiRequestModel(
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

Map<String, dynamic> _$PaketlemeListesiRequestModelToJson(
  _PaketlemeListesiRequestModel instance,
) => <String, dynamic>{
  'ID': ?instance.id,
  'StokKodu': ?instance.stokKodu,
  'BelgeNo': ?instance.belgeNo,
  'MenuKodu': ?instance.menuKodu,
  'DepoKodu': ?instance.depoKodu,
  'PaketKodu': ?instance.paketKodu,
  'IslemKodu': ?instance.islemKodu,
  'KisitYok': ?instance.kisitYok,
  'EkranTipi': ?instance.ekranTipi,
  'PaketID': ?instance.paketId,
};

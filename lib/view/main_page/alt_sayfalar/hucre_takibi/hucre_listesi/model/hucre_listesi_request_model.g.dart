// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_listesi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HucreListesiRequestModel _$HucreListesiRequestModelFromJson(
  Map<String, dynamic> json,
) => _HucreListesiRequestModel(
  depoKodu: (json['DepoKodu'] as num?)?.toInt() ?? 0,
  hucreKodu: json['HucreKodu'] as String? ?? "",
  filterText: json['FilterText'] as String? ?? "",
  tempBarkod: json['TempBarkod'] as String?,
  inckeyno: (json['Inckeyno'] as num?)?.toInt(),
  depoTanimi: json['DepoTanimi'] as String?,
  hareketId: (json['HareketId'] as num?)?.toInt(),
  kayitTipi: json['KayitTipi'] as String?,
  kayitTipiAdi: json['KayitTipiAdi'] as String?,
  belgeNo: json['BelgeNo'] as String?,
  belgeTipi: json['BelgeTipi'] as String?,
  belgeTipiAdi: json['BelgeTipiAdi'] as String?,
  haracik: json['Haracik'] as String?,
  gckod: json['Gckod'] as String?,
  subeKodu: (json['SubeKodu'] as num?)?.toInt(),
  tarih: json['Tarih'] == null ? null : DateTime.parse(json['Tarih'] as String),
  stharInc: (json['StharInc'] as num?)?.toInt(),
  yedek4: (json['Yedek4'] as num?)?.toInt(),
  yedek4Str: json['Yedek4Str'] as String?,
  yedek8: json['Yedek8'] as String?,
  seriSayisi: (json['SeriSayisi'] as num?)?.toInt(),
  paketKodu: json['PaketKodu'] as String?,
  cariKodu: json['CariKodu'] as String?,
);

Map<String, dynamic> _$HucreListesiRequestModelToJson(
  _HucreListesiRequestModel instance,
) => <String, dynamic>{
  'DepoKodu': ?instance.depoKodu,
  'HucreKodu': ?instance.hucreKodu,
  'FilterText': ?instance.filterText,
  'TempBarkod': ?instance.tempBarkod,
  'Inckeyno': ?instance.inckeyno,
  'DepoTanimi': ?instance.depoTanimi,
  'HareketId': ?instance.hareketId,
  'KayitTipi': ?instance.kayitTipi,
  'KayitTipiAdi': ?instance.kayitTipiAdi,
  'BelgeNo': ?instance.belgeNo,
  'BelgeTipi': ?instance.belgeTipi,
  'BelgeTipiAdi': ?instance.belgeTipiAdi,
  'Haracik': ?instance.haracik,
  'Gckod': ?instance.gckod,
  'SubeKodu': ?instance.subeKodu,
  'Tarih': ?instance.tarih?.toIso8601String(),
  'StharInc': ?instance.stharInc,
  'Yedek4': ?instance.yedek4,
  'Yedek4Str': ?instance.yedek4Str,
  'Yedek8': ?instance.yedek8,
  'SeriSayisi': ?instance.seriSayisi,
  'PaketKodu': ?instance.paketKodu,
  'CariKodu': ?instance.cariKodu,
};

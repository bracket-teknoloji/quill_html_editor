// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_listesi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HucreListesiRequestModelImpl _$$HucreListesiRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HucreListesiRequestModelImpl(
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
      tarih: json['Tarih'] == null
          ? null
          : DateTime.parse(json['Tarih'] as String),
      stharInc: (json['StharInc'] as num?)?.toInt(),
      yedek4: (json['Yedek4'] as num?)?.toInt(),
      yedek4Str: json['Yedek4Str'] as String?,
      yedek8: json['Yedek8'] as String?,
      seriSayisi: (json['SeriSayisi'] as num?)?.toInt(),
      paketKodu: json['PaketKodu'] as String?,
      cariKodu: json['CariKodu'] as String?,
    );

Map<String, dynamic> _$$HucreListesiRequestModelImplToJson(
        _$HucreListesiRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.depoKodu case final value?) 'DepoKodu': value,
      if (instance.hucreKodu case final value?) 'HucreKodu': value,
      if (instance.filterText case final value?) 'FilterText': value,
      if (instance.tempBarkod case final value?) 'TempBarkod': value,
      if (instance.inckeyno case final value?) 'Inckeyno': value,
      if (instance.depoTanimi case final value?) 'DepoTanimi': value,
      if (instance.hareketId case final value?) 'HareketId': value,
      if (instance.kayitTipi case final value?) 'KayitTipi': value,
      if (instance.kayitTipiAdi case final value?) 'KayitTipiAdi': value,
      if (instance.belgeNo case final value?) 'BelgeNo': value,
      if (instance.belgeTipi case final value?) 'BelgeTipi': value,
      if (instance.belgeTipiAdi case final value?) 'BelgeTipiAdi': value,
      if (instance.haracik case final value?) 'Haracik': value,
      if (instance.gckod case final value?) 'Gckod': value,
      if (instance.subeKodu case final value?) 'SubeKodu': value,
      if (instance.tarih?.toIso8601String() case final value?) 'Tarih': value,
      if (instance.stharInc case final value?) 'StharInc': value,
      if (instance.yedek4 case final value?) 'Yedek4': value,
      if (instance.yedek4Str case final value?) 'Yedek4Str': value,
      if (instance.yedek8 case final value?) 'Yedek8': value,
      if (instance.seriSayisi case final value?) 'SeriSayisi': value,
      if (instance.paketKodu case final value?) 'PaketKodu': value,
      if (instance.cariKodu case final value?) 'CariKodu': value,
    };

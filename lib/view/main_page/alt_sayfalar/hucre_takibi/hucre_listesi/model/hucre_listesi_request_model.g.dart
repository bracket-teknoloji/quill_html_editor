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
    _$HucreListesiRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DepoKodu', instance.depoKodu);
  writeNotNull('HucreKodu', instance.hucreKodu);
  writeNotNull('FilterText', instance.filterText);
  writeNotNull('TempBarkod', instance.tempBarkod);
  writeNotNull('Inckeyno', instance.inckeyno);
  writeNotNull('DepoTanimi', instance.depoTanimi);
  writeNotNull('HareketId', instance.hareketId);
  writeNotNull('KayitTipi', instance.kayitTipi);
  writeNotNull('KayitTipiAdi', instance.kayitTipiAdi);
  writeNotNull('BelgeNo', instance.belgeNo);
  writeNotNull('BelgeTipi', instance.belgeTipi);
  writeNotNull('BelgeTipiAdi', instance.belgeTipiAdi);
  writeNotNull('Haracik', instance.haracik);
  writeNotNull('Gckod', instance.gckod);
  writeNotNull('SubeKodu', instance.subeKodu);
  writeNotNull('Tarih', instance.tarih?.toIso8601String());
  writeNotNull('StharInc', instance.stharInc);
  writeNotNull('Yedek4', instance.yedek4);
  writeNotNull('Yedek4Str', instance.yedek4Str);
  writeNotNull('Yedek8', instance.yedek8);
  writeNotNull('SeriSayisi', instance.seriSayisi);
  writeNotNull('PaketKodu', instance.paketKodu);
  writeNotNull('CariKodu', instance.cariKodu);
  return val;
}

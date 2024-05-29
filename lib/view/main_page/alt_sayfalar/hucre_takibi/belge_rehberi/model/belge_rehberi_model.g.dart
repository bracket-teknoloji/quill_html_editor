// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belge_rehberi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BelgeRehberiModelImpl _$$BelgeRehberiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BelgeRehberiModelImpl(
      belgeNo: json['BELGE_NO'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
      cariAdi: json['CARI_ADI'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      depoTanimi: json['DEPO_TANIMI'] as String?,
      kalemSayisi: (json['KALEM_SAYISI'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$BelgeRehberiModelImplToJson(
    _$BelgeRehberiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('DEPO_TANIMI', instance.depoTanimi);
  writeNotNull('KALEM_SAYISI', instance.kalemSayisi);
  return val;
}

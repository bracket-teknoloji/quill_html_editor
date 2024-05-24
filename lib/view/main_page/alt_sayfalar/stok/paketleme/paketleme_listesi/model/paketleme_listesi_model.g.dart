// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paketleme_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaketlemeListesiModelImpl _$$PaketlemeListesiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaketlemeListesiModelImpl(
      id: (json['ID'] as num?)?.toInt(),
      kodu: json['KODU'] as String?,
      kalemSayisi: (json['KALEM_SAYISI'] as num?)?.toInt(),
      kayittarihi: json['KAYITTARIHI'] == null
          ? null
          : DateTime.parse(json['KAYITTARIHI'] as String),
      kayityapankul: json['KAYITYAPANKUL'] as String?,
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      paketTuru: (json['PAKET_TURU'] as num?)?.toInt(),
      paketTuruTanimi: json['PAKET_TURU_TANIMI'] as String?,
      kilit: json['KILIT'] as String?,
      ukey: json['UKEY'] as String?,
    );

Map<String, dynamic> _$$PaketlemeListesiModelImplToJson(
    _$PaketlemeListesiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.id);
  writeNotNull('KODU', instance.kodu);
  writeNotNull('KALEM_SAYISI', instance.kalemSayisi);
  writeNotNull('KAYITTARIHI', instance.kayittarihi?.toIso8601String());
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('PAKET_TURU', instance.paketTuru);
  writeNotNull('PAKET_TURU_TANIMI', instance.paketTuruTanimi);
  writeNotNull('KILIT', instance.kilit);
  writeNotNull('UKEY', instance.ukey);
  return val;
}

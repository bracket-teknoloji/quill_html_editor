// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'depo_bakiye_durumu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepoBakiyeDurumuModelImpl _$$DepoBakiyeDurumuModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DepoBakiyeDurumuModelImpl(
      subeKodu: (json['SUBE_KODU'] as num?)?.toInt(),
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      stokKodu: json['STOK_KODU'] as String?,
      giris: (json['GIRIS'] as num?)?.toDouble(),
      cikis: (json['CIKIS'] as num?)?.toDouble(),
      bakiye: (json['BAKIYE'] as num?)?.toDouble(),
      subeAdi: json['SUBE_ADI'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      depoAdi: json['DEPO_ADI'] as String?,
    );

Map<String, dynamic> _$$DepoBakiyeDurumuModelImplToJson(
    _$DepoBakiyeDurumuModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SUBE_KODU', instance.subeKodu);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('GIRIS', instance.giris);
  writeNotNull('CIKIS', instance.cikis);
  writeNotNull('BAKIYE', instance.bakiye);
  writeNotNull('SUBE_ADI', instance.subeAdi);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('DEPO_ADI', instance.depoAdi);
  return val;
}

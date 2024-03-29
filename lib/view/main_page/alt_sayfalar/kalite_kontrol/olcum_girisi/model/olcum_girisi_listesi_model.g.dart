// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_girisi_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OlcumGirisiListesiModelImpl _$$OlcumGirisiListesiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OlcumGirisiListesiModelImpl(
      belgeNo: json['BELGE_NO'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      sira: json['SIRA'] as int?,
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      yapkod: json['YAPKOD'] as String?,
      yapacik: json['YAPACIK'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      olcumAdedi: json['OLCUM_ADEDI'] as int?,
      kabulAdet: json['KABUL_ADET'] as int?,
      sartliAdet: json['SARTLI_ADET'] as int?,
      retAdet: json['RET_ADET'] as int?,
    );

Map<String, dynamic> _$$OlcumGirisiListesiModelImplToJson(
    _$OlcumGirisiListesiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('SIRA', instance.sira);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('YAPKOD', instance.yapkod);
  writeNotNull('YAPACIK', instance.yapacik);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('OLCUM_ADEDI', instance.olcumAdedi);
  writeNotNull('KABUL_ADET', instance.kabulAdet);
  writeNotNull('SARTLI_ADET', instance.sartliAdet);
  writeNotNull('RET_ADET', instance.retAdet);
  return val;
}

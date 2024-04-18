// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_operator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OlcumOperatorModelImpl _$$OlcumOperatorModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OlcumOperatorModelImpl(
      id: json['ID'] as int?,
      isyeri: json['ISYERI'] as String?,
      adi: json['ADI'] as String?,
      istasyonKodu: json['ISTASYON_KODU'] as String?,
      istasyonTanimi: json['ISTASYON_TANIMI'] as String?,
      durum: json['DURUM'] as String?,
      sicilno: json['SICILNO'] as String?,
      adiSoyadi: json['ADI_SOYADI'] as String?,
      soyadi: json['SOYADI'] as String?,
      isletmeKodu: json['ISLETME_KODU'] as int?,
      sicilNo: json['SICIL_NO'] as String?,
      kartid: json['KARTID'] as String?,
      resim: json['RESIM'] as String?,
    );

Map<String, dynamic> _$$OlcumOperatorModelImplToJson(
    _$OlcumOperatorModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.id);
  writeNotNull('ISYERI', instance.isyeri);
  writeNotNull('ADI', instance.adi);
  writeNotNull('ISTASYON_KODU', instance.istasyonKodu);
  writeNotNull('ISTASYON_TANIMI', instance.istasyonTanimi);
  writeNotNull('DURUM', instance.durum);
  writeNotNull('SICILNO', instance.sicilno);
  writeNotNull('ADI_SOYADI', instance.adiSoyadi);
  writeNotNull('SOYADI', instance.soyadi);
  writeNotNull('ISLETME_KODU', instance.isletmeKodu);
  writeNotNull('SICIL_NO', instance.sicilNo);
  writeNotNull('KARTID', instance.kartid);
  writeNotNull('RESIM', instance.resim);
  return val;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kasa_islemleri_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KasaIslemleriRequestModel _$$_KasaIslemleriRequestModelFromJson(
        Map<String, dynamic> json) =>
    _$_KasaIslemleriRequestModel(
      baslamaTarihi: json['BaslamaTarihi'] as String?,
      bitisTarihi: json['BitisTarihi'] as String?,
      menuKodu: json['MenuKodu'] as String?,
      sayfa: json['Sayfa'] as int?,
      plasiyerKodu: json['PlasiyerKodu'] as String?,
      hesapTipi: json['HesapTipi'] as String?,
      hesapKodu: json['HesapKodu'] as String?,
      kasaKodu: json['KasaKodu'] as String?,
    );

Map<String, dynamic> _$$_KasaIslemleriRequestModelToJson(
    _$_KasaIslemleriRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BaslamaTarihi', instance.baslamaTarihi);
  writeNotNull('BitisTarihi', instance.bitisTarihi);
  writeNotNull('MenuKodu', instance.menuKodu);
  writeNotNull('Sayfa', instance.sayfa);
  writeNotNull('PlasiyerKodu', instance.plasiyerKodu);
  writeNotNull('HesapTipi', instance.hesapTipi);
  writeNotNull('HesapKodu', instance.hesapKodu);
  writeNotNull('KasaKodu', instance.kasaKodu);
  return val;
}

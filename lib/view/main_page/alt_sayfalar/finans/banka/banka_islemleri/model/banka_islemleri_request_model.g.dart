// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_islemleri_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankaIslemleriRequestModelImpl _$$BankaIslemleriRequestModelImplFromJson(Map<String, dynamic> json) => _$BankaIslemleriRequestModelImpl(
      baslamaTarihi: json['BaslamaTarihi'] as String?,
      bitisTarihi: json['BitisTarihi'] as String?,
      menuKodu: json['MenuKodu'] as String?,
      hesapTipi: json['HesapTipi'] as String?,
      hesapKodu: json['HesapKodu'] as String?,
    );

Map<String, dynamic> _$$BankaIslemleriRequestModelImplToJson(_$BankaIslemleriRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BaslamaTarihi', instance.baslamaTarihi);
  writeNotNull('BitisTarihi', instance.bitisTarihi);
  writeNotNull('MenuKodu', instance.menuKodu);
  writeNotNull('HesapTipi', instance.hesapTipi);
  writeNotNull('HesapKodu', instance.hesapKodu);
  return val;
}

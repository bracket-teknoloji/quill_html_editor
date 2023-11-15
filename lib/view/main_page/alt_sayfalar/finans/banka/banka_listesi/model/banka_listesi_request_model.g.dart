// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_listesi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankaListesiRequestModelImpl _$$BankaListesiRequestModelImplFromJson(Map<String, dynamic> json) => _$BankaListesiRequestModelImpl(
      bakiye: json['Bakiye'] as String?,
      arrHesapTipi: json['ArrHesapTipi'] as String?,
      haricHesaplarArray: json['HaricHesaplarArray'] as String?,
      sirala: json['Sirala'] as String?,
      ekranTipi: json['EkranTipi'] as String?,
      menuKodu: json['MenuKodu'] as String?,
      belgeTipi: json['BelgeTipi'] as String?,
      bankaKodu: json['BankaKodu'] as String?,
      islemModulu: json['IslemModulu'] as String?,
    );

Map<String, dynamic> _$$BankaListesiRequestModelImplToJson(_$BankaListesiRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Bakiye', instance.bakiye);
  writeNotNull('ArrHesapTipi', instance.arrHesapTipi);
  writeNotNull('HaricHesaplarArray', instance.haricHesaplarArray);
  writeNotNull('Sirala', instance.sirala);
  writeNotNull('EkranTipi', instance.ekranTipi);
  writeNotNull('MenuKodu', instance.menuKodu);
  writeNotNull('BelgeTipi', instance.belgeTipi);
  writeNotNull('BankaKodu', instance.bankaKodu);
  writeNotNull('IslemModulu', instance.islemModulu);
  return val;
}

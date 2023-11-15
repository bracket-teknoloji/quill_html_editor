// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_muhasebe_kodu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokMuhasebeKoduModel _$StokMuhasebeKoduModelFromJson(Map<String, dynamic> json) => StokMuhasebeKoduModel()
  ..muhKodu = json['MUH_KODU'] as int?
  ..adi = json['ADI'] as String?
  ..alisHesabi = json['ALIS_HESABI'] as String?
  ..satisHesabi = json['SATIS_HESABI'] as String?
  ..hesapKodu = json['HESAP_KODU'] as String?
  ..hesapAdi = json['HESAP_ADI'] as String?
  ..agm = json['AGM'] as String?
  ..hesapTipi = json['HESAP_TIPI'] as String?;

Map<String, dynamic> _$StokMuhasebeKoduModelToJson(StokMuhasebeKoduModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MUH_KODU', instance.muhKodu);
  writeNotNull('ADI', instance.adi);
  writeNotNull('ALIS_HESABI', instance.alisHesabi);
  writeNotNull('SATIS_HESABI', instance.satisHesabi);
  writeNotNull('HESAP_KODU', instance.hesapKodu);
  writeNotNull('HESAP_ADI', instance.hesapAdi);
  writeNotNull('AGM', instance.agm);
  writeNotNull('HESAP_TIPI', instance.hesapTipi);
  return val;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_muhasebe_kodu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokMuhasebeKoduModel _$StokMuhasebeKoduModelFromJson(
  Map<String, dynamic> json,
) => StokMuhasebeKoduModel()
  ..muhKodu = (json['MUH_KODU'] as num?)?.toInt()
  ..adi = json['ADI'] as String?
  ..alisHesabi = json['ALIS_HESABI'] as String?
  ..satisHesabi = json['SATIS_HESABI'] as String?
  ..hesapKodu = json['HESAP_KODU'] as String?
  ..hesapAdi = json['HESAP_ADI'] as String?
  ..agm = json['AGM'] as String?
  ..hesapTipi = json['HESAP_TIPI'] as String?;

Map<String, dynamic> _$StokMuhasebeKoduModelToJson(
  StokMuhasebeKoduModel instance,
) => <String, dynamic>{
  'MUH_KODU': ?instance.muhKodu,
  'ADI': ?instance.adi,
  'ALIS_HESABI': ?instance.alisHesabi,
  'SATIS_HESABI': ?instance.satisHesabi,
  'HESAP_KODU': ?instance.hesapKodu,
  'HESAP_ADI': ?instance.hesapAdi,
  'AGM': ?instance.agm,
  'HESAP_TIPI': ?instance.hesapTipi,
};

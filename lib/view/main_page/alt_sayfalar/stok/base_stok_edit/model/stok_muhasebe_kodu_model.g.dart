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
  if (instance.muhKodu case final value?) 'MUH_KODU': value,
  if (instance.adi case final value?) 'ADI': value,
  if (instance.alisHesabi case final value?) 'ALIS_HESABI': value,
  if (instance.satisHesabi case final value?) 'SATIS_HESABI': value,
  if (instance.hesapKodu case final value?) 'HESAP_KODU': value,
  if (instance.hesapAdi case final value?) 'HESAP_ADI': value,
  if (instance.agm case final value?) 'AGM': value,
  if (instance.hesapTipi case final value?) 'HESAP_TIPI': value,
};

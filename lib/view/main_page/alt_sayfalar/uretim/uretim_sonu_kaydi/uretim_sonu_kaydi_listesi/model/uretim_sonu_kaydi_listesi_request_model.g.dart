// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_kaydi_listesi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UretimSonuKaydiListesiRequestModel
_$UretimSonuKaydiListesiRequestModelFromJson(Map<String, dynamic> json) =>
    _UretimSonuKaydiListesiRequestModel(
      sayfa: (json['Sayfa'] as num?)?.toInt(),
      ekranTipi: json['EkranTipi'] as String?,
      belgeNo: json['BelgeNo'] as String?,
      searchText: json['SearchText'] as String?,
    );

Map<String, dynamic> _$UretimSonuKaydiListesiRequestModelToJson(
  _UretimSonuKaydiListesiRequestModel instance,
) => <String, dynamic>{
  'Sayfa': ?instance.sayfa,
  'EkranTipi': ?instance.ekranTipi,
  'BelgeNo': ?instance.belgeNo,
  'SearchText': ?instance.searchText,
};
